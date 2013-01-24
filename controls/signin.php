<?php class signin extends sn {
	
public static $key;
public static $type;
public static $login;
public static $password;

function __construct() {
}

function check() {
	
	if (self::data()) {
		if (self::settings($j)) {
			switch (self::$type) {
			case "key":
				if (self::$key==self::salt($j)) {
					return true;
				}
			break;
			case "login":
				if ((self::$login==$j->login) && (self::pwd(self::$password)==$j->password)) {
					self::$key=self::salt($j);
					return true;
				}
			break;
			}				
		}
	}	
	return false;
}

function salt($j) {
	return sha1(date("dj.STANDART-N").sha1($j->login).$j->password);
}

function pwd($s) {
	return sha1($s);
}

function settings(&$j,$p="",$f="") {

	$p=project."/settings/signin.json";
	if (file_exists($p)) { $f=file_get_contents($p); }	
	if ($f!="") { 
		$j=json_decode($f);
		if (($j->login) && ($j->password)) {
			return true;
		}		
	}
	return false;
}

function data() {	
	
	if (isset(url::$key)) {
		if (url::$key!="") {
			self::$key=url::$key;
			self::$type="key";
			return true;
		}
	}

	if ((isset(url::$login)) && (isset(url::$password))) {
		if ((url::$login!="") && (url::$password!="")) {
			self::$login=url::$login;
			self::$password=url::$password;
			self::$type="login";
			return true;
		}
	}	
	return false;
}

} ?>
