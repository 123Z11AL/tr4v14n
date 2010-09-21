<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       automation.php                                              #
##	Version        0.2                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  Original by:   Akakori													   #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################

class Automation {
	
	public function Automation() {
		$this->ClearUser();
		$this->ClearInactive();
		$this->pruneResource();
		if(!file_exists("engine/prevention/research.txt")) {
			$this->researchComplete();
		}
		if(!file_exists("engine/prevention/cleardeleting.txt")) {
			$this->clearDeleting();
		}
		if(!file_exists("engine/prevention/build.txt")) {
			$this->buildComplete();
		}
		if(!file_exists("engine/prevention/market.txt")) {
			$this->marketComplete();
		}
		if(!file_exists("engine/prevention/training.txt")) {
			$this->trainingComplete();
		}
		if(!file_exists("engine/prevention/battle.txt")) {
			$this->battleComplete();
		}		
	}
	
	private function clearDeleting() {
		global $database;
		$ourFileHandle = fopen("engine/prevention/cleardeleting.txt", 'w');
		fclose($ourFileHandle);
		$needDelete = $database->getNeedDelete();
		if(count($needDelete) > 0) {
			foreach($needDelete as $need) {
				$needVillage = $database->getVillagesID($need['uid']); //wref
				foreach($needVillage as $village) {
					$q = "DELETE FROM ".TB_PREFIX."abdata where wref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."bdata where wid = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."enforcement where vref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."fdata where vref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."market where vref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."movement where to = ".$village['wref']." or from = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."odata where wref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."research where vref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."tdata where vref = ".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."training where vref =".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."units where vref =".$village['wref'];
					$database->query($q);
					$q = "DELETE FROM ".TB_PREFIX."vdata where wref = ".$village['wref'];
					$database->query($q);
					$q = "UPDATE ".TB_PREFIX."wdata set occupied = 0 where id = ".$village['wref'];
					$database->query($q);
				}
				$q = "DELETE FROM ".TB_PREFIX."mdata where target = ".$need['uid']." or owner = ".$need['uid'];
				$database->query($q);
				$q = "DELETE FROM ".TB_PREFIX."ndata where receiver = ".$need['uid'];
				$database->query($q);
				$q = "DELETE FROM ".TB_PREFIX."users where id = ".$need['uid'];
				$database->query($q);
			}
		}
		unlink("engine/prevention/cleardeleting.txt");
	}
	
	private function ClearUser() {
		global $database;
		if(AUTO_DEL_INACTIVE) {
			$time = time()+UN_ACT_TIME;
			$q = "DELETE from ".TB_PREFIX."users where timestamp >= $time and act != ''";
			$database->query($q);
		}
	}
	
	private function ClearInactive() {
		global $database;
		if(TRACK_USR) {
			$timeout = time()-USER_TIMEOUT*60;
     		 $q = "DELETE FROM ".TB_PREFIX."active WHERE timestamp < $timeout";
			 $database->query($q);
		}
	}
	
	private function pruneResource() {
		global $database;
		if(!ALLOW_BURST) {
			$q = "UPDATE ".TB_PREFIX."vdata set wood = maxstore where wood > maxstore";
			$database->query($q);
			$q = "UPDATE ".TB_PREFIX."vdata set clay = maxstore where clay > maxstore";
			$database->query($q);
			$q = "UPDATE ".TB_PREFIX."vdata set iron = maxstore where iron > maxstore";
			$database->query($q);
			$q = "UPDATE ".TB_PREFIX."vdata set crop = maxcrop where crop > maxcrop";
			$database->query($q);
		}
	}
	
