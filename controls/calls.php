<?php class calls extends sn {

public static $search;

function __construct() {

}

function cdr($j=array(),$i=-1) {
	if (query(sql::cdr(),$ms)) {
		foreach ($ms as $r) { $i++;
			$j[$i]['id']=intval($r->id);
			$j[$i]['src']=strval($r->src);
			$j[$i]['dst']=strval($r->dst);
			$j[$i]['dt']=strval($r->dt);
			$j[$i]['uniqueid']=strval($r->uniqueid);
			$j[$i]['disposition']=strval($r->disposition);
			$j[$i]['status_rus']="Неизвестно";
			$j[$i]['status_class']="none";
			$j[$i]['listen']=false;
	
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
			
			if ((isset($r->disposition)) && (isset($r->uniqueid))) {
				switch (trim(strtolower(strval($r->disposition)))) {
				case "answered":
					//$s.=file_get_contents("http://calls:yJaBkTn@94.181.119.3:8010/calls/player.php?id=".$r->uniqueid);
					$j[$i]['listen']=true;
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
				
		}
	}
	if (sizeof($j)>0) { return $j; }
	return false;
}

} ?>
