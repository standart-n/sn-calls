<?php class ajax extends sn {
	
public static $response;

function __construct() {
	self::$response=array();
	if (self::getControls()) {
		if (self::getAction()) {
			echo self::getResponseString(json_encode(self::$response));
		}
	}	
}

function getResponseString($s="") {
	if ($s) {
		console::write("---");
		console::write("response:");
		console::write($s);
		if (isset(url::$callback)) {
			return url::$callback."(".$s.");";
		} else {
			return $s;
		}
	}
	return false;
}

function getAction() {
	if (isset(url::$action)) {
		console::write("action: ".url::$action);
		calls::getDataFromUrl();
		switch(url::$action) {
			case "submit":
				self::$response=project::submit(); return true;				
			break;
		}
	}
	return false;
}

function getControls() {
	foreach (array("url","sql","project","calls","console") as $key) {
		if (!file_exists(project."/controls/".$key.".php")) return false;
		require_once(project."/controls/".$key.".php");
		sn::cl($key);
	}
	return true;	
}

} ?>
