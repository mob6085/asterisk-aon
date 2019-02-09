#!/usr/bin/python
# -*- coding: utf-8 -*-
import memcache
import sys
import time
import requests
import MySQLdb
import string
import os
from asterisk.agi import AGI

# Функция логирования
def write_log(text):
    file_1 = open("/var/logs/asterisk/aon/debug_log.txt", "a")
    file_1.write(time.strftime("[%Y-%m-%d %H:%M:%S] ") + text + "\n")
    file_1.close()

# Функция отправки писем через Mailgun
def mailgun_send_message(email, subject, text):
    return requests.post(
            "https://api.mailgun.net/v3/****.ru/messages",
            timeout=1,
            auth=("api", "key-f3******82"),
            data={"from": "CallerID <callerid@****.ru>",
                        "to": [email],
                        "subject": subject,
                        "html": text})
                        
# Функция отклонения входящего вызова
def reject_call(black_list = False):
    global agi, asshole

    if black_list:
        # Установим в переменную AGI признак определения спамера (тот, кто в чёрном списке)
        agi.set_variable('is_spam', '1')
        
        # Если это м***ки полные (водосчётчики, пластиковые окна и пр.),
        # то установим в переменную AGI признак м***ка
        if asshole:
            agi.set_variable('is_asshole', '1')
            # И установим признак м***ка в False,
            # чтобы для следующего звонящего не распространялось
            asshole = False 
    else:
        # Установим в переменную AGI признак записи автоответчика
        agi.set_variable('answering_machine', '1')
    
    return True
                        
# Функция проверки включения режима (тишины/белый список/чёрный список) по расписанию
def check_mode_on(name_mode):
    global DB_cursor
    query = """SELECT *
                FROM aon_""" + name_mode + """_execution_time
                WHERE (day_of_week = %s OR day_of_week - 7 = %s)
                  AND """ + name_mode + """_time_start <= %s
                  AND """ + name_mode + """_time_finish > %s"""
    if DB_cursor.execute(query, (time.strftime('%w'), time.strftime('%w'), time.strftime('%H:%M:%S'), time.strftime('%H:%M:%S'))) == 0:
        return False
    else:
        return True
        
# Функция проверки номера в списке (белый/чёрный)
def check_in_list(name_list, call_number):
    global DB_cursor, asshole
    query = """SELECT *
                FROM aon_""" + name_list + """_list
                WHERE """ + name_list + """_list_number = %s
                LIMIT 1"""
    if DB_cursor.execute(query, (call_number, )) == 0:
        return False
    else:
        row = DB_cursor.fetchone()
        asshole = name_list == "black" and row['black_list_extra'] == "asshole"
        return True

