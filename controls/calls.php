<?php class calls extends sn {

public static $search;

function __construct() {

}

function cdr($j=array(),$i=-1) {
	if (query(sql::cdr(),$ms)) {
		foreach ($ms as $r) { $i++; $listen=false;
			$j[$i]['id']=intval($r->id);
			$j[$i]['uniqueid']=intval($r->uniqueid);
			$j[$i]['src']=strval($r->src);
			$j[$i]['dst']=strval($r->dst);
			$j[$i]['post_a']=strval($r->post_a);
			$j[$i]['post_d']=strval($r->post_d);
			$j[$i]['post_t']=strval($r->post_t);
			$j[$i]['uniqueid']=strval($r->uniqueid);
			$j[$i]['disposition']=strval($r->disposition);
			$j[$i]['lastapp']=strval($r->lastapp);
			$j[$i]['status_rus']="Неизвестно";
			$j[$i]['status_class']="none";
	
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
			
			if (isset($r->lastapp)) {
				$la=trim(strtolower(strval($r->lastapp)));
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
					$listen=true;
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
				$j[$i]['path_player']=project."/flash/player_mp3_maxi.swf";
				$j[$i]['path_audio']=project."/mp3/".$r->post_a."/".$r->uniqueid.".mp3";
			}			
				
		}
	}
	if (sizeof($j)>0) { return $j; }
	return false;
}

} ?>
