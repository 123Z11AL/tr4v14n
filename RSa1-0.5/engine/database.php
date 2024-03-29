<?php
include("config.php");

################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       db_MYSQL.php                                                #
##	Version        0.1                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Forum project: http://forum.2kdesign.es                                    #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################
class MYSQL_DB {
	
	var $connection;
	var $DataQuery = array();
			
	function MYSQL_DB() {
		$this->connection = mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS) or die(mysql_error());
		mysql_select_db(SQL_DB, $this->connection) or die(mysql_error());
	}

	/*****************************************
	Function to register users
	References: Username, Password, Email, Tribe, Activation
	*****************************************/	
	function register($username,$password,$email,$tribe,$locate,$act) {
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."users (username,password,gold,access,email,timestamp,tribe,location,act,protect) VALUES ('$username', '$password',".INIT_GOLD.",".USER.", '$email', $time, $tribe, $locate, '$act',$time)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		if(mysql_query($q,$this->connection)) {
			return mysql_insert_id($this->connection);
		}
		else {
			return false;
		}
	}
	
	function unreg($username) {
		$q = "DELETE from ".TB_PREFIX."users where username = '$username'";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		$this->DataQuery[]=$q;
		return mysql_query($q,$this->connection);
	}
	
	/*****************************************
	Function to check existance of email or the username.
	Mode 0: username;
	Mode 1: Email;
	References: Reference, Mode
	*****************************************/	
	function checkExist($ref,$mode) {
		if(!$mode) {
			$q = "SELECT username FROM ".TB_PREFIX."users where username = '$ref' LIMIT 1";		
		}
		else {
			$q = "SELECT email FROM ".TB_PREFIX."users where email = '$ref' LIMIT 1";		
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}

	/*****************************************
	Function to update any field in users.
	References: Username, Field Name, Value
	*****************************************/	
	function updateUserField($ref,$field,$value,$switch) {
		if(!$switch) {
			$q = "UPDATE ".TB_PREFIX."users set $field = '$value' where username = '$ref'";
		}
		else {
			$q = "UPDATE ".TB_PREFIX."users set $field = '$value' where id = '$ref'";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q, $this->connection);
	}
	
	function getSitee($uid) {
		$q = "SELECT id from ".TB_PREFIX."users where sit1 = $uid or sit2 = $uid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function removeMeSit($uid,$uid2) {
		$q = "UPDATE ".TB_PREFIX."users set sit1 = 0 where id = $uid and sit1 = $uid2";
		mysql_query($q,$this->connection);
		$q2 = "UPDATE ".TB_PREFIX."users set sit2 = 0 where id = $uid and sit2 = $uid2";
		mysql_query($q2,$this->connection);
		if (DBUG){
			$this->DataQuery[]=$q;
			$this->DataQuery[]=$q2;
		}
	}
	
	/*****************************************
	Function to retrieve data from specific field in users
	Mode 0: Search by ID
	Mode 1: Search by Username
	References: Reference, Field, Mode
	*****************************************/		
	function getUserField($ref,$field,$mode) {
		if(!$mode) {
			$q = "SELECT $field FROM ".TB_PREFIX."users where id = $ref";
		}
		else {
			$q = "SELECT $field FROM ".TB_PREFIX."users where username = '$ref'";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray[$field];
	}
	
	/*****************************************
	Function to login users
	References: Username, Password
	*****************************************/	
	function login($username,$password) {
		$q = "SELECT password,sessid FROM ".TB_PREFIX."users where username = '$username' and access != ".BANNED;
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if($dbarray['password'] == md5($password)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/*****************************************
	Function to login users by sitter
	References: Username, Password
	*****************************************/
	function sitterLogin($username,$password) {
		$q = "SELECT sit1,sit2 FROM ".TB_PREFIX."users where username = '$username' and access != ".BANNED;
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if($dbarray['sit1'] != 0) {
			$q2 = "SELECT password FROM ".TB_PREFIX."users where id = ".$dbarray['sit1']." and access != ".BANNED;
			if (DBUG){
				$this->DataQuery[]=$q2;
			}		
			$result2 = mysql_query($q2, $this->connection);
			$dbarray2 = mysql_fetch_array($result2);
		}
		else if($dbarray['sit2'] != 0) {
			$q3 = "SELECT password FROM ".TB_PREFIX."users where id = ".$dbarray['sit2']." and access != ".BANNED;
			if (DBUG){
				$this->DataQuery[]=$q3;
			}
			$result3 = mysql_query($q3, $this->connection);
			$dbarray3 = mysql_fetch_array($result3);
		}
		if($dbarray2['password'] == md5($password) || $dbarray3['password'] == md5($password)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function setDeleting($uid,$mode) {
		$time = time() + 72*3600;
		if(!$mode) {
			$q = "INSERT into ".TB_PREFIX."deleting values ($uid,$time)";
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."deleting where uid = $uid";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		mysql_query($q, $this->connection);
	}
	
	function isDeleting($uid) {
		$q = "SELECT timestamp from ".TB_PREFIX."deleting where uid = $uid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		$result = mysql_query($q,$this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['timestamp'];
	}
	
	function modifyGold($id,$amt,$mode) {
		if(!$mode) {
			$q = "UPDATE ".TB_PREFIX."USERS set gold = gold - $amt where id = $id";
		}
		else {
			$q = "UPDATE ".TB_PREFIX."USERS set gold = gold + $amt where id = $id";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q,$this->connection);
	}


	/*****************************************
	Function to retrieve user array via Username or ID
	Mode 0: Search by Username
	Mode 1: Search by ID
	References: Alliance ID
	*****************************************/	
	function getUserArray($ref,$mode) {
		if(!$mode) {
			$q = "SELECT * FROM ".TB_PREFIX."users where username = '$ref'";
		}
		else {
			$q = "SELECT * FROM ".TB_PREFIX."users where id = $ref";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	function activeModify($username,$mode) {
		$time = time();
		if(!$mode) {
			$q = "INSERT into ".TB_PREFIX."active VALUES ('$username',$time)";
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."active where username = '$username'";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q, $this->connection);
	}

	function addActiveUser($username,$time) {
		$q = "REPLACE into ".TB_PREFIX."active values ('$username',$time)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		if(mysql_query($q, $this->connection)) {
			return true;
		}
		else {
			return false;
		}
	}
   
	function updateActiveUser($username,$time) {
		$q = "REPLACE into ".TB_PREFIX."active values ('$username',$time)";
		$q2 = "UPDATE ".TB_PREFIX."users set timestamp = $time where username = '$username'";			
		if (DBUG){
			$this->DataQuery[]=$q;
			$this->DataQuery[]=$q2;
		}		
		$exec1 = mysql_query($q, $this->connection);
		$exec2 = mysql_query($q2, $this->connection);	
		if($exec1 && $exec2) {
			return true;
		}
		else {
			return false;
		}
	}

	function checkactiveSession($username,$sessid) {
		$q = "SELECT username FROM ".TB_PREFIX."users where username = '$username' and sessid = '$sessid' LIMIT 1";
		$result = mysql_query($q, $this->connection);
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		if(mysql_num_rows($result) != 0) {
			return true;
		}
		else {
			return false;
		}
	}
   
	function submitProfile($uid,$gender,$location,$birthday,$des1,$des2) {
		$q = "UPDATE ".TB_PREFIX."users set gender = $gender, location = '$location', birthday = '$birthday', desc1 = '$des1', desc2 = '$des2' where id = $uid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q,$this->connection);
	}
   
	function generateBase($sector) {
		switch($sector) {
			case 1:
			$q = "Select * from ".TB_PREFIX."wdata where fieldtype = 3 and x < 0 and y > 0 and occupied = 0 LIMIT 200";
			break;
			case 2:
			$q = "Select * from ".TB_PREFIX."wdata where fieldtype = 3 and x > 0 and y > 0 and occupied = 0 LIMIT 200";
			break;
			case 3:
			$q = "Select * from ".TB_PREFIX."wdata where fieldtype = 3 and x < 0 and y < 0 and occupied = 0 LIMIT 200";
			break;
			case 4:
			$q = "Select * from ".TB_PREFIX."wdata where fieldtype = 3 and x > 0 and y < 0 and occupied = 0 LIMIT 200";
			break;
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}			
			$result = mysql_query($q, $this->connection);
			$num_rows = mysql_num_rows($result);
			$result = $this->mysql_fetch_all($result);
			$base = rand(0, ($num_rows-1));
			return $result[$base]['id'];
	}
	
	function setFieldTaken($id) {
		$q = "UPDATE ".TB_PREFIX."wdata set occupied = 1 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q, $this->connection);
	}
	
	function addVillage($wid,$uid,$username,$capital) {
		$total = count($this->getVillagesID($uid));
		if ($total >= 1) {
		$vname = $username." village ".($total+1);
		}
		else {
		$vname = $username." village";
		} 
		$time = time();
		$q = "INSERT into ".TB_PREFIX."vdata values ($wid, $uid, '$vname', $capital, 2, 1, 750, 750, 750, 800, 750, 800, $time, 100)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q, $this->connection);
	}
	
	function addResourceFields($vid,$type) {
		switch($type) {
			case 1:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,4,4,1,4,4,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 2:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,1,3,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 3:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,3,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 4:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,2,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 5:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,3,1,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 6:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,4,4,1,3,4,4,4,4,4,4,4,4,4,4,4,2,4,4,1,15)";
			break;
			case 7:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,4,1,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 8:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,4,1,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 9:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,4,1,1,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 10:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,1,2,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
			case 11:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,1,1,3,1,4,4,3,3,4,4,3,1,4,4,2,4,4,1,15)";
			break;
			case 12:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,1,2,2,3,4,4,3,3,4,4,1,4,1,2,1,1,15)";
			break;
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q, $this->connection);
	}
	
	/*****************************************
	Function to retrieve type of village via ID
	References: Village ID
	*****************************************/
	function getVillageType($wref) {
		$q = "SELECT fieldtype FROM ".TB_PREFIX."wdata where id = $wref";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['fieldtype'];
	}
	
	/*****************************************
	Function to retrieve if is ocuped via ID
	References: Village ID
	*****************************************/
	function getVillageState($wref) {
		$q = "SELECT occupied FROM ".TB_PREFIX."wdata where id = $wref";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['occupied'];
	}	
	
	function getProfileVillages($uid) {
		$q = "SELECT capital,wref,name,pop from ".TB_PREFIX."vdata where owner = $uid order by capital desc";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getVillagesID($uid) {
		$q = "SELECT wref from ".TB_PREFIX."vdata where owner = $uid order by capital DESC";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$array = $this->mysql_fetch_all($result);
		$newarray = array();
		for($i=0;$i<count($array);$i++) {
			array_push($newarray,$array[$i]['wref']);
		}
		return $newarray;
	}
	
	function getVillage($vid) {
		$q = "SELECT * FROM ".TB_PREFIX."vdata where wref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	function getMInfo($id) {
		$q = "SELECT * FROM ".TB_PREFIX."wdata left JOIN ".TB_PREFIX."vdata ON ".TB_PREFIX."vdata.wref = ".TB_PREFIX."wdata.id where ".TB_PREFIX."wdata.id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	function getOasis($vid) {
		$q = "SELECT * FROM ".TB_PREFIX."odata where conqured = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getOasisInfo($wid) {
		$q = "SELECT * FROM ".TB_PREFIX."odata where wref = $wid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function getVillageField($ref,$field) {
		$q = "SELECT $field FROM ".TB_PREFIX."vdata where wref = $ref";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray[$field];
	}
	
	function setVillageField($ref,$field,$value) {
		$q = "UPDATE ".TB_PREFIX."vdata set $field = '$value' where wref = $ref";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function getResourceLevel($vid) {
		$q = "SELECT * from ".TB_PREFIX."fdata where vref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function getCoor($wref) {
		$q = "SELECT x,y FROM ".TB_PREFIX."wdata where id = $wref";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}

	function CheckForum($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_cat where alliance = '$id'";
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function CountCat($id) {
		$q = "SELECT count(id) FROM ".TB_PREFIX."forum_topic where cat = '$id'";
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	function LastTopic($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id' order by post_date";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function CheckLastTopic($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id'";
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function CheckLastPost($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function LastPost($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function CountTopic($id) {
		$q = "SELECT count(id) FROM ".TB_PREFIX."forum_post where owner = '$id'";
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		
		$qs = "SELECT count(id) FROM ".TB_PREFIX."forum_topic where owner = '$id'";
		$results = mysql_query($qs,$this->connection);
		$rows = mysql_fetch_row($results);
		return $row[0]+$rows[0];
	}
	
	function CountPost($id) {
		$q = "SELECT count(id) FROM ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
		
	function ForumCat() {
		$q = "SELECT * from ".TB_PREFIX."forum_cat ORDER BY id";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function ForumCatEdit($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_cat where id = '$id'";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function ForumCatName($id) {
		$q = "SELECT forum_name from ".TB_PREFIX."forum_cat where id = $id";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['forum_name'];
	}
	
	function CheckCatTopic($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id'";
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function CheckResultEdit($alli) {
		$q = "SELECT * from ".TB_PREFIX."forum_edit where alliance = '$alli'";
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function CheckCloseTopic($id) {
		$q = "SELECT close from ".TB_PREFIX."forum_topic where id = '$id'";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['close'];
	}
	
	function CheckEditRes($alli) {
		$q = "SELECT result from ".TB_PREFIX."forum_edit where alliance = '$alli'";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['result'];
	}
	
	function CreatResultEdit($alli,$result) {
		$q = "INSERT into ".TB_PREFIX."forum_edit values (0,'$alli','$result')";
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function UpdateResultEdit($alli,$result) {
		$date = time();
		$q = "UPDATE ".TB_PREFIX."forum_edit set result = '$result' where alliance = '$alli'";
		return mysql_query($q, $this->connection);
	}
	
	function UpdateEditTopic($id,$title,$cat) {
		$q = "UPDATE ".TB_PREFIX."forum_topic set title = '$title', cat = '$cat' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function UpdateEditForum($id,$name,$des) {
		$q = "UPDATE ".TB_PREFIX."forum_cat set forum_name = '$name', forum_des = '$des' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function StickTopic($id,$mode) {
		$q = "UPDATE ".TB_PREFIX."forum_topic set stick = '$mode' where id = '$id'";
		return mysql_query($q, $this->connection);
	}
	
	function ForumCatTopic($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id' AND stick = '' ORDER BY post_date desc";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function ForumCatTopicStick($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id' AND stick = '1' ORDER BY post_date desc";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function ShowTopic($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_topic where id = '$id'";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function ShowPost($id) {
		$q = "SELECT * from ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function CreatForum($owner,$alli,$name,$des,$area) {
		$q = "INSERT into ".TB_PREFIX."forum_cat values (0,'$owner','$alli','$name','$des','$area')";
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function CreatTopic($title,$post,$cat,$owner,$alli,$ends) {
		$date = time();
		$q = "INSERT into ".TB_PREFIX."forum_topic values (0,'$title','$post','$date','$date','$cat','$owner','$alli','$ends','','')";
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function CreatPost($post,$tids,$owner) {
		$date = time();
		$q = "INSERT into ".TB_PREFIX."forum_post values (0,'$post','$tids','$owner','$date')";
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function UpdatePostDate($id) {
		$date = time();
		$q = "UPDATE ".TB_PREFIX."forum_topic set post_date = '$date' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function EditUpdateTopic($id,$post) {
		$q = "UPDATE ".TB_PREFIX."forum_topic set post = '$post' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function EditUpdatePost($id,$post) {
		$q = "UPDATE ".TB_PREFIX."forum_post set post = '$post' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function LockTopic($id,$mode) {
		$q = "UPDATE ".TB_PREFIX."forum_topic set close = '$mode' where id = '$id'";
		return mysql_query($q, $this->connection);
	}
	
	function DeleteCat($id) {
		$qs = "DELETE from ".TB_PREFIX."forum_cat where id = '$id'";
		$q = "DELETE from ".TB_PREFIX."forum_topic where cat = '$id'";
			mysql_query($qs,$this->connection);
		return mysql_query($q,$this->connection);
	}
	
	function DeleteTopic($id) {
		$qs = "DELETE from ".TB_PREFIX."forum_topic where id = '$id'";
		$q = "DELETE from ".TB_PREFIX."forum_post where topic = '$id'";
			mysql_query($qs,$this->connection);
		return mysql_query($q,$this->connection);
	}
	
	function DeletePost($id) {
		$q = "DELETE from ".TB_PREFIX."forum_post where id = '$id'";
		return mysql_query($q,$this->connection);
	}
	
	function getAllianceName($id) {
		$q = "SELECT tag from ".TB_PREFIX."alidata where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['tag'];
	}
	
	function getAlliance($id) {
		$q = "SELECT * from ".TB_PREFIX."alidata where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result); 
	}
	
	function setAlliName($aid,$name,$tag) {
		$q = "UPDATE ".TB_PREFIX."alidata set name = '$name', tag = '$tag' where id = $aid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
		
	function isAllianceOwner($id) {
		$q = "SELECT * from ".TB_PREFIX."alidata where leader = $id"; 
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	function aExist($ref,$type) {
		$q = "SELECT $type FROM ".TB_PREFIX."alidata where $type = '$ref'";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		if(mysql_num_rows($result)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/*****************************************
	Function to create an alliance
	References: 
	*****************************************/
	function createAlliance($tag,$name,$uid,$max) {
		$q = "INSERT into ".TB_PREFIX."alidata values (0,'$name','$tag',$uid,0,0,0,'','',$max)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	
	/*****************************************
	Function to insert an alliance new
	References: 
	*****************************************/
	function insertAlliNotice($aid,$notice) {
		$time = time();
		$q = "INSERT into ".TB_PREFIX."ali_log values (0,'$aid','$notice',$time)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	/*****************************************
	Function to read all alliance news
	References: 
	*****************************************/
	function readAlliNotice($aid) {
		$q = "SELECT * from ".TB_PREFIX."ali_log where aid = $aid ORDER BY date DESC";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
			
	/*****************************************
	Function to create alliance permissions
	References: ID, notice, description
	*****************************************/
	function createAlliPermissions($uid,$aid,$rank,$opt1,$opt2,$opt3,$opt4,$opt5,$opt6,$opt7,$opt8) {
		
		$q = "INSERT into ".TB_PREFIX."ali_permission values(0,'$uid','$aid','$rank','$opt1','$opt2','$opt3','$opt4','$opt5','$opt6','$opt7','$opt8')";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		mysql_query($q,$this->connection);
		return mysql_insert_id($this->connection);
	}
	
	/*****************************************
	Function to update alliance permissions
	References: 
	*****************************************/
	function deleteAlliPermissions($uid) {
		$q = "DELETE from ".TB_PREFIX."ali_permission where uid = '$uid'";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}	
	/*****************************************
	Function to update alliance permissions
	References: 
	*****************************************/
	function updateAlliPermissions($uid,$aid,$rank,$opt1,$opt2,$opt3,$opt4,$opt5,$opt6,$opt7) {
		
		$q = "UPDATE ".TB_PREFIX."ali_permission SET rank = '$rank', opt1 = '$opt1', opt2 = '$opt2', opt3 = '$opt3', opt4 = '$opt4', opt5 = '$opt5', opt6 = '$opt6', opt7 = '$opt7' where uid = $uid && alliance =$aid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}

	/*****************************************
	Function to read alliance permissions
	References: ID, notice, description
	*****************************************/	
	function getAlliPermissions($uid, $aid) {
		$q = "SELECT * FROM ".TB_PREFIX."ali_permission where uid = $uid && alliance = $aid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return mysql_fetch_assoc($result);
	}			
	
	/*****************************************
	Function to update an alliance description and notice
	References: ID, notice, description
	*****************************************/
	function submitAlliProfile($aid,$notice,$desc) {
		
		$q = "UPDATE ".TB_PREFIX."alidata SET `notice` = '$notice', `desc` = '$desc' where id = $aid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}	
		
	function getUserAlliance($id) {
		$q = "SELECT ".TB_PREFIX."alidata.tag from ".TB_PREFIX."users join ".TB_PREFIX."alidata where ".TB_PREFIX."users.alliance = ".TB_PREFIX."alidata.id and ".TB_PREFIX."users.id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if($dbarray['tag'] == "") {
			return "-";
		}
		else {
			return $dbarray['tag'];
		}
	}
	
	/*****************************************
	Function to purge an alliance 
	References: 
	*****************************************/	
	function cleanAlliance($aid) {
		$q = "DELETE from ".TB_PREFIX."alidata where id = '$aid'";
		$q1 = mysql_query($q,$this->connection);
		$q = "DELETE from ".TB_PREFIX."ali_invite where alliance = '$aid'";
		$q2 = mysql_query($q,$this->connection);
		if (DBUG){
			$this->DataQuery[]=$q;
			$this->DataQuery[]=$q2;
		}		
		if (PURGE_ALLI_LOG){
			$q = "DELETE from ".TB_PREFIX."ali_log where aid = '$aid'";
			$q3 = mysql_query($q,$this->connection);
			if (DBUG){
				$this->DataQuery[]=$q3;
			}		
		}					
		if ($q1 && $q2){
			return true;
		}else{
			return false;
		}
	}	
	
	
	function modifyResource($vid,$wood,$clay,$iron,$crop,$mode) {
		if(!$mode) {
			$q = "UPDATE ".TB_PREFIX."vdata set wood = wood - $wood, clay = clay - $clay, iron = iron - $iron, crop = crop - $crop where wref = $vid";
					$this->DataQuery[]=$q;
		}
		else {
			$q = "UPDATE ".TB_PREFIX."vdata set wood = wood + $wood, clay = clay + $clay, iron = iron + $iron, crop = crop + $crop where wref = $vid";
					$this->DataQuery[]=$q;
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		return mysql_query($q, $this->connection);
	}
	
	function getFieldLevel($vid,$field) {
		$q = "SELECT f".$field." from ".TB_PREFIX."fdata where vref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return mysql_result($result,0);
	}
	
	function getVSumField($uid,$field) {
		$q = "SELECT sum(".$field.") FROM ".TB_PREFIX."vdata where owner = $uid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	function updateVillage($vid) {
		$time = time();
		$q = "UPDATE ".TB_PREFIX."vdata set lastupdate = $time where wref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function setVillageName($vid,$name) {
		$q = "UPDATE ".TB_PREFIX."vdata set name = '$name' where wref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function modifyPop($vid,$pop,$mode) {
		if (!$mode) {
			$q = "UPDATE ".TB_PREFIX."vdata set pop = pop + $pop where wref = $vid";
		}
		else {
			$q = "UPDATE ".TB_PREFIX."vdata set pop = pop - $pop where wref = $vid";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function addCP($ref,$cp,$mode) {
		if (!$mode){
		$q = "UPDATE ".TB_PREFIX."vdata set cp = cp + $cp where wref = $ref";
		}else{
		$q = "UPDATE ".TB_PREFIX."vdata set cp = cp - $cp where wref = $ref";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function getInvitation($uid) {
		$q = "SELECT * FROM ".TB_PREFIX."ali_invite where uid = $uid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	function getAliInvitations($aid) {
		$q = "SELECT * FROM ".TB_PREFIX."ali_invite where alliance = $aid && accept = 0";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}	
	
	function removeInvitation($id) {
		$q = "DELETE FROM ".TB_PREFIX."ali_invite where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function sendInvitation($uid, $alli, $sender) {
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."ali_invite values (0,$uid,$alli,$sender,$time,0)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);	
	}
	
	/*****************************************
	Function to get messages
	Mode 1: Get inbox
	Mode 2: Get sent
	Mode 3: Get message
	Mode 4: Set viewed
	Mode 5: Remove message
	Mode 6: Retrieve archive
	References: User ID/Message ID, Mode
	*****************************************/
	function getMessage($id,$mode) {
		switch($mode) {
			case 1:
			$q = "SELECT * FROM ".TB_PREFIX."mdata WHERE target = $id and send = 0 and archived = 0 ORDER BY time DESC";
			break;
			case 2:
			$q = "SELECT * FROM ".TB_PREFIX."mdata WHERE owner = $id and send = 1 and archived = 0 ORDER BY time DESC";
			break;
			case 3:
			$q = "SELECT * FROM ".TB_PREFIX."mdata where id = $id ORDER BY time DESC";
			break;
			case 4:
			$q = "UPDATE ".TB_PREFIX."mdata set viewed = 1 where id = $id ORDER BY time DESC";
			break;
			case 5:
			$q = "DELETE FROM ".TB_PREFIX."mdata where id = $id ORDER BY time DESC";
			break;
			case 6:
			$q = "SELECT * FROM ".TB_PREFIX."mdata where target = $id and send = 0 and archived = 1 ORDER BY time DESC";
			break;
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}		
		if($mode <= 3 || $mode == 6) {
			$result = mysql_query($q, $this->connection);
			return $this->mysql_fetch_all($result);
		}
		else {
			return mysql_query($q, $this->connection);
		}
	}
	
	function sendMessage($client,$owner,$topic,$message,$send) {
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."mdata values (0,$client,$owner,'$topic',\"$message\",0,0,$send,$time)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function setArchived($id) {
		$q = "UPDATE ".TB_PREFIX."mdata set archived = 1 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function setNorm($id) {
		$q = "UPDATE ".TB_PREFIX."mdata set archived = 0 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	/*****************************************/
			
	
	/*****************************************
	Function to get reprots
	Mode 1: Get inbox
	Mode 2: Get sent
	References: $arrayData, Mode
	*****************************************/		
	function unarchiveNotice($id) {
		$q = "UPDATE ".TB_PREFIX."ndata set archive = 0, in_group = 0 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function archiveNotice($id) {
		$q = "UPDATE ".TB_PREFIX."ndata set archive = 1, in_group = 1 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function removeNotice($id) {
		$q = "DELETE FROM ".TB_PREFIX."ndata where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function noticeViewed($id) {
		$q = "UPDATE ".TB_PREFIX."ndata set viewed = 1 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function addNotice($uid,$type,$topic,$data) {
		$time = time();
		//$q = "INSERT INTO ".TB_PREFIX."ndata values (0,$uid,'$topic',$type,'$data',$time,0)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function getNotice($uid) {
		$q = "SELECT * FROM ".TB_PREFIX."ndata where receiver = $uid ORDER BY time DESC";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	/*****************************************/
	
	function addBuilding($wid,$field,$type,$loop,$time,$action) {
		$q = "INSERT into ".TB_PREFIX."bdata values (0,$wid,$field,$type,$loop,$time,$action)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function removeBuilding($d) {
		$q = "DELETE FROM ".TB_PREFIX."bdata where id = $d";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function getJobs($wid) {
		$q = "SELECT * FROM ".TB_PREFIX."bdata where wid = $wid order by ID ASC";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getVillageByName($name) {
		$name = mysql_real_escape_string($name,$this->connection); 
		$q = "SELECT wref FROM ".TB_PREFIX."vdata where name = '$name' limit 1";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['wref'];
	}
	
	/*****************************************
	Function to set accept flag on market
	References: id
	*****************************************/
	function setMarketAcc($id) {
		$q = "UPDATE ".TB_PREFIX."market set accept = 1 where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	/*****************************************
	Function to send resource to other village
	Mode 0: Send
	Mode 1: Cancel
	References: Wood/ID, Clay, Iron, Crop, Mode
	*****************************************/
	function sendResource($ref,$clay,$iron,$crop,$merchant,$mode) {
		if(!$mode) {
			$q = "INSERT INTO ".TB_PREFIX."send values (0,$ref,$clay,$iron,$crop,$merchant)";
			if (DBUG){
				$this->DataQuery[]=$q;
			}
			mysql_query($q, $this->connection);
			return mysql_insert_id($this->connection);
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."send where id = $ref";
			if (DBUG){
				$this->DataQuery[]=$q;
			}	
			return mysql_query($q, $this->connection);
		}
	}
	
	/*****************************************
	Function to add market offer
	Mode 0: Add
	Mode 1: Cancel
	References: Village, Give, Amt, Want, Amt, Time, Alliance, Mode
	*****************************************/
	function addMarket($vid,$gtype,$gamt,$wtype,$wamt,$time,$alliance,$merchant,$mode) {
		if(!$mode) {
			$q = "INSERT INTO ".TB_PREFIX."market values (0,$vid,$gtype,$gamt,$wtype,$wamt,0,$time,$alliance,$merchant)";
			if (DBUG){
				$this->DataQuery[]=$q;
			}		
			mysql_query($q, $this->connection);
			return mysql_insert_id($this->connection);
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."market where id = $gtype and vref = $vid";
			if (DBUG){
				$this->DataQuery[]=$q;
			}	
			return mysql_query($q, $this->connection);
		}
	}
	
	/*****************************************
	Function to get market offer
	References: Village, Mode
	*****************************************/
	function getMarket($vid,$mode) {
		$alliance = $this->getUserField($this->getVillageField($vid,"owner"),"alliance",0);
		if(!$mode) {
			$q = "SELECT * FROM ".TB_PREFIX."market where vref = $vid and accept = 0";
			if (DBUG){
				$this->DataQuery[]=$q;
			}	
		}
		else {
			$q = "SELECT * FROM ".TB_PREFIX."market where vref != $vid and alliance = $alliance or vref != $vid and alliance = 0 and accept = 0";
			if (DBUG){
				$this->DataQuery[]=$q;
			}
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	/*****************************************
	Function to get market offer
	References: ID
	*****************************************/
	function getMarketInfo($id) {
		$q = "SELECT * FROM ".TB_PREFIX."market where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function setMovementProc($moveid) {
		$q = "UPDATE ".TB_PREFIX."movement set proc = 1 where moveid = $moveid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	/*****************************************
	Function to retrieve used merchant
	References: Village
	*****************************************/
	function totalMerchantUsed($vid) {
		$time = time();
		$q = "SELECT sum(".TB_PREFIX."send.merchant) from ".TB_PREFIX."send, ".TB_PREFIX."movement where ".TB_PREFIX."movement.from = $vid and ".TB_PREFIX."send.id = ".TB_PREFIX."movement.ref and ".TB_PREFIX."movement.proc = 0 and type = 0";
		 $result = mysql_query($q, $this->connection);
		 $row = mysql_fetch_row($result);
		 $q2 = "SELECT sum(ref) from ".TB_PREFIX."movement where type = 2 and ".TB_PREFIX."movement.to = $vid and proc = 0";
		 $result2 = mysql_query($q2, $this->connection);
		 $row2 = mysql_fetch_row($result2);
		 $q3 = "SELECT sum(merchant) from ".TB_PREFIX."market where vref = $vid and accept = 0";
		 $result3 = mysql_query($q3, $this->connection);
		 $row3 = mysql_fetch_row($result3);
		 if (DBUG){
			$this->DataQuery[]=$q;
			$this->DataQuery[]=$q2;
			$this->DataQuery[]=$q3;
		}
		 return $row[0]+$row2[0]+$row3[0];
	}
	
	/*****************************************
	Function to retrieve movement of village
	Type 0: Send Resource
	Type 1: Send Merchant
	Type 2: Return Resource
	Type 3: Send Rainforce
	Type 4: Send Attack
	Type 5: Send Raid
	Type 13: Return Rainforce
	Type 14: Return Attack
	Type 15: return Raid
	Type 6: All Movements	
	Mode 0: Send/Out
	Mode 1: Recieve/In
	References: Type, Village, Mode
	*****************************************/
	function getMovement($type,$village,$mode) {
		$time = time();
		if(!$mode) {
			$where = "from";
		}
		else {
			$where = "to";
		}
		switch($type) {
			case 0: $q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."send where ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.ref = ".TB_PREFIX."send.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.type = 0"; break;
			case 2: $q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and type = 0 and proc = 2"; break;
			case 3: $q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and type = 3 and proc = 0 and ".TB_PREFIX."movement.endtime >= ".$time." ORDER BY endtime"; break;
			case 4: $q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and type = 4 and proc = 0 and ".TB_PREFIX."movement.endtime >= ".$time." ORDER BY endtime"; break;
			case 5: $q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and type = 5 and proc = 0 and ".TB_PREFIX."movement.endtime >= ".$time." ORDER BY endtime"; break;
			case 6: $q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and proc = 0 and ".TB_PREFIX."movement.endtime >= ".$time." ORDER BY endtime"; break;			
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		$array = $this->mysql_fetch_all($result);
		return $array;
	}
	
	function addMovement($type,$from,$to,$ref,$endtime) {
		$q = "INSERT INTO ".TB_PREFIX."movement values (0,$type,$from,$to,$ref,$endtime,0)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	/*****************************************
	Function to send trops to other village
	Mode 0: Send
	Mode 1: Cancel
	References:
	*****************************************/
	function sendTroops($u1,$u2,$u3,$u4,$u5,$u6,$u7,$u8,$u9,$u10,$from,$vref,$tribe,$mode) {
		if(!$mode) {			
		$Array = array('u1'=>0,'u2'=>0,'u3'=>0,'u4'=>0,'u5'=>0,'u6'=>0,'u7'=>0,'u8'=>0,'u9'=>0,'u10'=>0,'u11'=>0,'u12'=>0,'u13'=>0,'u14'=>0,'u15'=>0,'u16'=>0,'u17'=>0,'u18'=>0,'u19'=>0,'u20'=>0,'u21'=>0,'u22'=>0,'u23'=>0,'u24'=>0,'u25'=>0,'u26'=>0,'u27'=>0,'u28'=>0,'u29'=>0,'u30'=>0);
		$start = ($tribe == 1)? 1 : (($tribe == 2)? 11 : 21);
		$index = 1;
		for($i=$start;$i<=($start+9);$i++) {
			$Array['u'.$i] = $Array['u'.$i]+${'u'.$index};
			$index += 1;
		}		
			$q = "INSERT INTO ".TB_PREFIX."enforcement values (0,$Array[u1],$Array[u2],$Array[u3],$Array[u4],$Array[u5],$Array[u6],$Array[u7],$Array[u8],$Array[u9],$Array[u10],$Array[u11],$Array[u12],$Array[u13],$Array[u14],$Array[u15],$Array[u16],$Array[u17],$Array[u18],$Array[u19],$Array[u20],$Array[u21],$Array[u22],$Array[u23],$Array[u24],$Array[u25],$Array[u26],$Array[u27],$Array[u28],$Array[u29],$Array[u30],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$from,$vref)";
			if (DBUG){
				$this->DataQuery[]=$q;
			}
			mysql_query($q, $this->connection);
			return mysql_insert_id($this->connection);
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."enforcement where id = $vref";
			if (DBUG){
				$this->DataQuery[]=$q;
			}	
			return mysql_query($q, $this->connection);
		}
	}	
	
	/***************************
	Function to get ranking array
	References: -
	***************************/
	function getRanking() {
		if(INCLUDE_ADMIN) {
			$q = "SELECT id,username,alliance,ap,dp FROM ".TB_PREFIX."users where access != ".BANNED;
		}
		else {
			$q = "SELECT id,username,alliance,ap,dp FROM ".TB_PREFIX."users where access = ".USER;
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getVRanking() {
		$q = "SELECT wref,name,owner,pop FROM ".TB_PREFIX."vdata where wref != ''";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getARanking() {
		$q = "SELECT id,name,tag FROM ".TB_PREFIX."alidata where id != ''";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getAllMember($aid) {
		$q = "SELECT id,username,timestamp,ap,dp FROM ".TB_PREFIX."users where alliance = $aid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function addUnits($vid) {
		$q = "INSERT into ".TB_PREFIX."units (vref) values ($vid)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function getUnit($vid) {
		$q = "SELECT * from ".TB_PREFIX."units where vref = '".$vid."'";
		$result = mysql_query($q,$this->connection);
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_fetch_assoc($result);
	}
	
	function addTech($vid) {
		$q = "INSERT into ".TB_PREFIX."tdata (vref) values ($vid)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function addABTech($vid) {
		$q = "INSERT into ".TB_PREFIX."abdata (vref) values ($vid)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q, $this->connection);
	}
	
	function getABTech($vid) {
		$q = "SELECT * FROM ".TB_PREFIX."abdata where vref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function addResearch($vid,$tech,$time) {
		$q = "INSERT into ".TB_PREFIX."research values (0,$vid,'$tech',$time)";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function getResearching($vid) {
		$q = "SELECT * FRom ".TB_PREFIX."research where vref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getTech($vid) {
		$q = "SELECT * from ".TB_PREFIX."tdata where vref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function getTraining($vid) {
		$q = "SELECT * FROM ".TB_PREFIX."training where vref = $vid";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function trainUnit($vid,$unit,$amt,$pop,$each,$time,$mode) {
		if(!$mode) {
			$q = "INSERT INTO ".TB_PREFIX."training values (0,$vid,$unit,$amt,$pop,$time,$each,$time)";
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."training where id = $vid";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function updateTraining($id,$trained) {
		$time = time();
		$q = "UPDATE ".TB_PREFIX."training set amt = amt - $trained, timestamp = $time where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
	function modifyUnit($vref,$unit,$amt,$mode) {
		$unit = 'u'.$unit;
		if(!$mode) {
			$q = "UPDATE ".TB_PREFIX."units set $unit = $unit - $amt where vref = $vref";
		}
		else {
			$q = "UPDATE ".TB_PREFIX."units set $unit = $unit + $amt where vref = $vref";
		}
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		return mysql_query($q,$this->connection);
	}
	
		function getEnforce($vid,$mode) {
			if($mode) {
				$q = "SELECT * from ".TB_PREFIX."enforcement, ".TB_PREFIX."movement where ".TB_PREFIX."movement.to = $vid and ".TB_PREFIX."movement.ref = ".TB_PREFIX."enforcement.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.type = 3 and ".TB_PREFIX."movement.endtime <= ".time();
			}
			else {
				$q = "SELECT * from ".TB_PREFIX."enforcement where from = $vid";
			}
			if (DBUG){
				$this->DataQuery[]=$q;
			}
			$result = mysql_query($q,$this->connection);
			return $this->mysql_fetch_all($result);
		}
	
	function getEnforceArray($id) {
		$q = "SELECT * from ".TB_PREFIX."enforcement where id = $id";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function modifyCommence($id) {
		$time = time();
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$q = "UPDATE ".TB_PREFIX."training set commence = $time";
		return mysql_query($q,$this->connection);
	}
	
	function getTrainingList() {
		$q = "SELECT * FROM ".TB_PREFIX."training where vref != ''";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getNeedDelete() {
		$time = time();
		$q = "SELETE uid FROM ".TB_PREFIX."deleting where timestampe < $time";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	/*****************************************
	Function to calculate registered users
	References: -
	*****************************************/	
	function countUser() {
		$q = "SELECT count(id) FROM ".TB_PREFIX."users where id != 0";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	/*****************************************
	Function to calculate Active users
	References: -
	*****************************************/	
	function countActiveUser() {
		$time = time()-86400;
		$q = "SELECT count(id) FROM ".TB_PREFIX."users where timestamp > ".$time ;
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	/*****************************************
	Function to calculate Online users
	References: -
	*****************************************/	
	function countOnlineUser() {
		$q = "SELECT count(username) FROM ".TB_PREFIX."active";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}

	/*****************************************
	Function to calculate tribe users
	References: $tribe
	*****************************************/
	function countTribeUser($tribe) {
		$q = "SELECT count(id) FROM ".TB_PREFIX."users where tribe =".$tribe;
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}	
			
	/*****************************************
	Function to calculate all alliances
	References: -
	*****************************************/	
	function countAlli() {
		$q = "SELECT count(id) FROM ".TB_PREFIX."alidata where id != 0";
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q,$this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	/*****************************************
	Function to process MYSQLi->fetch_all (Only exist in MYSQL)
	References: Result
	*****************************************/
	function mysql_fetch_all($result) {
		$all = array();
		if($result) {
		while ($row = mysql_fetch_assoc($result)){ $all[] = $row; }
		return $all;
		}
	}
	
	function query_return($q) {
		if (DBUG){
			$this->DataQuery[]=$q;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	/*****************************************
	Function to do free query
	References: Query
	*****************************************/
	function query($query) {
		if (DBUG){
			$this->DataQuery[]=$query;
		}		
		return mysql_query($query, $this->connection);
	}
};

$database = new MYSQL_DB;
?>