<?php class project extends sn {

function __construct() {
	session_start();
}

public static function engine() {
	if (signin::check()) {
		calls::getDataFromUrl();
		load("index.tpl");
		assign('controls',calls::controls());
		innerHTML("#controls",fetch("controls.tpl"));
		assign('pagination',calls::pagination());
		assign('prev',calls::$prev);
		assign('next',calls::$next);
		assign('page',calls::$page);
		innerHTML("#pagination",fetch("pagination.tpl"));
		assign('cdr',calls::cdr());
		assign('order',calls::$order);
		assign('grad',calls::$grad);
		assign('phones',calls::$phones);
		innerHTML("#table",fetch("table.tpl"));
		assign('stat',calls::stat());
		innerHTML("#stat",fetch("stat.tpl"));
		//echo sql::$request;
		echo html();
	} else {
		load("index.tpl");
		innerHTML("#signin",fetch("signin.tpl"));
		//echo sql::$request;
		echo html();
	}
}	

public static function ajaxloader() {
	if (signin::check()) {
		$j['response']=true;
		calls::getDataFromUrl();
		assign('controls',calls::controls());
		$j['controls']=fetch("controls.tpl");
		assign('bar',calls::bar());
		$j['bar']=fetch("bar.tpl");
		assign('pagination',calls::pagination());
		assign('prev',calls::$prev);
		assign('next',calls::$next);
		assign('page',calls::$page);
		$j['pagination']=fetch("pagination.tpl");
		assign('cdr',calls::cdr());
		assign('order',calls::$order);
		assign('grad',calls::$grad);
		assign('phones',calls::$phones);
		$j['table']=fetch("table.tpl");
		assign('stat',calls::stat());
		$j['stat']=fetch("stat.tpl");
	} else {
		$j['response']=false;
		$j['signin']=fetch("signin.tpl");
	}
	$j['tm']=time();
	//$j['alert']=sql::$request;
	$j['callback']="afterAjaxloader";
	return $j;
}	

public static function signin($j=array()) {
	if (signin::check()) {
		$j['response']=true;
		//$j['key']=signin::$key;
		assign('bar',calls::bar());
		$j['bar']=fetch("bar.tpl");
		assign('controls',calls::controls());
		$j['controls']=fetch("controls.tpl");
	} else {
		$j['response']=false;
	}
	$j['tm']=time();
	$j['callback']="afterSignin";
	return $j;
}

public static function logout($j=array()) {
	if (signin::logout()) {
		$j['response']=true;
	} else {
		$j['response']=false;
	}
	$j['tm']=time();
	$j['callback']="afterLogout";
	return $j;
}


public static function submit($j=array()) {
	if (signin::check()) {
		calls::getDataFromUrl();
		$j['src']=calls::$src;
		$j['dst']=calls::$dst;
		$j['date1']=calls::$date1;
		$j['date2']=calls::$date2;
		assign('pagination',calls::pagination());
		assign('prev',calls::$prev);
		assign('next',calls::$next);
		assign('page',calls::$page);
		$j['pagination']=fetch("pagination.tpl");
		assign('cdr',calls::cdr());
		assign('order',calls::$order);
		assign('grad',calls::$grad);
		assign('phones',calls::$phones);
		$j['table']=fetch("table.tpl");
		assign('stat',calls::stat());
		$j['stat']=fetch("stat.tpl");
		$j['callback']="afterSubmit";
		$j['tm']=time();
		$j['response']=true;
	} else {
		$j['response']=false;
	}
	return $j;
}

public static function fbRequest($j=array()) {
	if (signin::check()) {
		calls::getDataFromUrl();
		$j['response']=calls::fbRequest();
		$j['callback']="afterFbRequest";
		$j['tm']=time();
		//$j['alert']=sql::$request;
	} else {
		$j['response']=false;
	}
	return $j;
}

} ?>
