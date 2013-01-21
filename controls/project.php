<?php class project extends sn {

function __construct() {

}

function engine() {	
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
	innerHTML("#table",fetch("table.tpl"));
	assign('stat',calls::stat());
	innerHTML("#stat",fetch("stat.tpl"));
	echo html();
}

function submit($j=array()) {
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
	$j['table']=fetch("table.tpl");
	assign('stat',calls::stat());
	$j['stat']=fetch("stat.tpl");
	$j['callback']="afterSubmit";
	$j['tm']=time();
	//$j['alert']=sql::$request;
	return $j;
}

} ?>