	private function buildComplete() {
		global $database,$bid18,$bid10,$bid11;
		$ourFileHandle = fopen("engine/prevention/build.txt", 'w');
		fclose($ourFileHandle);
		$time = time();
		$array = array();
		$q = "SELECT * FROM ".TB_PREFIX."bdata where timestamp < $time";
		$array = $database->query_return($q);
		foreach($array as $indi) {
			if ($indi['action']==1){
				$q = "UPDATE ".TB_PREFIX."fdata set f".$indi['field']." = f".$indi['field']." + 1, f".$indi['field']."t = ".$indi['type']." where vref = ".$indi['wid'];
				if($database->query($q)) {
					$level = $database->getFieldLevel($indi['wid'],$indi['field']);
					$pop = $this->getPop($indi['type'],$level,0);
					$database->modifyPop($indi['wid'],$pop[0],0);
					$database->addCP($indi['wid'],$pop[1],0);
					if($indi['type'] == 18) {
						$owner = $database->getVillageField($indi['wid'],"owner");
						$max = $bid18[$level]['attri'];
						$q = "UPDATE ".TB_PREFIX."alidata set max = $max where leader = $owner";
						$database->query($q);
					}
					if($indi['type'] == 10) {
   						$max=$database->getVillageField($indi['wid'],"maxstore");
   						$max-=$bid10[$level-1]['attri'];      
   						$max+=$bid10[$level]['attri'];
   						$database->setVillageField($indi['wid'],"maxstore",$max);
					}
					if($indi['type'] == 11) {
   						$max=$database->getVillageField($indi['wid'],"maxcrop");
   						$max-=$bid11[$level-1]['attri'];      
   						$max+=$bid11[$level]['attri'];
   						$database->setVillageField($indi['wid'],"maxcrop",$max);
					}
					$q4 = "UPDATE ".TB_PREFIX."bdata set loopcon = 0 where loopcon = 1 and wid = ".$indi['wid'];
					$database->query($q4);
					$q = "DELETE FROM ".TB_PREFIX."bdata where id = ".$indi['id'];
					$database->query($q);
				}
			}else{
				// Demolish
				$q = "UPDATE ".TB_PREFIX."fdata set f".$indi['field']." = f".$indi['field']." - 1, f".$indi['field']."t = ".$indi['type']." where vref = ".$indi['wid'];
				if($database->query($q)) {
					$level = $database->getFieldLevel($indi['wid'],$indi['field']);
					$pop = $this->getPop($indi['type'],$level,1);
					$database->modifyPop($indi['wid'],$pop[0],1);
					$database->addCP($indi['wid'],$pop[1],1);				
					if($indi['type'] == 18) {
						$owner = $database->getVillageField($indi['wid'],"owner");
						$max = $bid18[$level]['attri'];
						$q = "UPDATE ".TB_PREFIX."alidata set max = $max where leader = $owner";
						$database->query($q);
					}
					if($indi['type'] == 10) {
						$max = $bid10[$level]['attri'];
						$database->setVillageField($indi['wid'],"maxstore",$max);
					}
					if($indi['type'] == 11) {
						$max = $bid11[$level]['attri'];
						$database->setVillageField($indi['wid'],"maxcrop",$max);
					}
					$q4 = "UPDATE ".TB_PREFIX."bdata set loopcon = 0 where loopcon = 1 and wid = ".$indi['wid'];
					$database->query($q4);
					$q = "DELETE FROM ".TB_PREFIX."bdata where id = ".$indi['id'];
					$database->query($q);				
				}				
			}
		}
		unlink("engine/prevention/build.txt");
	}
	
	private function getPop($tid,$level,$mode) {
		$name = "bid".$tid;
		global $$name,$village;
		$dataarray = $$name;
		if (!$mode){
			$pop = $dataarray[($level+1)]['pop'];
			$cp = $dataarray[($level+1)]['pop'];
		}else{
			$pop = $dataarray[($level-1)]['pop'];
			$cp = $dataarray[($level-1)]['pop'];		
		}
		return array($pop,$cp);
	}
	
