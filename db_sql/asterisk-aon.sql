SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Структура таблицы `aon_black_list`
--

CREATE TABLE `aon_black_list` (
  `black_list_id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `black_list_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Номер телефона',
  `black_list_extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Дополнительно о номере'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `aon_black_list`
--

INSERT INTO `aon_black_list` (`black_list_id`, `black_list_number`, `black_list_extra`) VALUES
(1, '84957555949', NULL),
(2, '84996494594', NULL),
(3, '84995305715', NULL),
(4, '84959899781', NULL),
(5, '84956578758', NULL),
(6, '84997033186', NULL),
(7, '84957776675', NULL),
(8, '84954190688', NULL),
(9, '84956177329', NULL),
(10, '84957855821', NULL),
(11, '84957818668', NULL),
(12, '89161794559', NULL),
(13, '84953800467', NULL),
(14, '89671864593', NULL),
(15, '84997043209', NULL),
(16, '84997671828', NULL),
(17, '89671864461', NULL),
(18, '84959892358', NULL),
(19, '84997501374', NULL),
(20, '84955807024', NULL),
(21, '84992907957', NULL),
(22, '84951390974', NULL),
(23, '84992584247', NULL),
(25, '84957556561', NULL),
(26, '84996080768', NULL),
(27, '84957880416', NULL),
(28, '84999684682', NULL),
(29, '84995305993', NULL),
(30, '84957806007', NULL),
(31, '84992710524', NULL),
(32, '84991104907', NULL),
(34, '84952801152', NULL),
(35, '84995305771', NULL),
(36, '89523821451', NULL),
(37, '84993016149', NULL),
(38, '89629883827', NULL),
(39, '84956275211', 'asshole'),
(40, '84997877777', NULL),
(41, '84991101379', NULL),
(42, '84992905936', NULL),
(43, '84996829540', NULL),
(44, '84997533040', NULL),
(45, '84997547801', NULL),
(46, '84992156166', NULL),
(47, '84994263724', NULL),
(48, '84951070168', NULL),
(49, '84993221379', NULL),
(50, '84997058982', NULL),
(51, '84952251413', NULL),
(52, '84952087270', NULL),
(53, '84997547804', NULL),
(54, '89213284829', NULL),
(55, '84992008050', NULL),
(56, '84996854652', NULL),
(57, '84957978056', NULL),
(58, '84993711145', NULL),
(59, '84999404409', NULL),
(60, '84996789691', NULL),
(61, '84957884159', NULL),
(62, '84996788050', NULL),
(63, '84951080229', NULL),
(64, '84992710532', NULL),
(65, '84994900873', NULL),
(66, '84995030213', NULL),
(67, '84999510306', NULL),
(70, '84992130392', NULL),
(71, '84957556562', NULL),
(72, '84995305992', NULL),
(73, '89646893130', NULL),
(75, '84957839435', NULL),
(76, '84996813182', NULL),
(77, '84995000230', NULL),
(78, '84956172851', NULL),
(79, '84992120126', NULL),
(80, '84991105187', NULL),
(83, '84996788263', NULL),
(85, '84999409998', NULL),
(86, '84952981861', NULL),
(87, '84956200813', NULL),
(88, '84950986916', NULL),
(89, '84959884977', NULL),
(90, '84996813169', NULL),
(91, '84992710684', NULL),
(92, '84996788642', NULL),
(93, '84996812834', NULL),
(94, '84996812869', NULL),
(95, '84996813181', NULL),
(96, '84959253061', NULL),
(97, '84996812838', NULL),
(98, '84996788163', NULL),
(101, '84951503997', NULL),
(103, '84957273062', NULL),
(104, '89655685770', NULL),
(105, '89061062607', NULL),
(106, '89634447245', NULL),
(107, '89614288597', NULL),
(108, '84991107963', NULL),
(109, '84957272700', NULL),
(110, '84951203631', NULL),
(111, '84957855827', NULL),
(112, '84957880421', NULL),
(113, '84992701798', NULL),
(114, '84950129863', NULL),
(115, '84952872375', NULL),
(116, '84959808171', 'asshole'),
(117, '84957853593', NULL),
(118, '84952760411', NULL),
(119, '89677607794', NULL),
(120, '89160066152', 'asshole'),
(121, '84957555137', NULL),
(122, '89635348676', NULL),
(123, '89034420647', NULL),
(124, '89646353016', NULL),
(125, '89646318253', NULL),
(126, '84951501392', 'asshole'),
(127, '89661425136', NULL),
(128, '84952492040', NULL),
(129, '89601851088', NULL),
(131, '84955393673', NULL),
(132, '84957556540', NULL),
(133, '84951505124', NULL),
(134, '84991101926', 'asshole'),
(135, '84994900624', 'asshole'),
(136, '84956461356', 'asshole'),
(137, '84953740397', 'asshole'),
(138, '84995860297', 'asshole'),
(141, '84993221715', 'asshole'),
(142, '84953693099', NULL),
(143, '84992703846', 'asshole'),
(144, '84994551738', 'asshole'),
(145, '84992703844', 'asshole'),
(152, '84951210720', 'asshole'),
(153, '84991100013', 'asshole'),
(154, '84951343739', 'asshole'),
(155, '84950985133', 'asshole'),
(156, '84957301703', 'asshole'),
(158, '84951377146', 'asshole'),
(159, '84952762754', NULL),
(161, '84995039327', 'asshole'),
(162, '84993503440', 'asshole'),
(163, '84952597109', 'asshole'),
(164, '84951210228', 'asshole'),
(165, '84951976082', 'asshole'),
(166, '84994263723', 'asshole'),
(167, '84952597117', 'asshole'),
(168, '84956642807', 'asshole');

-- --------------------------------------------------------

--
-- Структура таблицы `aon_black_list_execution_time`
--

CREATE TABLE `aon_black_list_execution_time` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT 'День недели',
  `black_list_time_start` time DEFAULT NULL COMMENT 'Время С',
  `black_list_time_finish` time DEFAULT NULL COMMENT 'Время ДО',
  `speaker_level` tinyint(1) DEFAULT NULL COMMENT 'Уровень звука'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `aon_call_incomming`
--

CREATE TABLE `aon_call_incomming` (
  `call_id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `call_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Номер телефона',
  `call_datetime_incomming` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время вызова',
  `call_record_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Файл записи разговора'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `aon_phone_book_copy`
--

CREATE TABLE `aon_phone_book_copy` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Номер телефона',
  `speaker_prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Дополнтельно перед именем',
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Имя',
  `middle_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Отчество',
  `speaker_postfix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Дополнтельно после имени',
  `callerid_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'CallerID Name',
  `dont_transfer` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Не переводить звонок',
  `ringtone_file` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Файл рингтон',
  `ringtone_only` bit(1) DEFAULT NULL COMMENT 'Звучит только рингтон'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `aon_phone_book_copy`
--

INSERT INTO `aon_phone_book_copy` (`id`, `phone_number`, `speaker_prefix`, `last_name`, `first_name`, `middle_name`, `speaker_postfix`, `callerid_name`, `dont_transfer`, `ringtone_file`, `ringtone_only`) VALUES
(14, '84957555949', 'Разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(15, '84996494594', 'Разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(17, '84995305715', 'Акадо', '', '', '', '', NULL, '0', NULL, NULL),
(19, '84959899781', 'Разводка', '', '', '', 'Лечение спины бесплатное шоу', NULL, '0', NULL, NULL),
(20, '84956578758', 'Разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(22, '84997033186', 'Какая-то страховая компания', '', '', '', '', NULL, '0', NULL, NULL),
(27, '84957776675', 'Разводка', '', '', '', 'липовые счётчики ', NULL, '0', NULL, NULL),
(30, '84957855821', 'Разводка', '', '', '', 'Лотерея лохотрон', NULL, '0', NULL, NULL),
(31, '84957818668', 'разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(33, '84953800467', 'разводка', '', '', '', '. лечение позвоночника', NULL, '0', NULL, NULL),
(34, '89671864593', 'Разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(35, '89161794559', 'разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(36, '84997043209', 'Разводка', '', '', '', 'Липовые счётчики', NULL, '0', NULL, NULL),
(43, '89671864461', 'разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(48, '84959892358', 'Разводка', '', '', '', 'Лечение спины', NULL, '0', NULL, NULL),
(52, '84997501374', 'МГТС', '', '', '', 'Реклама', NULL, '0', NULL, NULL),
(53, '84955807024', 'Разводка', '', '', '', 'Пробивают данные', NULL, '0', NULL, NULL),
(54, '84992907957', 'Навязчивая реклама', '', '', '', 'Пластиковые окна', NULL, '0', NULL, NULL),
(57, '84951390974', 'Разводка', '', '', '', 'Соц опрос', NULL, '0', NULL, NULL),
(60, '84992584247', 'Разводка', '', '', '', 'Липовые счётчики', NULL, '0', NULL, NULL),
(61, '84957556561', 'Рекламщики', '', '', '', '', NULL, '0', NULL, NULL),
(62, '84996080768', 'Разводка', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(63, '84957880416', 'Рекламщики какие-то', '', '', '', '', NULL, '0', NULL, NULL),
(64, '84999684682', 'Пластиковые окна', '', '', '', '', NULL, '0', NULL, NULL),
(65, '84995305993', 'Разводка липовые счётчики', '', '', '', '', NULL, '0', NULL, NULL),
(67, '84957806007', 'Разводка. Липовые счётчики', '', '', '', '', NULL, '0', NULL, NULL),
(68, '84956177329', 'Социологические опросы', '', '', '', '', NULL, '0', NULL, NULL),
(70, '84992710524', 'Разводка.', '', '', '', 'липовые счётчики', NULL, '0', NULL, NULL),
(72, '84991104907', 'Предлагают окна', '', '', '', '', NULL, '0', NULL, NULL),
(74, '84952801152', 'Разводка', '', '', '', '. Липовые счётчики', NULL, '0', NULL, NULL),
(75, '84995305771', 'Разводка', '', '', '', '', NULL, '0', NULL, NULL),
(76, '84993016149', 'Разводка', '', '', '', '', NULL, '0', NULL, NULL),
(77, '89629883827', 'Хрен какой-то', '', '', '', '', NULL, '0', NULL, NULL),
(79, '84956275211', 'Предлагают окна', '', '', '', '', NULL, '0', NULL, NULL),
(82, '84997877777', 'Центр мониторинга общественного мнения', '', '', '', '', NULL, '0', NULL, NULL),
(83, '84991101379', 'Предлагают окна', '', '', '', '', NULL, '0', NULL, NULL),
(84, '84992905936', 'Предлагают окна', '', '', '', '', 'SPAM', '0', NULL, NULL),
(85, '84996829540', 'Молчат. Мошенники', '', '', '', '', NULL, '0', NULL, NULL),
(86, '84997533040', 'Разводка. липовые счётчики', '', '', '', '', NULL, '0', NULL, NULL),
(89, '84997547801', 'Разводка. Липовые счётчики', '', '', '', '', NULL, '0', NULL, NULL),
(92, '84994263724', 'Реклама какая-то', '', '', '', '', NULL, '0', NULL, NULL),
(93, '84951070168', 'Политическая агитация от имени кандидата в госдуму', '', '', '', '', NULL, '0', NULL, NULL),
(94, '84993221379', 'Пластиковые окна', '', '', '', '', 'SPAM', '0', NULL, NULL),
(95, '84997058982', 'Пластиковые окна', '', '', '', '', NULL, '0', NULL, NULL),
(96, '84952251413', 'Акадо отдел продаж', '', '', '', '', 'Spam', '0', NULL, NULL),
(99, '84997547804', 'Липовые счётчики', '', '', '', '', NULL, '0', NULL, NULL),
(101, '89213284829', 'Социологические опросы', '', '', '', '', NULL, '0', NULL, NULL),
(102, '84992008050', 'Социальная защита по трудоустройству инвалидов', '', '', '', '', NULL, '0', NULL, NULL),
(104, '84996854652', 'Пластиковые окна', '', '', '', '', 'Spam', '0', NULL, NULL),
(105, '84957978056', 'Лечение позвоничника', '', '', '', '', NULL, '0', NULL, NULL),
(106, '84993711145', 'Водосчётчики', '', '', '', '', NULL, '0', NULL, NULL),
(107, '84999404409', 'Водосчётчики', '', '', '', '', NULL, '0', NULL, NULL),
(108, '84996789691', 'Лечение позвоночника', '', '', '', '', NULL, '0', NULL, NULL),
(110, '84957884159', 'Интернет от МГТС', '', '', '', '', NULL, '0', NULL, NULL),
(114, '84996788050', 'Звонят и молчат', '', '', '', '', 'SPAM', '0', NULL, NULL),
(120, '84951080229', 'Пластиковые окна', '', '', '', '', NULL, '0', NULL, NULL),
(125, '84994900873', 'Пластиковые окна', '', '', '', '', NULL, '0', NULL, NULL),
(130, '84992130392', 'Молчат.', '', '', '', 'Пробивоны какие-то', 'Spam', '0', NULL, NULL),
(131, '84957556562', 'Водомонтаж', '', '', '', '', NULL, '0', NULL, NULL),
(133, '84995305992', 'Счётчики воды', '', '', '', '', 'SPAM', '0', NULL, NULL),
(134, '84957839435', 'Мошенники', '', '', '', '', '', '0', NULL, NULL),
(137, '84995000230', 'Юридическая консультация', '', '', '', '', 'Spam', '0', NULL, NULL),
(138, '84956172851', 'Предлагают GPON от МГТС.', '', '', '', ' Но он уже есть', 'Spam', '0', NULL, NULL),
(139, '84992120126', 'Косметика за кредит', '', '', '', '', 'Spam', '0', NULL, NULL),
(140, '84991105187', 'Интернет-магазин детских часов', '', '', '', '', 'Spam', '0', NULL, NULL),
(141, '84996788263', 'Лечение позвоночника', '', '', '', '', 'Spam', '0', NULL, NULL),
(143, '84999409998', 'Счётчики воды', '', '', '', '', 'Spam', '0', NULL, NULL),
(144, '84956200813', 'Юридические консультации', '', '', '', '', 'Spam', '0', NULL, NULL),
(145, '84950986916', 'Молчат. Пробивоны какие-то', '', '', '', '', 'Spam', '0', NULL, NULL),
(146, '84959884977', 'Юридические услуги', '', '', '', '', '', '0', NULL, NULL),
(149, '84996788642', 'Молчат', '', '', '', '', '', '0', NULL, NULL),
(154, '84996788163', 'Лечение позвоночника', '', '', '', '', 'SPAM', '0', NULL, NULL),
(159, '84951503997', 'Ремонт квартир', '', '', '', '', '', '0', NULL, NULL),
(160, '84957273062', 'Лечение позвоночника', '', '', '', '', '', '0', NULL, NULL),
(161, '89655685770', 'Какие-то мошенники', '', '', '', '', '', '0', NULL, NULL),
(165, '84991107963', 'Счётчики воды', '', '', '', '', '', '0', NULL, NULL),
(166, '84957272700', 'Ростелеком. опросы', '', '', '', '', 'Spam', '0', NULL, NULL),
(167, '84951203631', 'Пластиковые окна', '', '', '', '', 'Spam', '0', NULL, NULL),
(168, '84957855827', 'Мошенники, как будто из МГТС', '', '', '', '', 'Spam', '0', NULL, NULL),
(169, '84957880421', 'Мошенники, как будто из МГТС', '', '', '', '', 'Spam', '0', NULL, NULL),
(171, '84992701798', 'Как бы МГТС, но мошенники', '', '', '', '', '', '0', NULL, NULL),
(172, '84950129863', 'Звонят и молчат', '', '', '', '', '', '0', NULL, NULL),
(173, '84952872375', 'Звонят и молчат', '', '', '', '', 'Spam', '0', NULL, NULL),
(174, '84959808171', 'Рекламщики, курсы англ., питьевая вода и пр.', '', '', '', '', '', '0', NULL, NULL),
(175, '84957853593', 'МГТС впаривает услуги ', '', '', '', '', '', '0', NULL, NULL),
(176, '84952760411', 'Акадо', '', '', '', '', '', '0', NULL, NULL),
(178, '89160066152', 'Пластиковые окна', '', '', '', '', '', '0', NULL, NULL),
(179, '84957555137', 'Мошенники, как будто из МГТС', '', '', '', '', '', '0', NULL, NULL),
(183, '84951501392', 'Водосчётчики', '', '', '', '', '', '0', NULL, NULL),
(185, '84952492040', 'Onlime', '', '', '', '', '', '0', NULL, NULL),
(187, '84955393673', 'Onlime', '', '', '', '', '', '0', NULL, NULL),
(188, '84957556540', 'Якобы из колл-центра МГТС', '', '', '', '', '', '0', NULL, NULL),
(189, '84951505124', 'Пластиковые окна', '', '', '', '', '', '0', NULL, NULL),
(190, '84991101926', 'Водосчётчики', '', '', '', '', '', '0', NULL, NULL),
(192, '84994900624', 'Пластиковые окна ', '', '', '', '', '', '0', NULL, NULL),
(193, '84956461356', 'Пластиковые окна ', '', '', '', '', '', '0', NULL, NULL),
(194, '84953740397', 'Юридическая консультация', '', '', '', '', '', '0', NULL, NULL),
(195, '84995860297', 'Юридическая консультация', '', '', '', '', '', '0', NULL, NULL),
(198, '84993221715', 'Пластиковые окна', '', '', '', '', '', '0', NULL, NULL),
(199, '84953693099', 'Мошенники', '', '', '', '', '', '0', NULL, NULL),
(200, '84992703846', 'Лечение позвоночника', '', '', '', '', '', '0', NULL, NULL),
(201, '84994551738', 'Пластиковые окна', '', '', '', '', '', '0', NULL, NULL),
(202, '84992703844', 'Лечение позвоночника', '', '', '', '', '', '0', NULL, NULL),
(203, '84951210720', 'Пластиковые окна', '', '', '', '', '', '0', NULL, NULL),
(204, '84991100013', 'Водосчётчики', '', '', '', '', '', '0', NULL, NULL),
(205, '84951343739', 'Юридическая помощь', '', '', '', '', '', '0', NULL, NULL),
(206, '84950985133', 'Юридическая консультация', '', '', '', '', '', '0', NULL, NULL),
(207, '84957301703', 'Что-то впаривают от МГТС', '', '', '', '', '', '0', NULL, NULL),
(208, '84951377146', 'Юридические услуги. Робот говорит', '', '', '', '', '', '0', NULL, NULL),
(209, '84952762754', 'АКАДО', '', '', '', '', '', '0', NULL, NULL),
(211, '84995039327', 'Лечение позвоночника', '', '', '', '', '', '0', NULL, NULL),
(212, '84993503440', 'Пластиковые окна', '', '', '', '', '', '0', NULL, NULL),
(213, '84952597109', 'Водосчётчики', '', '', '', '', '', '0', NULL, NULL),
(214, '84951210228', 'Вонючие юристы', '', '', '', '', '', '0', NULL, NULL),
(215, '84951976082', 'Впаривают интернет. Провайдер неизвестен', '', '', '', '', '', '0', NULL, NULL),
(217, '84994263723', 'Какие-то опросы непонятные', '', '', '', '', '', '0', NULL, NULL),
(218, '84952597117', 'Водосчётчики', '', '', '', '', '', '0', NULL, NULL),
(219, '84956642807', 'Лечение позвоночника', '', '', '', '', '', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `aon_settings`
--

CREATE TABLE `aon_settings` (
  `setting_id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `setting_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название параметра настройки',
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Значение параметра настройки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `aon_settings`
--

INSERT INTO `aon_settings` (`setting_id`, `setting_name`, `setting_value`) VALUES
(1, 'silent_mode', '0'),
(2, 'white_list', '1'),
(3, 'black_list', '1'),
(4, 'altufievo_to_meshchovsk', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `aon_silent_mode_execution_time`
--

CREATE TABLE `aon_silent_mode_execution_time` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `day_of_week` tinyint(1) NOT NULL COMMENT 'День недели',
  `silent_mode_time_start` time NOT NULL COMMENT 'Время С',
  `silent_mode_time_finish` time NOT NULL COMMENT 'Время ДО',
  `speaker_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Уровень звука'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `aon_white_list`
--

CREATE TABLE `aon_white_list` (
  `white_list_id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `white_list_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Номер телефона',
  `white_list_extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Дополнительно о номере'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `aon_white_list_execution_time`
--

CREATE TABLE `aon_white_list_execution_time` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'ID записи',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT 'День недели',
  `white_list_time_start` time DEFAULT NULL COMMENT 'Время С',
  `white_list_time_finish` time DEFAULT NULL COMMENT 'Время ДО',
  `speaker_level` tinyint(1) DEFAULT NULL COMMENT 'Уровень звука'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `aon_white_list_execution_time`
--

INSERT INTO `aon_white_list_execution_time` (`id`, `day_of_week`, `white_list_time_start`, `white_list_time_finish`, `speaker_level`) VALUES
(3, 1, '00:00:00', '11:00:00', 10),
(7, 1, '23:00:00', '23:59:59', 10),
(8, 2, '00:00:00', '10:00:00', 10),
(9, 2, '23:00:00', '23:59:59', 10),
(10, 3, '00:00:00', '11:00:00', 10),
(11, 3, '23:00:00', '23:59:59', 10),
(12, 4, '00:00:00', '11:00:00', 10),
(13, 4, '23:00:00', '23:59:59', 10),
(14, 5, '00:00:00', '11:00:00', 10),
(15, 5, '23:00:00', '23:59:59', 10),
(16, 6, '00:00:00', '12:00:00', 10),
(17, 6, '23:45:00', '23:59:59', 10),
(18, 7, '00:00:00', '12:00:00', 10),
(19, 7, '23:00:00', '23:59:59', 10);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `aon_black_list`
--
ALTER TABLE `aon_black_list`
  ADD PRIMARY KEY (`black_list_id`),
  ADD UNIQUE KEY `black_list_number` (`black_list_number`);

--
-- Индексы таблицы `aon_black_list_execution_time`
--
ALTER TABLE `aon_black_list_execution_time`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `aon_call_incomming`
--
ALTER TABLE `aon_call_incomming`
  ADD PRIMARY KEY (`call_id`);

--
-- Индексы таблицы `aon_phone_book_copy`
--
ALTER TABLE `aon_phone_book_copy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Индексы таблицы `aon_settings`
--
ALTER TABLE `aon_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Индексы таблицы `aon_silent_mode_execution_time`
--
ALTER TABLE `aon_silent_mode_execution_time`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `aon_white_list`
--
ALTER TABLE `aon_white_list`
  ADD PRIMARY KEY (`white_list_id`),
  ADD UNIQUE KEY `white_list_number` (`white_list_number`);

--
-- Индексы таблицы `aon_white_list_execution_time`
--
ALTER TABLE `aon_white_list_execution_time`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `aon_black_list`
--
ALTER TABLE `aon_black_list`
  MODIFY `black_list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи', AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT для таблицы `aon_black_list_execution_time`
--
ALTER TABLE `aon_black_list_execution_time`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи';

--
-- AUTO_INCREMENT для таблицы `aon_call_incomming`
--
ALTER TABLE `aon_call_incomming`
  MODIFY `call_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи';

--
-- AUTO_INCREMENT для таблицы `aon_phone_book_copy`
--
ALTER TABLE `aon_phone_book_copy`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи', AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT для таблицы `aon_settings`
--
ALTER TABLE `aon_settings`
  MODIFY `setting_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `aon_silent_mode_execution_time`
--
ALTER TABLE `aon_silent_mode_execution_time`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи';

--
-- AUTO_INCREMENT для таблицы `aon_white_list`
--
ALTER TABLE `aon_white_list`
  MODIFY `white_list_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи';

--
-- AUTO_INCREMENT для таблицы `aon_white_list_execution_time`
--
ALTER TABLE `aon_white_list_execution_time`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID записи', AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
