<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       session.php                                                 #
##	Version        0.1                                                     #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################

include_once("xtras/dBug.php");
include("bbcode.php");
include("battle.php");
include("data/buidata.php");
include("data/resdata.php");
include("data/unitdata.php");
include("database.php");
include("mailer.php");
include("form.php");
include("generator.php");
include("automation.php");
include("lang/".LANG.".php");
include("logging.php");
include("message.php");
include("multisort.php");
include("ranking.php");
include("alliance.php");
include("profile.php");
date_default_timezone_set('UTC');

class Session {
	
	private $time;
	var $logged_in = false;
	var $referrer, $url;
	var $username,$uid,$access,$plus,$tribe,$isAdmin,$alliance,$gold;
	var $bonus = 0;
	var $checker,$mchecker;
	public $userinfo = array();
	private $userarray = array();
	var $villages = array();

	function Session() {
		global $database;
		$this->time = time();
		if (!isset($_SESSION)) {
			session_start();
		}
		
		$this->logged_in = $this->checkLogin();
		
		if($this->logged_in && TRACK_USR) {
		  $database->updateActiveUser($this->username,$this->time);
		 }	  
		if(isset($_SESSION['url'])){
         $this->referrer = $_SESSION['url'];
		 }else{
			 $this->referrer = "/";
		}
		$this->url = $_SESSION['url'] = $_SERVER['PHP_SELF'];
		$this->SurfControl();
	}
	
	public function Login($user) {
		global $database,$generator,$logging;
		$this->logged_in = true;
		$_SESSION['sessid'] = $generator->generateRandID();
		$_SESSION['username'] = $user;	
		$_SESSION['checker'] = $generator->generateRandStr(3);
		$_SESSION['mchecker'] = $generator->generateRandStr(5);
		
		$this->PopulateVar();
		
		$logging->addLoginLog($this->uid,$_SERVER['REMOTE_ADDR']);
		$database->addActiveUser($_SESSION['username'],$this->time);
		$database->updateUserField($_SESSION['username'],"sessid",$_SESSION['sessid'],0);
		$_SESSION['qst']  = $database->getUserField($_SESSION['username'],"quest",1);
		header("Location: dorf1.php");
	}
	
	public function Logout() {
		global $database;
		$this->logged_in = false;
		$database->updateUserField($_SESSION['username'],"sessid","",0);
		if (ini_get("session.use_cookies")) {
			$params = session_get_cookie_params();
			setcookie(session_name(), '', time() - 42000,
				$params["path"], $params["domain"],
				$params["secure"], $params["httponly"]
			);
		}
		session_destroy();
		session_start();
	}
	
	public function changeChecker() {
		global $generator;
		$this->checker = $_SESSION['checker'] = $generator->generateRandStr(3);
		$this->mchecker = $_SESSION['mchecker'] = $generator->generateRandStr(5);
	}
	
	private function checkLogin() {
		global $database;
		if(isset($_SESSION['username']) && isset($_SESSION['sessid'])) {
			if(!$database->checkActiveSession($_SESSION['username'],$_SESSION['sessid'])) {
				$this->Logout();
				return false;
			}
			else {
				//Get and Populate Data
				$this->PopulateVar();
				//update database
				$database->addActiveUser($_SESSION['username'],$this->time);
				$database->updateUserField($_SESSION['username'],"timestamp",$this->time,0);	
				return true;
			}
		}
		else {
			return false;
		}
	}
	
	private function PopulateVar() {
		global $database;
		$this->userarray = $this->userinfo = $database->getUserArray($_SESSION['username'],0);
		$this->username = $this->userarray['username'];
		$this->uid = $this->userarray['id'];
		$this->access = $this->userarray['access'];
		$this->plus = ($this->userarray['plus'] > $this->time);
		$this->villages = $database->getVillagesID($this->uid);
		$this->tribe = $this->userarray['tribe'];
		$this->isAdmin = $this->access >= MODERATOR;
		$this->alliance = $this->userarray['alliance'];
		$this->checker = $_SESSION['checker'];
		$this->mchecker = $_SESSION['mchecker'];
		$this->gold = $this->userarray['gold'];
		if($this->userarray['b1'] > $this->time) {
			$this->bonus += 1000;
		}
		if($this->userarray['b2'] > $this->time) {
			$this->bonus += 200;
		}
		if($this->userarray['b3'] > $this->time) {
			$this->bonus += 30;
		}
		if($this->userarray['b4'] > $this->time) {
			$this->bonus += 4;
		}
	}
	
	private function SurfControl() {
		if(SERVER_WEB_ROOT) {
			$page = $_SERVER['SCRIPT_NAME'];
		}
		else {
			$explode = explode("/",$_SERVER['SCRIPT_NAME']);
			$page = $explode[1];
		}
		$pagearray = array("login.php","activate.php","anmelden.php");
		if(!$this->logged_in) {
			if(!in_array($page,$pagearray) || $page == "logout.php") {
				header("Location: login.php");
			}
		}
		else {
			if(in_array($page,$pagearray)) {
				header("Location: dorf1.php");
			}

		}
	}
};

$session = new Session;
$form = new Form;
$message = new Message;
?>