	private function marketComplete() {
		global $database,$generator;
		$ourFileHandle = fopen("engine/prevention/market.txt", 'w');
		fclose($ourFileHandle);
		$time = time();
		$q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."send where ".TB_PREFIX."movement.ref = ".TB_PREFIX."send.id and ".TB_PREFIX."movement.proc = 0 and type = 0 and endtime < $time";
		$dataarray = $database->query_return($q);
		foreach($dataarray as $data) {
			$database->modifyResource($data['to'],$data['wood'],$data['clay'],$data['iron'],$data['crop'],1);
			$tocoor = $database->getCoor($data['from']);
			$fromcoor = $database->getCoor($data['to']);
			$targettribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
			$endtime = $this->procDistanceTime($tocoor,$fromcoor,$targettribe,0) + $time;
			$database->addMovement(2,$data['to'],$data['from'],$data['merchant'],$endtime);
			$database->setMovementProc($data['moveid']);
			// Obtenemos los datos necesarios para generar el informe		
			$fromVillage = $database->getVillage($data['from']);			
			$toVillage = $database->getVillage($data['to']);												
			$data['resources'] = $data['wood']."-".$data['clay']."-".$data['iron']."-".$data['crop'];			
			$q1 = "INSERT INTO ".TB_PREFIX."ndata values (0, '2', '".$toVillage['owner']."', 'readme', '".$data['from']."', '".$fromVillage['owner']."', '".$data['to']."', '".$toVillage['owner']."', '".$data['endtime']."', '', '0', '0', '0', '0', '', '', '', '', '', '', '0', '0', '', '".$data['resources']."', '0')";
			$database->query($q1);
			$q2 = "INSERT INTO ".TB_PREFIX."ndata values (0, '2', '".$fromVillage['owner']."', 'readme', '".$data['from']."', '".$fromVillage['owner']."', '".$data['to']."', '".$toVillage['owner']."', '".$data['endtime']."', '', '0', '0', '0', '0', '', '', '', '', '', '', '0', '0', '', '".$data['resources']."', '0')";
			$database->query($q2);	
		}
		$q = "UPDATE ".TB_PREFIX."movement set proc = 1 where endtime < $time and type = 2";
		$database->query($q);
		unlink("engine/prevention/market.txt");
	}
	
	private function researchComplete() {
		global $database;
		$ourFileHandle = fopen("engine/prevention/research.txt", 'w');
		fclose($ourFileHandle);
		$time = time();
		$q = "SELECT * FROM ".TB_PREFIX."research where timestamp < $time";
		$dataarray = $database->query_return($q);
		foreach($dataarray as $data) {
			$type = substr($data['tech'],0,1);
			switch($type) {
				case "t":
				$q = "UPDATE ".TB_PREFIX."tdata set ".$data['tech']." = 1 where vref = ".$data['vref'];
				break;
				case "a":
				case "b":
				$q = "UPDATE ".TB_PREFIX."abdata set ".$data['tech']." = ".$data['tech']." + 1 where vref = ".$data['vref'];
				break;
			}
			$database->query($q);
			$q = "DELETE FROM ".TB_PREFIX."research where id = ".$data['id'];
			$database->query($q);
		}
		unlink("engine/prevention/research.txt");
	}
	
	private function trainingComplete() {
		global $database;
		$ourFileHandle = fopen("engine/prevention/training.txt", 'w');
		fclose($ourFileHandle);
		$trainlist = $database->getTrainingList();
		if(count($trainlist) > 0) {
			foreach($trainlist as $train) {
				$timepast = $train['timestamp'] - $train['commence'];
				$trained = floor($timepast/$train['eachtime']);
				$pop = $train['pop'] * $trained;
				if($trained >= $train['amt']) {
					$trained = $train['amt'];
				}
				$database->modifyUnit($train['vref'],$train['unit'],$trained,1);
				if($train['amt']-$trained <= 0) {
					$database->trainUnit($train['id'],0,0,0,0,0,1);
				}
				if($trained > 0) {
					$database->modifyCommence($train['id']);
				}
				$database->updateTraining($train['id'],$trained);
			}
		}
		$q = "DELETE FROM ".TB_PREFIX."training where eachtime = 0";
		$database->query($q);
		if(file_exists("engine/prevention/training.txt"))
		{
			unlink("engine/prevention/training.txt");
		}
	}
	
