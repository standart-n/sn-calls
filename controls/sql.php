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
		$s.="ORDER by `calldate` DESC ".
			"LIMIT 0 , 20 ";
	return $s;
}

function stat($s="") {
	$s.="SELECT ";
	$s.="(select count(*) from `cdr` where (disposition='NO ANSWER')) as count_no_answer, ";
	$s.="(select count(*) from `cdr` where (disposition='ANSWERED')) as count_answered, ";
	$s.="(select count(*) from `cdr` where (disposition='BUSY')) as count_busy, ";
	$s.="(select count(*) from `cdr` where (disposition='FAILED')) as count_failed, ";
	$s.="(select count(*) from `cdr` where (billsec=0)) as count_limit_1, ";
	$s.="(select count(*) from `cdr` where (billsec>0) and (billsec<=10)) as count_limit_2, ";
	$s.="(select count(*) from `cdr` where (billsec>10) and (billsec<=30)) as count_limit_3, ";
	$s.="(select count(*) from `cdr` where (billsec>30)) as count_limit_4, ";
	$s.="(select count(*) from `cdr` where (1=1)) as count_all ";
	$s.="FROM `cdr` ";
	$s.="WHERE (1=1) ";
	return $s;
}

} ?>
