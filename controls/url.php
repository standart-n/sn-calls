<?php class url extends sn {
	
public static $action;
public static $callback;

public static $dst;
public static $src;
public static $date1;
public static $date2;
public static $cb_no_answer;
public static $cb_short_calls;


function __construct() {
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
	if (isset($_REQUEST["date1"])) {
		self::$date1=trim(strval($_REQUEST["date1"]));
	}
	if (isset($_REQUEST["date2"])) {
		self::$date2=trim(strval($_REQUEST["date2"]));
	}
	if (isset($_REQUEST["cb_no_answer"])) {
		self::$cb_no_answer=trim(strval($_REQUEST["cb_no_answer"]));
	}
	if (isset($_REQUEST["cb_short_calls"])) {
		self::$cb_short_calls=trim(strval($_REQUEST["cb_short_calls"]));
	}
	
}


} ?>