		private function battleComplete() {
		global $database,$generator;
		$ourFileHandle = fopen("engine/prevention/battle.txt", 'w');
		fclose($ourFileHandle);
		$time = time();
		$q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."enforcement where ".TB_PREFIX."movement.ref = ".TB_PREFIX."enforcement.id and ".TB_PREFIX."movement.proc = 0 and type = 4 and endtime < $time";
		$dataarray = $database->query_return($q);
		foreach ($dataarray as $data){
			$tocoor = $database->getCoor($data['from']);
			$fromcoor = $database->getCoor($data['to']);
			$deftribe = $database->getUserField($database->getVillageField($data['to'],"owner"),"tribe",0);
			$atktribe = $database->getUserField($database->getVillageField($data['from'],"owner"),"tribe",0);
			$endtime = $this->procDistanceTime($tocoor,$fromcoor,$targettribe,0) + $time;
			$database->setMovementProc($data['moveid']);
			$defunit = $database->getUnit($data['to']);
			$database->addMovement("3",$data['from'],$data['from'],$data['ref'],$endtime);

			if($atktribe == 1)
			{
			$atkdata1 = $data['u1'];
			$atkdata2 = $data['u2'];
			$atkdata3 = $data['u3'];
			$atkdata4 = $data['u4'];
			$atkdata5 = $data['u5'];
			$atkdata6 = $data['u6'];
			$atkdata7 = $data['u7'];
			$atkdata8 = $data['u8'];
			$atkdata9 = $data['u9'];
			$atkdata10 = $data['u10'];
			}
			else if($atktribe == 2)
			{
			$atkdata1 = $data['u11'];
			$atkdata2 = $data['u12'];
			$atkdata3 = $data['u13'];
			$atkdata4 = $data['u14'];
			$atkdata5 = $data['u15'];
			$atkdata6 = $data['u16'];
			$atkdata7 = $data['u17'];
			$atkdata8 = $data['u18'];
			$atkdata9 = $data['u19'];
			$atkdata10 = $data['u20'];
			}
			else if($atktribe == 3)
			{
			$atkdata1 = $data['u21'];
			$atkdata2 = $data['u22'];
			$atkdata3 = $data['u23'];
			$atkdata4 = $data['u24'];
			$atkdata5 = $data['u25'];
			$atkdata6 = $data['u26'];
			$atkdata7 = $data['u27'];
			$atkdata8 = $data['u28'];
			$atkdata9 = $data['u29'];
			$atkdata10 = $data['u30'];
			}
			
			if($deftribe == 1)
			{
			$defdata1 = $defunit['u1'];
			$defdata2 = $defunit['u2'];
			$defdata3 = $defunit['u3'];
			$defdata4 = $defunit['u4'];
			$defdata5 = $defunit['u5'];
			$defdata6 = $defunit['u6'];
			$defdata7 = $defunit['u7'];
			$defdata8 = $defunit['u8'];
			$defdata9 = $defunit['u9'];
			$defdata10 = $defunit['u10'];
			}
			else if($deftribe == 2)
			{
			$defdata1 = $defunit['u11'];
			$defdata2 = $defunit['u12'];
			$defdata3 = $defunit['u13'];
			$defdata4 = $defunit['u14'];
			$defdata5 = $defunit['u15'];
			$defdata6 = $defunit['u16'];
			$defdata7 = $defunit['u17'];
			$defdata8 = $defunit['u18'];
			$defdata9 = $defunit['u19'];
			$defdata10 = $defunit['u20'];
			}
			else if($deftribe == 3)
			{
			$defdata1 = $defunit['u21'];
			$defdata2 = $defunit['u22'];
			$defdata3 = $defunit['u23'];
			$defdata4 = $defunit['u24'];
			$defdata5 = $defunit['u25'];
			$defdata6 = $defunit['u26'];
			$defdata7 = $defunit['u27'];
			$defdata8 = $defunit['u28'];
			$defdata9 = $defunit['u29'];
			$defdata10 = $defunit['u30'];
			}

			$fromVillage = $database->getVillage($data['from']);			
			$toVillage = $database->getVillage($data['to']);								
			$q1 = "INSERT INTO ".TB_PREFIX."ndata values (null, '4', '".$toVillage['owner']."', '".$fromVillage['name']." attacks ".$toVillage['name']."', '".$data['from']."', '".$fromVillage['owner']."', '".$data['to']."', '".$toVillage['owner']."', '".$data['endtime']."', '', '0', '0', '0', '0', '', '".$atkdata1."-".$atkdata2."-".$atkdata3."-".$atkdata4."-".$atkdata5."-".$atkdata6."-".$atkdata7."-".$atkdata8."-".$atkdata9."-".$atkdata20."', '?-?-?-?-?-?-?-?-?-?', '".$defdata1."-".$defdata2."-".$defdata3."-".$defdata4."-".$defdata5."-".$defdata6."-".$defdata7."-".$defdata8."-".$defdata9."-".$defdata10."', '?-?-?-?-?-?-?-?-?-?', '', '0', '0', '', '0-0-0-0', '1')";
			$database->query($q1);
			$q2 = "INSERT INTO ".TB_PREFIX."ndata values (null, '4', '".$fromVillage['owner']."', '".$fromVillage['name']." attacks ".$toVillage['name']."', '".$data['from']."', '".$fromVillage['owner']."', '".$data['to']."', '".$toVillage['owner']."', '".$data['endtime']."', '', '0', '0', '0', '0', '', '".$atkdata1."-".$atkdata2."-".$atkdata3."-".$atkdata4."-".$atkdata5."-".$atkdata6."-".$atkdata7."-".$atkdata8."-".$atkdata9."-".$atkdata20."', '?-?-?-?-?-?-?-?-?-?', '".$defdata1."-".$defdata2."-".$defdata3."-".$defdata4."-".$defdata5."-".$defdata6."-".$defdata7."-".$defdata8."-".$defdata9."-".$defdata10."', '?-?-?-?-?-?-?-?-?-?', '', '0', '0', '', '0-0-0-0', '1')";
			$database->query($q2);
		}
		$q = "UPDATE ".TB_PREFIX."movement set proc = 1 where endtime < $time";
		$database->query($q);
		unlink("engine/prevention/battle.txt");
	}
		
