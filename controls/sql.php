<?php class sql extends sn {
	
public static $request;

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
	$s.=self::search();
	$s.="ORDER by `calldate` DESC ".
		"LIMIT 0 , 20 ";
	self::$request=$s;
	return $s;
}

function stat($s="") {
	$s.="SELECT ";
	$s.="(select count(*) from `cdr` where (disposition='NO ANSWER') ".self::search().") as count_no_answer, ";
	$s.="(select count(*) from `cdr` where (disposition='ANSWERED') ".self::search().") as count_answered, ";
	$s.="(select count(*) from `cdr` where (disposition='BUSY') ".self::search().") as count_busy, ";
	$s.="(select count(*) from `cdr` where (disposition='FAILED') ".self::search().") as count_failed, ";
	$s.="(select count(*) from `cdr` where (billsec=0) ".self::search().") as count_limit_1, ";
	$s.="(select count(*) from `cdr` where (billsec>0) and (billsec<=10) ".self::search().") as count_limit_2, ";
	$s.="(select count(*) from `cdr` where (billsec>10) and (billsec<=30) ".self::search().") as count_limit_3, ";
	$s.="(select count(*) from `cdr` where (billsec>30) ".self::search().") as count_limit_4, ";
	$s.="(select count(*) from `cdr` where (1=1) ".self::search().") as count_all ";
	$s.="FROM `cdr` ";
	return $s;
}

function search($s="") {
	$src=calls::$src;
	$dst=calls::$dst;
	$date1=calls::$date1_format;
	$date2=calls::$date2_format;
	if (($src!="") && (strlen($src)>2)) {
		$s.=" AND (";
		$s.="(src_name LIKE '%".$src."%')";
		if (intval($src)>0) {
			$s.=" OR ";
			$s.="(src LIKE '%".$src."%')";
		}
		$s.=") ";
	}
	if (($dst!="") && (strlen($dst)>2)) {
		$s.=" AND (";
		$s.="(dst_name LIKE '%".$dst."%')";
		if (intval($dst)>0) {
			$s.=" OR ";
			$s.="(src LIKE '%".$dst."%')";
		}
		$s.=") ";
	}
	if (($date1!="") && ($date2!="")) {
		$s.=" AND (";
		$s.="calldate between '".$date1."' and '".$date2."'";
		$s.=") ";
	}
	return $s;
}

} ?>
