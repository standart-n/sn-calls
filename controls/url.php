<?php class url extends sn {
	
public static $key;
public static $action;
public static $callback;

public static $dst;
public static $src;
public static $date1;
public static $date2;
public static $page;
public static $phone;
public static $limit;
public static $order;
public static $login;
public static $password;
public static $grad;

public static $show_short_calls;

public static $show_answered;
public static $show_no_answer;
public static $show_busy;
public static $show_failed;

public static $show_playback;
public static $show_dial;
public static $show_wait;
public static $show_hangup;

function __construct() {

	if (isset($_REQUEST["key"])) {
		self::$key=trim(strval($_REQUEST["key"]));
	}

	if (isset($_REQUEST["action"])) {
		self::$action=trim(strval($_REQUEST["action"]));
	}
	if (isset($_REQUEST["callback"])) {
		self::$callback=trim(strval($_REQUEST["callback"]));
	}
	if (isset($_REQUEST["src"])) {
		self::$src=trim(strval($_REQUEST["src"]));
	}
	if (isset($_REQUEST["dst"])) {
		self::$dst=trim(strval($_REQUEST["dst"]));
	}
	if (isset($_REQUEST["page"])) {
		self::$page=intval(trim($_REQUEST["page"]));
	}
	if (isset($_REQUEST["date1"])) {
		self::$date1=trim(strval($_REQUEST["date1"]));
	}
	if (isset($_REQUEST["date2"])) {
		self::$date2=trim(strval($_REQUEST["date2"]));
	}
	if (isset($_REQUEST["limit"])) {
		self::$limit=trim(intval($_REQUEST["limit"]));
	}
	if (isset($_REQUEST["order"])) {
		self::$order=trim(strtolower(strval($_REQUEST["order"])));
	}
	if (isset($_REQUEST["grad"])) {
		self::$grad=trim(strtolower(strval($_REQUEST["grad"])));
	}
	if (isset($_REQUEST["phone"])) {
		self::$phone=trim(strval($_REQUEST["phone"]));
	}

	if (isset($_REQUEST["login"])) {
		self::$login=trim(strval($_REQUEST["login"]));
	}
	if (isset($_REQUEST["password"])) {
		self::$password=trim(strval($_REQUEST["password"]));
	}

	if (isset($_REQUEST["show_short_calls"])) {
		self::$show_short_calls=trim(strval($_REQUEST["show_short_calls"]));
	}

	if (isset($_REQUEST["show_answered"])) {
		self::$show_answered=trim(strtolower(strval($_REQUEST["show_answered"])));
	}
	if (isset($_REQUEST["show_no_answer"])) {
		self::$show_no_answer=trim(strtolower(strval($_REQUEST["show_no_answer"])));
	}
	if (isset($_REQUEST["show_busy"])) {
		self::$show_busy=trim(strtolower(strval($_REQUEST["show_busy"])));
	}
	if (isset($_REQUEST["show_failed"])) {
		self::$show_failed=trim(strtolower(strval($_REQUEST["show_failed"])));
	}

	if (isset($_REQUEST["show_hangup"])) {
		self::$show_hangup=trim(strtolower(strval($_REQUEST["show_hangup"])));
	}
	if (isset($_REQUEST["show_dial"])) {
		self::$show_dial=trim(strtolower(strval($_REQUEST["show_dial"])));
	}
	if (isset($_REQUEST["show_wait"])) {
		self::$show_wait=trim(strtolower(strval($_REQUEST["show_wait"])));
	}
	if (isset($_REQUEST["show_playback"])) {
		self::$show_playback=trim(strtolower(strval($_REQUEST["show_playback"])));
	}

	
}


} ?>