	private function procDistanceTime($coor,$thiscoor,$ref,$mode) {
		global $bid28,$bid14,$database,$generator;
		$resarray = $database->getResourceLevel($generator->getBaseID($coor['x'],$coor['y']));
		if($thiscoor['x'] > $coor['x']) {
			$xdistance = $thiscoor['x'] - $coor['x'];
		}
		else {
			$xdistance = $coor['x'] - $thiscoor['x'];
		}
		if(($coor['x'] < 0 && $thiscoor['x'] > 0) || ($thiscoor['x'] < 0 && $coor['x'] > 0)) {
			$xdistance += 1;
		}
		if($xdistance >= WORLD_MAX) {
			while($xdistance >= WORLD_MAX):
			$xdistance -= WORLD_MAX;
			endwhile;
		}
		if($thiscoor['y'] > $coor['y']) {
			$ydistance = $thiscoor['y'] - $coor['y'];
		}
		else {
			$ydistance = $coor['y'] - $thiscoor['y'];
		}
		if(($coor['y'] < 0 && $thiscoor['y'] > 0) || ($thiscoor['y'] < 0 && $coor['y'] > 0)) {
			$ydistance += 1;
		}
		if($ydistance >= WORLD_MAX) {
			while($ydistance >= WORLD_MAX):
			$ydistance -= WORLD_MAX;
			endwhile;
		}
		$distance = $xdistance + $ydistance;
		if(!$mode) {
			if($ref == 1) {
				$speed = 16;
			}
			else if($ref == 2) {
				$speed = 24;
			}
			else {
				$speed = 12;
			}
			if($this->getTypeLevel(28,$resarray) != 0) {
				$speed *= $bid28[$this->getTypeLevel(28,$resarray)]['attri'] / 100;
			}
		}
		else {
			$speed = $ref;
			if($this->getTypeLevel(14,$resarray) != 0) {
				$speed *= $bid14[$this->getTypeLevel(14,$resarray)]['attri'] / 100;
			}
		}
		return round(($distance/$speed) * 3600 / INCREASE_SPEED);
	}
	
	private function getTypeLevel($tid,$resarray) {
		global $village;
		$keyholder = array();
		foreach(array_keys($resarray,$tid) as $key) {
			if(strpos($key,'t')) { 
				$key = preg_replace("/[^0-9]/", '', $key);
				array_push($keyholder, $key);
			} 
		}
		$element = count($keyholder);
		if($element >= 2) {
			if($tid <= 4) {
				$temparray = array();
				for($i=0;$i<=$element-1;$i++) {
					array_push($temparray,$resarray['f'.$keyholder[$i]]);
				}
				foreach ($temparray as $key => $val) {
					if ($val == max($temparray)) 
					$target = $key; 
				}
			}
			else {
				for($i=0;$i<=$element-1;$i++) {
					if($resarray['f'.$keyholder[$i]] != $this->getTypeMaxLevel($tid)) {
						$target = $i;
					}
				}
			}
		}
		else if($element == 1) {
			$target = 0;
		}
		else {
			return 0;
		}
		if($keyholder[$target] != "") {
			return $resarray['f'.$keyholder[$target]];
		}
		else {
			return 0;
		}
	}
};

$automation = new Automation;
?>