<?php class sql extends sn {
	
public static $action;
public static $callback;

function __construct() {

}

function cdr($s="") {
	$s.="SELECT *, ";
	$s.="DATE_FORMAT(calldate,'%d%m%Y') as post_a, ";
	$s.="DATE_FORMAT(calldate,'%H:%i') as post_t, ";
	$s.="DATE_FORMAT(calldate,'%d.%m') as post_d ";
	$s.="FROM `cdr` ";
	$s.="WHERE (1=1) ";
	//$search=iconv("cp1251","UTF8",$search);
	//$search=htmlspecialchars_decode($search);
	//$search=urldecode($search);
	if ((calls::$search!="") && (calls::$search!="Поиск по звонкам...") && (strlen(calls::$search)>2)) {
		$s.=" AND (";
		$s.="(src_name LIKE '%".calls::$search."%')";
		$s.=" OR ";
		$s.="(dst_name LIKE '%".calls::$search."%')";
		$s.=" OR ";
		$s.="(src LIKE '%".calls::$search."%')";
		$s.=" OR ";
		$s.="(dst LIKE '%".calls::$search."%')";
		$s.=") ";
	}
		$s.="ORDER by `calldate` ASC ".
			"LIMIT 0 , 50 ";
	return $s;
}


} ?>
