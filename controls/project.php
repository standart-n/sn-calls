<?php class project extends sn {

function __construct() {

}

function engine() {	
	load("index.tpl");
	assign('controls',calls::controls());
	innerHTML("#controls",fetch("controls.tpl"));
	assign('cdr',calls::cdr());
	innerHTML("#table",fetch("table.tpl"));
	innerHTML("#pagination",fetch("pagination.tpl"));
	assign('stat',calls::stat());
	innerHTML("#stat",fetch("stat.tpl"));
	echo sql::$request;
	echo html();
}

function submit($j=array()) {
	calls::getDataFromUrl();
	$j['src']=calls::$src;
	$j['dst']=calls::$dst;
	$j['date1']=calls::$date1;
	$j['date2']=calls::$date2;
	assign('cdr',calls::cdr());
	$j['table']=fetch("table.tpl");
	assign('stat',calls::stat());
	$j['stat']=fetch("stat.tpl");
	$j['alert']=sql::$request;
	$j['callback']="afterSubmit";
	$j['tm']=time();
	return $j;
}

} ?>
