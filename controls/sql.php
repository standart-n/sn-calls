<?php class sql extends sn {
	
public static $request;

function __construct() {

}

public static function cdr($s="") {
	$s.="SELECT *, ";
	$s.=self::date_formats();
	$s.="FROM `cdr` ";
	$s.="WHERE (1=1) ";
	$s.=self::search();
	$s.=self::sort();
	$s.=self::limit();
	self::$request=$s;
	return $s;
}

public static function pagination($s="") {
	$s.="SELECT COUNT(*) as count_id ";	
	$s.="FROM `cdr` ";
	$s.="WHERE (1=1) ";
	$s.=self::search();
	$s.=self::sort();
	self::$request=$s;
	return $s;
}

public static function stat($s="") {
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

public static function sort($s="") {
	$s.="ORDER by `".calls::$order."` ".calls::$grad." ";
	return $s;
}

public static function limit($s="") {
	$s.="LIMIT ".calls::$skip." , ".calls::$limit." ";
	return $s;	
}

public static function date_formats($s="") {
	$s.="DATE_FORMAT(calldate,'%d%m%Y') as post_a, ";
	$s.="DATE_FORMAT(calldate,'%H:%i') as post_t, ";
	$s.="DATE_FORMAT(calldate,'%d.%m') as post_d ";
	return $s;
}

public static function search($s="") {
	$src=calls::$src;
	$dst=calls::$dst;
	$date1=preg_replace('/([0-9]{2})-([0-9]{2})-([0-9]{4})/i','$3-$2-$1 00:00:00',calls::$date1);
	$date2=preg_replace('/([0-9]{2})-([0-9]{2})-([0-9]{4})/i','$3-$2-$1 00:00:00',calls::$date2);
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

	if (isset(calls::$show_short_calls)) {
		if (calls::$show_short_calls=='off') {
			$s.=" AND (billsec>10) ";
		}
	}

	if (isset(calls::$show_answered)) {
		if (calls::$show_answered=='off') {
			$s.=" AND (disposition<>'ANSWERED') ";
		}
	}
	if (isset(calls::$show_no_answer)) {
		if (calls::$show_no_answer=='off') {
			$s.=" AND (disposition<>'NO ANSWER') ";
		}
	}
	if (isset(calls::$show_busy)) {
		if (calls::$show_busy=='off') {
			$s.=" AND (disposition<>'BUSY') ";
		}
	}
	if (isset(calls::$show_failed)) {
		if (calls::$show_failed=='off') {
			$s.=" AND (disposition<>'FAILED') ";
		}
	}

	if (isset(calls::$show_playback)) {
		if (calls::$show_playback=='off') {
			$s.=" AND (lastapp<>'Playback') ";
		}
	}
	if (isset(calls::$show_hangup)) {
		if (calls::$show_hangup=='off') {
			$s.=" AND (lastapp<>'Hangup') ";
		}
	}
	if (isset(calls::$show_wait)) {
		if (calls::$show_wait=='off') {
			$s.=" AND (lastapp<>'Wait') ";
		}
	}
	if (isset(calls::$show_dial)) {
		if (calls::$show_dial=='off') {
			$s.=" AND (lastapp<>'Dial') ";
		}
	}
	return $s;
}

} ?>
