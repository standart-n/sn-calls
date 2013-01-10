<?php class project extends sn {

function __construct() {

}

function engine() {
	
	
	load("index.tpl");
	innerHTML("#main",fetch("calls.tpl"));
	echo html();	
	
}

} ?>
