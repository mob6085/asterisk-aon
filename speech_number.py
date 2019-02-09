#!/usr/bin/python
# -*- coding: utf-8 -*-
import time
import memcache
import sys
import os
import asterisk.manager
    
from yandex_speech import TTS

# Функция логирования
def write_log(text) :
    file_1 = open("/var/logs/asterisk/aon/speech_log.txt", "a")
    file_1.write(time.strftime("[%Y-%m-%d %H:%M:%S] ") + text + "\n")
    file_1.close()

# Если это НЕ тестовый запуск скрипта, то подождём 30 сек для запуска и инициализации Asterisk
if len(sys.argv) == 1 or str(sys.argv[1]) != "test" :
    time.sleep(30)

# Устанавливаем соединение с буфером обмена
mc = memcache.Client(['127.0.0.1:11211'], debug=0)

# Функция обработки события Asterisk
def handle_event(event, manager):
    global to_speaker

    # Если скрипт запущен в тестовом режиме из консоли с передачей параметра test
    if len(sys.argv) > 1 and str(sys.argv[1]) == "test" :
        # Выводим на экран наименование события
        print event.name

    # Если это событие нового звонка
    if event.name == "Newstate" :
        time.sleep(2)
        # Прочитать текст из буферной переменной для произнесения роботом через динамики
        to_speaker = str(mc.get("to_speaker"))
        print to_speaker
    # Если никакого звонка нет
    else :
        # Если есть что удалить, то удаляем
        if len(to_speaker) > 0 :
            to_speaker = ""
            mc.delete("to_speaker")

try :
    # Первоначальная инициализация
    to_speaker = ""
    manager = asterisk.manager.Manager()
    manager.connect('127.0.0.1', port=5038)
    manager.login('asterisk', '*******')
        
    # Если скрипт запущен в тестовом режиме из консоли с передачей параметра test
    if len(sys.argv) > 1 and str(sys.argv[1]) == "test" :
        # Слушаем все события
        # manager.register_event('*', handle_event)
        # Слушаем события в Asterisk, передаём в обработку 'Newstate', 'Hangup', 'Bridge' при входящих звонках
        manager.register_event('Newstate', handle_event)
        manager.register_event('Hangup', handle_event)
        manager.register_event('BridgeEnter', handle_event)

    # Если запуск боевой (не тестовый)
    else :
        # Слушаем события в Asterisk, передаём в обработку 'Newstate', 'Hangup', 'Bridge' при входящих звонках
        manager.register_event('Newstate', handle_event)
        manager.register_event('Hangup', handle_event)
        manager.register_event('BridgeEnter', handle_event)
        
    # Переменная счётчик звонков телефона (сколько раз прозвенел аппарате телефона при текущем входящем вызове)
    count_rings = 0
      
    while True :
        # Если есть, что произнести в колонки
        if len(to_speaker) > 0 and to_speaker != "" and to_speaker is not None and to_speaker != None and to_speaker != "None" :
          
            # Если скрипт запущен в тестовом режиме из консоли с передачей параметра test
            if len(sys.argv) > 1 and str(sys.argv[1]) == "test" :
                # Выводим информацию на экран
                print "to_speaker = " + to_speaker
                print "count_rings = " + str(count_rings)
            # Если скрипт запущен в боевом режиме
            else :
                # Запишем информацию в логи
                write_log("to_speaker = " + to_speaker)
                write_log("count_rings = " + str(count_rings))
            
            # Если это первый звонок (первый раз прозвенел аппарат телефона при входящем вызове)
            if count_rings == 0 :            
                # Передадим в Yandex.Speech наш текст для произнесения и запишем полученный файл в формате mp3
                file_mp3 = "/home/asterisk/to_speaker/name_or_number"
                tts = TTS("zahar", "mp3", "*****-****-****-****-***********")
                tts.generate(str(to_speaker))
                tts.save(file_mp3)
                file_mp3 = file_mp3 + ".mp3"
                
                # Если это внутренний звонок, то сделаем паузу, чтобы сначала зазвенел телефонный аппарат, а потом заговорил робот,
                # иначе, при внутренних звонках, робот говорит раньше, чем звонит телефон, и этим нас пугает немного :)
                if mc.get("is_internal") is not None:
                    mc.delete("is_internal")
                    # Паузу не делаем, на трубках надо было включить "не пропускать первый ring"
                    # time.sleep(2)
                  
            # Если количество звонков меньше пяти
            if count_rings < 5 :
                to_speaker_all = '/usr/bin/mplayer -ao alsa -really-quiet -noconsolecontrols ' + file_mp3
                os.system(to_speaker_all)
            # Увеличим количество звонков на один
            count_rings += 1
        # Если в колонки произносить нечего
        else :
            # Сбросим количество звонков (установим в ноль)
            count_rings = 0
        
        # Делаем паузу запросов событий
        time.sleep(4)
        
except Exception as e :
    # При получении исключения, запишем его сообщение в логи
    file_1 = open("/var/logs/asterisk/aon/error_log.txt", "a")
    file_1.write(time.strftime("[%Y-%m-%d %H:%M:%S] ") + str(e.message) + "\n")
    file_1.close()

finally:
   # Завершим подключение к AMI Asterisk
   manager.close()
