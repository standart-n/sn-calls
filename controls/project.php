<?php class project extends sn {

function __construct() {

}

function engine() {
	
	
	load("index.tpl");
	innerHTML("#controls",fetch("controls.tpl"));
	assign('cdr',calls::cdr());
	innerHTML("#table",fetch("table.tpl"));
	innerHTML("#pagination",fetch("pagination.tpl"));
	assign('stat',calls::stat());
	innerHTML("#stat",fetch("stat.tpl"));
	echo html();	
	
}

} ?>
