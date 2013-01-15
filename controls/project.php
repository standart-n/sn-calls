<?php class project extends sn {

function __construct() {

}

function engine() {
	
	
	load("index.tpl");
	assign('cdr',calls::cdr());
	innerHTML("#main",fetch("calls.tpl"));
	echo html();	
	
}

} ?>
