-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 29 2014 г., 16:50
-- Версия сервера: 5.5.35-log
-- Версия PHP: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `dental`
--

-- --------------------------------------------------------

--
-- Структура таблицы `sym_anti_brute_force`
--

CREATE TABLE IF NOT EXISTS `sym_anti_brute_force` (
  `IP` varchar(16) NOT NULL,
  `LastAttempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FailedCount` int(5) unsigned NOT NULL DEFAULT '1',
  `UA` varchar(1024) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Source` varchar(100) DEFAULT NULL,
  `Hash` char(36) NOT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_anti_brute_force_bl`
--

CREATE TABLE IF NOT EXISTS `sym_anti_brute_force_bl` (
  `IP` varchar(16) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_anti_brute_force_gl`
--

CREATE TABLE IF NOT EXISTS `sym_anti_brute_force_gl` (
  `IP` varchar(16) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FailedCount` int(5) unsigned NOT NULL DEFAULT '1',
  `Source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_anti_brute_force_wl`
--

CREATE TABLE IF NOT EXISTS `sym_anti_brute_force_wl` (
  `IP` varchar(16) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_authors`
--

CREATE TABLE IF NOT EXISTS `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

--
-- Структура таблицы `sym_cache`
--

CREATE TABLE IF NOT EXISTS `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_ckeditor_link_templates`
--

CREATE TABLE IF NOT EXISTS `sym_ckeditor_link_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `field_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_ckeditor_presets`
--

CREATE TABLE IF NOT EXISTS `sym_ckeditor_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `toolbar` text,
  `plugins` text,
  `resize` int(1) DEFAULT NULL,
  `outline` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `sym_ckeditor_presets`
--

INSERT INTO `sym_ckeditor_presets` (`id`, `name`, `toolbar`, `plugins`, `resize`, `outline`) VALUES
(7, 'Minimal', '[''Bold'', ''Italic'', ''Strike'', ''-'', ''Subscript'', ''Superscript''],\r\n[''Link'', ''Unlink''],\r\n[''Source'']', NULL, NULL, NULL),
(8, 'Normal', '[''Bold'', ''Italic'', ''Strike'', ''-'', ''Subscript'', ''Superscript''],\r\n[''NumberedList'', ''BulletedList'', ''-'', ''Outdent'', ''Indent'', ''Blockquote''],\r\n[''Image'', ''oembed''],[''Link'', ''Unlink''],\r\n[''HorizontalRule''],\r\n[''Source'', ''Maximize'']', NULL, 1, 1),
(9, 'Full', '{ name: ''document'',    items : [ ''Source'',''-'',''Save'',''NewPage'',''DocProps'',''Preview'',''Print'',''-'',''Templates'' ] },\r\n    { name: ''clipboard'',   items : [ ''Cut'',''Copy'',''Paste'',''PasteText'',''PasteFromWord'',''-'',''Undo'',''Redo'' ] },\r\n    { name: ''editing'',     items : [ ''Find'',''Replace'',''-'',''SelectAll'',''-'',''SpellChecker'', ''Scayt'' ] },\r\n    { name: ''forms'',       items : [ ''Form'', ''Checkbox'', ''Radio'', ''TextField'', ''Textarea'', ''Select'', ''Button'', ''ImageButton'', ''HiddenField'' ] },\r\n    ''/'',\r\n    { name: ''basicstyles'', items : [ ''Bold'',''Italic'',''Underline'',''Strike'',''Subscript'',''Superscript'',''-'',''RemoveFormat'' ] },\r\n    { name: ''paragraph'',   items : [ ''NumberedList'',''BulletedList'',''-'',''Outdent'',''Indent'',''-'',''Blockquote'',''CreateDiv'',''-'',''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl'' ] },\r\n    { name: ''links'',       items : [ ''Link'',''Unlink'',''Anchor'' ] },\r\n    { name: ''insert'',      items : [ ''Image'',''Flash'',''Table'',''HorizontalRule'',''Smiley'',''SpecialChar'',''PageBreak'' ] },\r\n    ''/'',\r\n    { name: ''styles'',      items : [ ''Styles'',''Format'',''Font'',''FontSize'' ] },\r\n    { name: ''colors'',      items : [ ''TextColor'',''BGColor'' ] },\r\n    { name: ''tools'',       items : [ ''Maximize'', ''ShowBlocks'',''-'',''About'' ] }', NULL, 1, 1),
(10, 'Minimal', '[''Bold'', ''Italic'', ''Strike'', ''-'', ''Subscript'', ''Superscript''],\r\n[''Link'', ''Unlink''],\r\n[''Source'']', NULL, NULL, NULL),
(11, 'Normal', '[''Bold'', ''Italic'', ''Strike'', ''-'', ''Subscript'', ''Superscript''],\r\n[''NumberedList'', ''BulletedList'', ''-'', ''Outdent'', ''Indent'', ''Blockquote''],\r\n[''Image'', ''oembed''],[''Link'', ''Unlink''],\r\n[''HorizontalRule''],\r\n[''Source'', ''Maximize'']', NULL, 1, 1),
(12, 'Full', '{ name: ''document'',    items : [ ''Source'',''-'',''Save'',''NewPage'',''DocProps'',''Preview'',''Print'',''-'',''Templates'' ] },\r\n    { name: ''clipboard'',   items : [ ''Cut'',''Copy'',''Paste'',''PasteText'',''PasteFromWord'',''-'',''Undo'',''Redo'' ] },\r\n    { name: ''editing'',     items : [ ''Find'',''Replace'',''-'',''SelectAll'',''-'',''SpellChecker'', ''Scayt'' ] },\r\n    { name: ''forms'',       items : [ ''Form'', ''Checkbox'', ''Radio'', ''TextField'', ''Textarea'', ''Select'', ''Button'', ''ImageButton'', ''HiddenField'' ] },\r\n    ''/'',\r\n    { name: ''basicstyles'', items : [ ''Bold'',''Italic'',''Underline'',''Strike'',''Subscript'',''Superscript'',''-'',''RemoveFormat'' ] },\r\n    { name: ''paragraph'',   items : [ ''NumberedList'',''BulletedList'',''-'',''Outdent'',''Indent'',''-'',''Blockquote'',''CreateDiv'',''-'',''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl'' ] },\r\n    { name: ''links'',       items : [ ''Link'',''Unlink'',''Anchor'' ] },\r\n    { name: ''insert'',      items : [ ''Image'',''Flash'',''Table'',''HorizontalRule'',''Smiley'',''SpecialChar'',''PageBreak'' ] },\r\n    ''/'',\r\n    { name: ''styles'',      items : [ ''Styles'',''Format'',''Font'',''FontSize'' ] },\r\n    { name: ''colors'',      items : [ ''TextColor'',''BGColor'' ] },\r\n    { name: ''tools'',       items : [ ''Maximize'', ''ShowBlocks'',''-'',''About'' ] }', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sym_entries`
--

CREATE TABLE IF NOT EXISTS `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_entries_data_2`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_entries_data_3`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_entries_data_4`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_entries_data_5`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_extensions`
--

CREATE TABLE IF NOT EXISTS `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `sym_extensions`
--

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES
(1, 'subsectionmanager', 'enabled', '3.5.1'),
(2, 'breadcrumb', 'enabled', '1.2'),
(27, 'ckeditor', 'enabled', '1.4'),
(4, 'xssfilter', 'enabled', '1.3'),
(5, 'debugdevkit', 'enabled', '1.3'),
(6, 'email_template_manager', 'enabled', '5.1'),
(7, 'codemirror', 'enabled', '1.3'),
(26, 'code_editor', 'enabled', '0.1.2'),
(9, 'html5_doctype', 'enabled', '1.3.1'),
(10, 'image_index_preview', 'enabled', '1.4'),
(11, 'jit_image_manipulation', 'enabled', '1.21'),
(12, 'lang_russian', 'enabled', '0.4'),
(13, 'order_entries', 'enabled', '1.10.1'),
(14, 'page_headers', 'enabled', '1.2'),
(15, 'profiledevkit', 'enabled', '1.4'),
(17, 'recaptcha', 'disabled', '1.0.1'),
(18, 'selectbox_link_field', 'enabled', '1.30'),
(19, 'uniqueinputfield', 'enabled', '1.5'),
(20, 'uniqueuploadfield', 'enabled', '1.8.1'),
(21, 'url_router', 'enabled', '2.0.2'),
(22, 'datetime', 'enabled', '3.3'),
(23, 'anti_brute_force', 'enabled', '1.3.4'),
(25, 'configuration', 'enabled', '1.7.1');

-- --------------------------------------------------------

--
-- Структура таблицы `sym_extensions_delegates`
--

CREATE TABLE IF NOT EXISTS `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=70 ;

--
-- Дамп данных таблицы `sym_extensions_delegates`
--

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES
(1, 1, '/backend/', 'AdminPagePreGenerate', '__appendAssets'),
(2, 1, '/blueprints/datasources/', 'DatasourcePostCreate', '__clearSubsectionCache'),
(3, 1, '/blueprints/datasources/', 'DatasourcePostEdit', '__clearSubsectionCache'),
(4, 1, '/blueprints/datasources/', 'DatasourcePreDelete', '__clearSubsectionCache'),
(5, 1, '/frontend/', 'DataSourceEntriesBuilt', '__prepareSubsection'),
(68, 27, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPresets'),
(67, 27, '/backend/', 'ModifyTextBoxFullFieldPublishWidget', 'applyCKEditor'),
(66, 27, '/backend/', 'ModifyTextareaFieldPublishWidget', 'applyCKEditor'),
(10, 4, '/blueprints/events/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation'),
(11, 4, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter'),
(12, 4, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter'),
(13, 4, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter'),
(14, 5, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve'),
(15, 5, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation'),
(16, 6, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter'),
(17, 6, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter'),
(18, 6, '/frontend/', 'EventFinalSaveFilter', 'eventFinalSaveFilter'),
(19, 6, '/blueprints/events/edit/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation'),
(20, 6, '/blueprints/datasources/', 'DatasourcePostEdit', 'datasourcePostEdit'),
(21, 7, '/backend/', 'InitaliseAdminPageHead', '__appendAdminPageAssets'),
(64, 26, '/backend/', 'AdminPagePostCallback', 'postCallback'),
(23, 9, '/frontend/', 'FrontendOutputPostGenerate', 'parse_html'),
(24, 9, '/frontend/', 'FrontendPageResolved', 'setRenderTrigger'),
(25, 9, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(26, 10, '/backend/', 'InitaliseAdminPageHead', 'InitaliseAdminPageHead'),
(27, 11, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(28, 11, '/system/preferences/', 'Save', '__SavePreferences'),
(29, 13, '/backend/', 'InitaliseAdminPageHead', 'appendScriptToHead'),
(30, 14, '/frontend/', 'FrontendPageResolved', 'checkHeadersPageType'),
(31, 14, '/frontend/', 'FrontendOutputPostGenerate', 'processPageContent'),
(32, 15, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve'),
(33, 15, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation'),
(50, 23, '/system/preferences/', 'Save', 'save'),
(49, 23, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'addCustomPreferenceFieldsets'),
(48, 23, '/login/', 'AuthorLoginSuccess', 'authorLoginSuccess'),
(47, 23, '/login/', 'AuthorLoginFailure', 'authorLoginFailure'),
(46, 22, '/system/preferences/', 'Save', '__savePreferences'),
(45, 22, '/system/preferences/', 'AddCustomPreferenceFieldsets', '__addPreferences'),
(44, 21, '/frontend/', 'FrontendPrePageResolve', 'frontendPrePageResolve'),
(51, 23, '/backend/', 'AdminPagePreGenerate', 'adminPagePreGenerate'),
(52, 23, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead'),
(53, 23, '/backend/', 'AppendPageAlert', 'appendPageAlert'),
(69, 27, '/system/preferences/', 'Save', 'savePresets'),
(62, 25, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(63, 25, '/system/preferences/', 'Save', '__SavePreferences'),
(65, 26, '/backend/', 'InitaliseAdminPageHead', 'addFilesToHead');

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields`
--

CREATE TABLE IF NOT EXISTS `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `sym_fields`
--

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES
(3, 'Текст', 'text', 'textarea', 3, 'no', 1, 'main', 'no'),
(2, 'Картинка', 'image', 'uniqueupload', 2, 'yes', 1, 'main', 'yes'),
(4, 'Имя', 'name', 'input', 3, 'yes', 0, 'main', 'yes'),
(5, 'Имя', 'name', 'input', 2, 'no', 0, 'main', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_author`
--

CREATE TABLE IF NOT EXISTS `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_checkbox`
--

CREATE TABLE IF NOT EXISTS `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_date`
--

CREATE TABLE IF NOT EXISTS `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_datetime`
--

CREATE TABLE IF NOT EXISTS `sym_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_input`
--

CREATE TABLE IF NOT EXISTS `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `sym_fields_input`
--

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES
(5, 4, NULL),
(4, 5, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_order_entries`
--

CREATE TABLE IF NOT EXISTS `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_select`
--

CREATE TABLE IF NOT EXISTS `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_selectbox_link`
--

CREATE TABLE IF NOT EXISTS `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_subsectionmanager`
--

CREATE TABLE IF NOT EXISTS `sym_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filter_tags` text COLLATE utf8_unicode_ci,
  `caption` text COLLATE utf8_unicode_ci,
  `droptext` text COLLATE utf8_unicode_ci,
  `create` tinyint(1) DEFAULT '1',
  `remove` tinyint(1) DEFAULT '1',
  `allow_multiple` tinyint(1) DEFAULT '1',
  `edit` tinyint(1) DEFAULT '1',
  `sort` tinyint(1) DEFAULT '1',
  `drop` tinyint(1) DEFAULT '1',
  `show_search` tinyint(1) DEFAULT '1',
  `show_preview` tinyint(1) DEFAULT '0',
  `recursion_levels` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_taglist`
--

CREATE TABLE IF NOT EXISTS `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_textarea`
--

CREATE TABLE IF NOT EXISTS `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `sym_fields_textarea`
--

INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES
(4, 3, 'ckeditor_full', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_uniqueinput`
--

CREATE TABLE IF NOT EXISTS `sym_fields_uniqueinput` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_uniqueupload`
--

CREATE TABLE IF NOT EXISTS `sym_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `sym_fields_uniqueupload`
--

INSERT INTO `sym_fields_uniqueupload` (`id`, `field_id`, `destination`, `validator`) VALUES
(4, 2, '/workspace/uploads/images', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- --------------------------------------------------------

--
-- Структура таблицы `sym_fields_upload`
--

CREATE TABLE IF NOT EXISTS `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_forgotpass`
--

CREATE TABLE IF NOT EXISTS `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_pages`
--

CREATE TABLE IF NOT EXISTS `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `sym_pages`
--

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES
(1, NULL, 'Index', 'home', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sym_pages_types`
--

CREATE TABLE IF NOT EXISTS `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `sym_pages_types`
--

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`) VALUES
(1, 1, 'index');

-- --------------------------------------------------------

--
-- Структура таблицы `sym_sections`
--

CREATE TABLE IF NOT EXISTS `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `sym_sections`
--

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `filter`, `navigation_group`) VALUES
(3, 'Документы', 'test', 2, 'no', 'yes', 'Content'),
(2, 'Картинки', 'image', 1, 'no', 'yes', 'Content');

-- --------------------------------------------------------

--
-- Структура таблицы `sym_sections_association`
--

CREATE TABLE IF NOT EXISTS `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sym_sessions`
--

CREATE TABLE IF NOT EXISTS `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Структура таблицы `sym_url_router`
--

CREATE TABLE IF NOT EXISTS `sym_url_router` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `type` enum('route','redirect') DEFAULT 'route',
  `http301` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
