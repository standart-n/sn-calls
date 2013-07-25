<?php class calls extends sn {

public static $search;
public static $src;
public static $dst;
public static $prev;
public static $next;
public static $skip;
public static $page;
public static $pages;
public static $limit;
public static $records;
public static $src_name;
public static $dst_name;
public static $order;
public static $grad;
public static $date1;
public static $date2;
public static $caption;
public static $phone;
public static $phones;

public static $show_short_calls;

public static $show_answered;
public static $show_no_answer;
public static $show_busy;
public static $show_failed;

public static $show_playback;
public static $show_dial;
public static $show_wait;
public static $show_hangup;

function __construct() {
	self::defData();
}

function defData() {
	self::$src="";
	self::$dst="";
	self::$prev=false;
	self::$next=false;
	self::$skip=0;
	self::$page=1;
	self::$order="calldate";
	self::$grad="desc";
	self::$limit=20;
	self::$src_name="";
	self::$dst_name="";
	self::$date1=date("d-m-Y",strtotime("-7 day"));
	//self::$date1=date("d-m-Y",strtotime("-365 day"));
	self::$date2=date('d-m-Y');
	self::$caption="";
	self::$phone="";
	self::$phones=array();

	self::$show_short_calls="on";

	self::$show_answered="on";
	self::$show_no_answer="on";
	self::$show_busy="on";
	self::$show_failed="on";

	self::$show_playback="on";
	self::$show_dial="on";
	self::$show_wait="on";
	self::$show_hangup="on";

}

public static function getDataFromUrl() {
	if (isset(url::$src)) { self::$src=url::$src; }
	if (isset(url::$dst)) { self::$dst=url::$dst; }
	if (isset(url::$page)) { self::$page=url::$page; }
	if (isset(url::$phone)) { self::$phone=url::$phone; }
	if (isset(url::$limit)) {
		if ((intval(url::$limit)>0) && (intval(url::$limit)<100)) { self::$limit=url::$limit; }
	}
	if (isset(url::$date1)) {
		if (preg_match('/^[0-9]{2}-[0-9]{2}-[0-9]{4}$/i',url::$date1)) {
			self::$date1=url::$date1;
		}
	}
	if (isset(url::$date2)) {
		if (preg_match('/^[0-9]{2}-[0-9]{2}-[0-9]{4}$/i',url::$date2)) {
			self::$date2=url::$date2;
		}
	}
	if (isset(url::$order)) {
		if (in_array(url::$order,array("calldate","src_name","dst_name","billsec"))) {
			self::$order=url::$order;
		}
	}
	if (isset(url::$grad)) {
		if (in_array(url::$grad,array("asc","desc"))) {
			self::$grad=url::$grad;
		}
	}

	if (isset(url::$show_short_calls)) { self::$show_short_calls=url::$show_short_calls; }

	if (isset(url::$show_answered)) { self::$show_answered=url::$show_answered; }
	if (isset(url::$show_no_answer)) { self::$show_no_answer=url::$show_no_answer; }
	if (isset(url::$show_busy)) { self::$show_busy=url::$show_busy; }
	if (isset(url::$show_failed)) { self::$show_failed=url::$show_failed; }

	if (isset(url::$show_playback)) { self::$show_playback=url::$show_playback; }
	if (isset(url::$show_dial)) { self::$show_dial=url::$show_dial; }
	if (isset(url::$show_wait)) { self::$show_wait=url::$show_wait; }
	if (isset(url::$show_hangup)) { self::$show_hangup=url::$show_hangup; }
	
}

public static function cdr($j=array(),$p=array(),$i=-1) {
	if (query(sql::cdr(),$ms)) {
		foreach ($ms as $r) { $i++; $listen=false;
			$j[$i]['id']=intval($r->id);
			$j[$i]['uniqueid']=strval($r->uniqueid);
			$j[$i]['key']=sha1($r->uniqueid);
			$j[$i]['src']=strval($r->src);
			$j[$i]['dst']=strval($r->dst);
			$j[$i]['src_hash']=substr(sha1($r->src),0,6);
			$j[$i]['dst_hash']=substr(sha1($r->dst),0,6);
			$j[$i]['src_name']=self::cutName(strval($r->src_name));
			$j[$i]['dst_name']=self::cutName(strval($r->dst_name));
			$j[$i]['post_a']=strval($r->post_a);
			$j[$i]['post_d']=strval($r->post_d);
			$j[$i]['post_t']=strval($r->post_t);
			$j[$i]['disposition']=strval($r->disposition);
			$j[$i]['lastapp']=strval($r->lastapp);
			$j[$i]['status_rus']="Неизвестно";
			$j[$i]['status_class']="none";
			
			if ((strlen($r->src_name)<1) && (!in_array($r->src,array("7777","reklama"))) && (!in_array($r->src,$p))) { $p[]=$r->src; }
			if ((strlen($r->dst_name)<1) && (!in_array($r->dst,array("7777","reklama"))) && (!in_array($r->dst,$p))) { $p[]=$r->dst; }
	
			if (intval($r->duration)) {
				$j[$i]['duration_in']=intval($r->duration)-intval($r->billsec);
				$j[$i]['duration_call']=intval($r->billsec);
				$j[$i]['duration_error']=0;
				$j[$i]['duration_in_pr']=floatval((intval($r->duration)-intval($r->billsec))/intval($r->duration)*100);
				$j[$i]['duration_call_pr']=floatval(intval($r->billsec)/intval($r->duration)*100);
				$j[$i]['duration_error_pr']=0;
			} else {
				$j[$i]['duration_in']=0;
				$j[$i]['duration_call']=0;
				$j[$i]['duration_error']=0;
				$j[$i]['duration_in_pr']=0;
				$j[$i]['duration_call_pr']=0;
				$j[$i]['duration_error_pr']=100;
			}
			
			if (isset($r->lastapp)) {				$la=trim(strtolower(strval($r->lastapp)));
				switch ($la) {
				case "playback":
					$j[$i]['lastapp_rus']="ИВР";
				break;
				case "hangup":
					$j[$i]['lastapp_rus']="Сброшено";
				break;
				case "wait":
					$j[$i]['lastapp_rus']="Ожидание";
				break;
				case "dial":
					$j[$i]['lastapp_rus']="Вызов";
				break;
				default:
					$j[$i]['lastapp_rus']=$la;
				}
			}
			
			if ((isset($r->disposition)) && (isset($r->uniqueid))) {
				switch (trim(strtolower(strval($r->disposition)))) {
				case "answered":
					$path=project."/mp3/".$r->post_a."/".$r->uniqueid.".mp3";
					if (isset($path)) {
						if (file_exists($path)) {
							$listen=true;
						}
					}
					if (!$listen) {
						$j[$i]['status_rus']="Нет файла";
						$j[$i]['status_class']="";
					}
				break;
				case "busy":
					$j[$i]['status_rus']="Занято";
					$j[$i]['status_class']="warning";
				break;
				case "no answer":
					$j[$i]['status_rus']="Не отвечено";
					$j[$i]['status_class']="info";
				break;
				case "failed":
					$j[$i]['status_rus']="Отменен";
					$j[$i]['status_class']="important";
				break;
				}
			}
			
			$j[$i]['listen']=$listen;
			if ($listen) {
				$j[$i]['path_audio']=$path;
			}			
				
		}
	}
	if (sizeof($p)>0) { self::$phones=$p; }
	if (sizeof($j)>0) { return $j; }
	return false;
}

public static function stat($j=array()) {
	if (query(array("sql"=>sql::stat(),"connection"=>"mysql"),$ms)) {
		foreach ($ms as $r) {
			$j['count_all']=intval($r->count_all);
			$j['count_answered']=intval($r->count_answered);
			$j['count_no_answer']=intval($r->count_no_answer);
			$j['count_failed']=intval($r->count_failed);
			$j['count_busy']=intval($r->count_busy);
			$j['count_limit_1']=intval($r->count_limit_1);
			$j['count_limit_2']=intval($r->count_limit_2);
			$j['count_limit_3']=intval($r->count_limit_3);
			$j['count_limit_4']=intval($r->count_limit_4);
			if ($j['count_all']>0) {				
				$j['pr_limit_1']=floatval($j['count_limit_1']/$j['count_all']*100);
				$j['pr_limit_2']=floatval($j['count_limit_2']/$j['count_all']*100);
				$j['pr_limit_3']=floatval($j['count_limit_3']/$j['count_all']*100);
				$j['pr_limit_4']=floatval($j['count_limit_4']/$j['count_all']*100);
				$j['pr_answered']=floatval($j['count_answered']/$j['count_all']*100);
				$j['pr_no_answer']=floatval($j['count_no_answer']/$j['count_all']*100);
				$j['pr_failed']=floatval($j['count_failed']/$j['count_all']*100);
				$j['pr_busy']=floatval($j['count_busy']/$j['count_all']*100);
			}
		}
	}
	if (sizeof($j)>0) { return $j; }
	return false;
}

public static function pagination($list=array(),$i=0) {
	if (query(sql::pagination(),$ms)) {
		foreach ($ms as $r) {
			self::$records=$r->count_id;
		}
	}
	self::$pages=ceil(self::$records/self::$limit);
	self::$skip=(self::$page-1)*self::$limit;
	
	if (self::$page<1) { self::$page=1; }
	if (self::$page>self::$pages) { self::$page=self::$pages; }
	
	if (((self::$page-6)>0) && !((self::$page+3)<(self::$pages+1))) { $list[$i]['page']=self::$page-6; $list[$i]['hidden']=true; $i++; }
	if (((self::$page-5)>0) && !((self::$page+2)<(self::$pages+1))) { $list[$i]['page']=self::$page-5; $list[$i]['hidden']=true; $i++; }
	if (((self::$page-4)>0) && !((self::$page+1)<(self::$pages+1))) { $list[$i]['page']=self::$page-4; $list[$i]['hidden']=true; $i++; }
	if ((self::$page-3)>0) { $list[$i]['page']=self::$page-3; $list[$i]['hidden']=true; $i++; }
	if ((self::$page-2)>0) { $list[$i]['page']=self::$page-2; $list[$i]['hidden']=true; $i++; }
	if ((self::$page-1)>0) { $list[$i]['page']=self::$page-1; $list[$i]['hidden']=true; $i++; }
	$list[$i]['page']=self::$page; $list[$i]['active']=true; $i++;
	if ((self::$page+1)<(self::$pages+1)) { $list[$i]['page']=self::$page+1; $list[$i]['hidden']=true; $i++; }
	if ((self::$page+2)<(self::$pages+1)) { $list[$i]['page']=self::$page+2; $list[$i]['hidden']=true; $i++; }
	if ((self::$page+3)<(self::$pages+1)) { $list[$i]['page']=self::$page+3; $list[$i]['hidden']=true; $i++; }
	if (((self::$page+4)<(self::$pages+1)) && !((self::$page-1)>0)) { $list[$i]['page']=self::$page+4; $list[$i]['hidden']=true; $i++; }
	if (((self::$page+5)<(self::$pages+1)) && !((self::$page-2)>0)) { $list[$i]['page']=self::$page+5; $list[$i]['hidden']=true; $i++; }
	if (((self::$page+6)<(self::$pages+1)) && !((self::$page-3)>0)) { $list[$i]['page']=self::$page+6; $list[$i]['hidden']=true; $i++; }

	if ((self::$page-1)>0) { self::$prev=true; }
	if ((self::$page+1)<(self::$pages+1)) { self::$next=true; }
	return $list;
}

public static function controls($j=array()) {
	$j['src']=self::$src;
	$j['dst']=self::$dst;
	$j['date1']=self::$date1;
	$j['date2']=self::$date2;
	$j['limit']=self::$limit;
	$j['show_no_answer']=self::$show_no_answer;
	$j['show_short_calls']=self::$show_short_calls;

	$j['show_answered']=self::$show_answered;
	$j['show_no_answer']=self::$show_no_answer;
	$j['show_busy']=self::$show_busy;
	$j['show_failed']=self::$show_failed;

	$j['show_playback']=self::$show_playback;
	$j['show_dial']=self::$show_dial;
	$j['show_wait']=self::$show_wait;
	$j['show_hangup']=self::$show_hangup;
	return $j;
}

public static function cutName($a="") {
	$s=trim(iconv("UTF-8","cp1251",$a));
	if ($s!="") {
		$nm=explode(" ",$s);
		if ((isset($nm[1])) && (isset($nm[2])) && (!isset($nm[3]))) {
			$nm1=substr($nm[1],0,1); $nm2=substr($nm[2],0,1);
			$s="".$nm[0]." ".$nm1.".".$nm2."."."";
		} else {
			if (strlen($s)>10) { $s=trim(substr($s,0,10))."..."; }
		}
	}
	$s=iconv("cp1251","UTF-8",$s);	
	return $s;
}

public static function fbRequest($list=array(),$i=0) {
	if (query(array("sql"=>sql::fbRequest(),"connection"=>"fb"),$ms)) {
		foreach ($ms as $r) {
			self::$caption=self::cutName(iconv("cp1251","UTF-8",$r->CAPTION));
		}
	}
	if (self::$caption!="") {
		if (query(sql::cdrUpdate("src"))) {
			$list['src_update']=true;
		}
		if (query(sql::cdrUpdate("dst"))) {
			$list['dst_update']=true;
		}
		$list['phone']=self::$phone;
		$list['hash']=substr(sha1(self::$phone),0,6);
		$list['caption']=self::$caption;
		return $list;
	}
	return false;
}


} ?>
