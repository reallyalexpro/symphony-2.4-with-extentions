<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'admin-path' => 'symphony',
			'pagination_maximum_rows' => '20',
			'association_maximum_rows' => '5',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'version' => '2.4',
			'cookie_prefix' => 'sym-',
			'session_gc_divisor' => '10',
			'cell_truncation_length' => '75',
			'enable_xsrf' => 'yes',
			'token_lifetime' => '15 minutes',
			'invalidate_tokens_on_request' => null,
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### DATABASE ######
		'database' => array(
			'host' => 'localhost',
			'port' => '3306',
			'user' => 'root',
			'password' => null,
			'db' => 'dental',
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Sitename',
			'useragent' => 'Symphony/2.4',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd.m.Y',
			'datetime_separator' => ' ',
			'timezone' => 'Europe/Moscow',
		),
		########


		###### CACHE_DRIVER ######
		'cache_driver' => array(
			'default' => 'database',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
			'disable_regular_rules' => 'no',
			'disable_upscaling' => 'no',
			'disable_proxy_transform' => 'no',
		),
		########


		###### CKEDITOR ######
		'ckeditor' => array(
			'styles' => null,
			'sections' => '2',
		),
		########


		###### ANTI-BRUTE-FORCE ######
		'anti-brute-force' => array(
			'length' => '60',
			'failed-count' => '5',
			'gl-duration' => '30',
			'gl-threshold' => '5',
			'auto-unban' => 'off',
			'restrict-access' => 'off',
		),
		########


		###### EMAIL ######
		'email' => array(
			'default_gateway' => 'sendmail',
		),
		########


		###### EMAIL_SENDMAIL ######
		'email_sendmail' => array(
			'from_name' => null,
			'from_address' => null,
		),
		########


		###### EMAIL_SMTP ######
		'email_smtp' => array(
			'from_name' => null,
			'from_address' => null,
			'host' => '127.0.0.1',
			'port' => '25',
			'secure' => 'no',
			'auth' => '0',
			'username' => null,
			'password' => null,
		),
		########


		###### HTML5_DOCTYPE ######
		'html5_doctype' => array(
			'exclude_pagetypes' => 'XML',
		),
		########


		###### DATETIME ######
		'datetime' => array(
			'english' => 'en, en_GB.UTF8, en_GB',
			'russian' => 'ru, ru_RU.UTF8, ru_RU',
		),
		########
	);
