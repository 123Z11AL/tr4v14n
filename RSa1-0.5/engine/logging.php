<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       logging.php                                                 #
##	Version        0.1                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  Original by:   Akakori													   #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################

class Logging {
	
	/*****************************************
	Function to log an illegal actions
	*****************************************/	
	public function addIllegal($uid,$ref,$type) {
		global $database;
		if(LOG_ILLEGAL) {
			$log = "Attempted to ";
			switch($type) {
				case 1:
				$log .= "access village $ref";
				break;
			}
			$q = "Insert into ".TB_PREFIX."illegal_log values (0,$uid,'$log')";
			$database->query($q);
		}
	}
	
	/*****************************************
	Function to log an access
	*****************************************/
	public function addLoginLog($id,$ip) {
		global $database;
		if(LOG_LOGIN) {
			$q = "Insert into ".TB_PREFIX."login_log values (0,$id,'$ip')";
			$database->query($q);
		}
	}
	
	/*****************************************
	Function to log the buildings actions
	*****************************************/	
	public function addBuildLog($wid,$building,$level,$type) {
		global $database;
		if(LOG_BUILD) {
			if($type == 1) {
				$log = "Start Construction of ";
			}
			elseif ($type == 0) {
				$log = "Start Upgrade of ";
			}
			elseif ($type == 2) {
				$log = "Start Downgrade of ";
			}
			$log .= $building." at level ".$level;
			$q = "Insert into ".TB_PREFIX."build_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}

	/*****************************************
	Function to log the technologies actions
	*****************************************/	
	public function addTechLog($wid,$tech,$level) {
		global $database;
		if(LOG_TECH) {
			$log = "Upgrading of tech ".$tech." to level ".$level;
			$q = "Insert into ".TB_PREFIX."tech_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	/*****************************************
	Function to log the golfin actions
	*****************************************/	
	public function goldFinLog($wid) {
		global $database;
		if(LOG_GOLD_FIN) {
			$log = "Finish construction and research with gold";
			$q = "Insert into ".TB_PREFIX."gold_fin_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	/*****************************************
	Function to log the admin actions
	*****************************************/	
	public function addAdminLog() {
		global $database;
	}
	
	/*****************************************
	Function to log the market actions
	*****************************************/	
	public function addMarketLog($wid,$type,$data) {
		global $database;
		if(LOG_MARKET) {
			if($type == 1) {
				$log = "Sent ".$data[0].",".$data[1].",".$data[2].",".$data[3]." to village ".$data[4];
			}
			else if($type == 2) {
				$log = "Traded resource between ".$wid." and ".$data[0]." market ref is ".$data[1];
			}
			$q = "Insert into ".TB_PREFIX."market_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	/*****************************************
	Function to log the war actions
	*****************************************/	
	public function addWarLog() {
		global $database;
	}
	
	/*****************************************
	Function to clear all logs
	*****************************************/	
	public function clearLogs() {
		global $database;
	}
	
};


$logging = new Logging;
?>