try :
    # Признак того, что звонящий м***к полный (водосчётчики, пластиковые окна и пр.)
    # Используется для передачи в AGI 
    # и последующего воспроизведения для него вских ругательств
    asshole = False;
    
    # Подключение к базе данных
    DB_connnect = MySQLdb.connect(host="db_host", user="db_user", passwd="db_pass", db="db_name")
    DB_cursor = DB_connnect.cursor(cursorclass = MySQLdb.cursors.DictCursor)
    DB_cursor.execute('SET NAMES `utf8`')
    
    # Запросим настройки режимов обработки звонков
    query = """SELECT *
                FROM aon_settings"""
    DB_cursor.execute(query)
    result = DB_cursor.fetchall()
    
    # Соберём настройки режимов обработки звонков в отдельный словарь
    settings = {}
    for param in result:
        settings[param['setting_name']] = param['setting_value']
    
    # Устанавливаем соединение с буфером обмена
    mc = memcache.Client(['127.0.0.1:11211'], debug=0)
    
    # Объектная переменная для работы с AGI Asterisk
    agi = AGI()
    
    # Имя звукового файла
    record_file_name = time.strftime("%Y-%m-%d_%H-%M-%S")
    agi.set_variable('record_file_name', record_file_name)
    
    # Установим в переменную AGI признак записи автоответчика
    agi.set_variable('answering_machine', '0')
    
    #Номинальная длина телефонного номера в символах (цифрах)
    nominal_number_length = 11
    
    #Длина внутреннего телефонного номера в символах (цифрах)
    short_number_length = 3    
    
    # Номер телефона входящего звонка
    call_number = str(agi.env["agi_callerid"]).strip()
    write_log(call_number)
    
    # Если длина номера равна 10, то добавим 8 в начало номера
    if len(call_number) == 10:
        call_number = "8" + call_number
        
    # Если длина номера равна 3, т.е. это внутренний звонок,
    if len(call_number) == 3:
        
        # Установим признак внутреннего звонка для передачи его в speech_number.py
        # Там в speech_number.py сделаем паузу, чтобы сначала зазвенел телефонный аппарат, а потом заговорил робот,
        # иначе, при внутренних звонках, робот говорит раньше, чем звонит телефон, и этим нас пугает немного :)
        mc.set("is_internal", 1, 20)
                
    # Если поступил звонок от номера 90 (номер-шлюз звонка с линии МГТС)
    if call_number == "90":
    
        # Если у нас уже был ранее определён номер и мы его сохранили в буферной переменной
        if mc.get("call_number") is not None:
            
            # Установим из буферной переменной номер CallerID входящего с городской линии
            agi.set_callerid(str(mc.get("call_number")))
            
            # Выберем из базы данные о входящем номере
            query = """SELECT callerid_name
                        FROM aon_phone_book AS apb
                        WHERE apb.phone_number = %s
                        LIMIT 1"""
            DB_cursor.execute(query, (str(mc.get("call_number")).strip(), ))        
            row = DB_cursor.fetchone()
    
            # Если запрос вернул данные
            if row is not None:    
                # Установить имя (НЕ номер) входящего звонка для отображения этого имени на телефонных аппаратах и программных SIP-клиентах
                agi.set_variable('callerid_name', str(row['callerid_name']))
                
        # Если номер не был определён, то это скрытый номер
        else:
            # Отклоняем звонок
            reject_call()            
        # Закончить выполнение программы
        exit()
    else:
        # Установить в буферную переменную номер телефона входящего звонка из МГТС
        mc.set("call_number", call_number, 10)
    
    # Запишем в базу входящий звонок
    query = 'INSERT INTO `aon_call_incomming` (`call_number`, `call_record_file_name`) VALUES (%s, %s)'
    DB_cursor.execute(query, (call_number, record_file_name, ))
    DB_connnect.commit()
    
    # Выберем из базы данные о входящем номере
    query = """SELECT *
                FROM aon_phone_book AS apb
                WHERE apb.phone_number = %s
                LIMIT 1"""
    DB_cursor.execute(query, (call_number, ))
    row = DB_cursor.fetchone()

    # Переменная-признак неизвестного номера (нет такого номера в телефонной книге)
    unknown_number = True

    # Если запрос вернул данные
    if row is not None:
        # Установим в переменную AGI значение имени звонящего. Имя берём из предыдущего SQL-запроса
        agi.set_variable('callerid_name', str(row['callerid_name']))
        # Установим признак неизвестного номера в False? т.е. номер известен (есть в телефонной книге)
        unknown_number = False
        
    # Если длина номера равно nominal_number_length, то сохраним для письма-уведомления отформатированный номер в формате 8 (999) 999-99-99
    if len(call_number.strip()) == nominal_number_length:
        email_subject = call_number[0] + " (" + call_number[1] + call_number[2] + call_number[3] + ") " + call_number[4] + call_number[5] + call_number[6] + "-" + call_number[7] + call_number[8] + "-" + call_number[9] + call_number[10]
    # Если длина номера равно short_number_length (внутренний номер), то сохраним для письма-уведомления отформатированный номер в формате 999
    elif len(call_number.strip()) == short_number_length:
        email_subject = call_number[0] + call_number[1] + call_number[2]
    # Если длина больше nominal_number_length, то оставим номер для письма неотформатированным
    else:
        email_subject = call_number
    
    # Переменная для хранения текста для произнесения роботом через динамики
    to_speaker = ""
    
    # Соберём в переменную текст для произнесения номера
    if row is not None:
        if str(row['speaker_prefix']) != None:
            to_speaker += str(row['speaker_prefix'])
        if str(row['last_name']) != None:
            to_speaker += " " + str(row['last_name'])
        if str(row['first_name']) != None:
            to_speaker += " " + str(row['first_name'])
        if str(row['middle_name']) != None:
            to_speaker += " " + str(row['middle_name'])
        if str(row['speaker_postfix']) != None:
            to_speaker += " " + str(row['speaker_postfix'])
   
    # Удалим в начале и конце все пробелы
    to_speaker = to_speaker.strip()
    
    # Соберём тему и текст для письма-уведомления
    email_subject += " " + to_speaker
    email_text     = time.strftime('%d.%m.%Y\n%H:%M:%S\n')
    email_text    += "Входящий звонок: " + email_subject
    
    # Переменная, содержащая информацию находится ли номер входящего звонка в чёрном списке
    call_number_blacklisted = check_in_list("black", call_number)
    
    # Если номер в чёрном списке, то добавим к теме письма слово "СПАМ"
    if call_number_blacklisted:
        email_subject = "СПАМ " + email_subject
    
    # Если номер в чёрном списке или это неизвестный номер
    if call_number_blacklisted or unknown_number:
        # Добавим ссылку на сайт проверки и получения отзывов о данном номере
        email_text += "<p><a href='https://zvonil.octo.net/number.aspx/" + call_number + "' target='_blank'> Подробнее </a></p>"
    
    # Отправим письмо-уведомление
    mailgun_send_message("***@****.ru", email_subject, email_text)
    
    # Переменная-признак отклонения звонка
    call_reject = False
    
    # Если включён режим тишины, то присваиваем признак отклонения входящего вызова
    if settings['silent_mode'] == '1':
        call_reject = True
    # Если включён режим тишины по расписанию, то проверяем на совпадение текущего времени с расписанием
    elif settings['silent_mode'] == '2':
        # Если есть совпадение, то вернёт True и входящий вызов надо отклонить, в противном случае False и отклонять не надо
        call_reject = check_mode_on("silent_mode")
    
    # Если звонок решено отклонить, то отклоняем его и завершаем программу
    if call_reject:
        reject_call(call_number_blacklisted)
        sys.exit()
    
    # Если включён режим белого списка, то проверим, есть этот номер в белом списке
    if settings['white_list'] == '1':
        # Если номера в белом списке нет, то присваиваем признак отклонения входящего вызова 
        if check_in_list("white", call_number) == False:
            call_reject = True
    # Если включён режим белого списка по расписанию, то проверяем на совпадение текущего времени с расписанием
    elif settings['white_list'] == '2':
        # Если есть совпадение, то проверяем наличие номера в белом списке
        if check_mode_on("white_list") == True:
            # Если номера в белом списке нет, то присваиваем признак отклонения входящего вызова
            if check_in_list("white", call_number) == False:
                call_reject = True
    
    # Если звонок решено отклонить, то отклоняем его и завершаем программу
    if call_reject:
        reject_call(call_number_blacklisted)
        sys.exit()
    
    # Если включён режим чёрного списка, то проверим, есть этот номер в чёрном списке    
    if settings['black_list'] == '1':
        # Если номер в чёрном списке есть, то присваиваем признак отклонения входящего вызова
        call_reject = check_in_list("black", call_number)
    # Если включён режим чёрного списка по расписанию, то проверяем на совпадение текущего времени с расписанием
    elif settings['black_list'] == '2':
        # Если есть совпадение, то проверяем наличие номера в чёрном списке
        if check_mode_on("black_list") == True:
            # Если номер в чёрном списке есть, то присваиваем признак отклонения входящего вызова
            call_reject = check_in_list("black", call_number)
            
    # Если звонок решено отклонить, то отклоняем его и завершаем программу
    if call_reject:
        reject_call(call_number_blacklisted)
        sys.exit()
        
    # Если в базе нет данных о номере входящего сообщения, то надо произнести номер
    if len(to_speaker) == 0:
        # Если в номере nominal_number_length цифр, то будет произносить по формату 8 999 999 99 99
        if len(call_number.strip()) == nominal_number_length:
            to_speaker = call_number[0] + " " + call_number[1] + call_number[2] + call_number[3] + " " + call_number[4] + call_number[5] + call_number[6] + " " + call_number[7] + call_number[8] + " " + call_number[9] + call_number[10]
        # Если длина номера равно short_number_length (внутренний номер), то будет произносить по формату 999
        elif len(call_number.strip()) == short_number_length:
            to_speaker = call_number[0] + call_number[1] + call_number[2]
        # Если в номере более nominal_number_length цифр, то будет произносить по одной цифре
        else:
            to_speaker = "Нестандартный номер. "
            for c in call_number:
                to_speaker += c + " "
        
    # Закроем подключение к базе MySQL
    DB_cursor.close()
    DB_connnect.close()

except Exception as e :
    # При получении исключения, запишем его сообщение в логи
    file_1 = open("/var/logs/asterisk/aon/error_log.txt", "a")
    file_1.write(time.strftime("[%Y-%m-%d %H:%M:%S] ") + str(e.message) + "\n")
    file_1.close()
    
    # Закроем подключение к базе MySQL
    DB_cursor.close()
    DB_connnect.close()
