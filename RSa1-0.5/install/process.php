<?php
if(file_exists("include/constant.php")) {
	include("include/database.php");
}
class Process {
			
	function Process() {
		if(isset($_POST['subconst'])) {
				$this->constForm();
		}
		else if(isset($_POST['substruc'])) {
				$this->createStruc();
		}
		else if(isset($_POST['subwdata'])) {
				$this->createWdata();
		}
		else if(isset($_POST['subacc'])) {
				$this->createAcc();
		}
		else{
          header("Location: index.php");
       }
	}

	function constForm() {
		$myFile = "include/constant.php";
		$fh = fopen($myFile, 'w') or die("can't open file");
		$text = file_get_contents("data/constant_format.tpl");
		$text = preg_replace("'%SERVERNAME%'",$_POST['servername'],$text);
		$text = preg_replace("'%LANG%'",$_POST['lang'],$text);		
		$text = preg_replace("'%SPEED%'",$_POST['speed'],$text);
		$text = preg_replace("'%INCSPEED%'", $_POST['incspeed'], $text);		
		$text = preg_replace("'%UTRACK%'", $_POST['trackusers'], $text);		
		$text = preg_replace("'%UTOUT%'",$_POST['timeout'],$text);	
		$text = preg_replace("'%AUTOD%'",$_POST['autodel'],$text);
		$text = preg_replace("'%AUTODT%'",$_POST['autodeltime'],$text);				
		$text = preg_replace("'%MAX%'",$_POST['wmax'],$text);
		$text = preg_replace("'%GP%'",$_POST['gpack'],$text);
		$text = preg_replace("'%SSERVER%'",$_POST['sserver'],$text);
		$text = preg_replace("'%SUSER%'",$_POST['suser'],$text);
		$text = preg_replace("'%SPASS%'",$_POST['spass'],$text);
		$text = preg_replace("'%SDB%'",$_POST['sdb'],$text);
		$text = preg_replace("'%PREFIX%'",$_POST['prefix'],$text);
		$text = preg_replace("'%CONNECTT%'", $_POST['connectt'], $text);
		$text = preg_replace("'%AEMAIL%'",$_POST['aemail'],$text);
		$text = preg_replace("'%ANAME%'", $_POST['aname'], $text);
		$text = preg_replace("'%SUBDOM%'", $_POST['subdom'], $text);
		$text = preg_replace("'%LOGBUILD%'", $_POST['log_build'], $text);
		$text = preg_replace("'%LOGTECH%'", $_POST['log_tech'], $text);
		$text = preg_replace("'%LOGLOGIN%'", $_POST['log_login'], $text);
		$text = preg_replace("'%LOGGOLDFIN%'", $_POST['log_gold_fin'], $text);
		$text = preg_replace("'%LOGADMIN%'", $_POST['log_admin'], $text);
		$text = preg_replace("'%LOGWAR%'", $_POST['log_war'], $text);
		$text = preg_replace("'%LOGMARKET%'", $_POST['log_market'], $text);
		$text = preg_replace("'%LOGILLEGAL%'", $_POST['log_illegal'], $text);	
		$text = preg_replace("'%MINUSERLENGTH%'", $_POST['userlength'], $text);
		$text = preg_replace("'%MINPASSLENGTH%'", $_POST['passlength'], $text);
		$text = preg_replace("'%SPECIALCHARS%'", $_POST['specialchars'], $text);
		$text = preg_replace("'%ACTIVATE%'", $_POST['authmail'], $text);
		$text = preg_replace("'%ARANK%'", $_POST['admin_rank'], $text);	
		$text = preg_replace("'%ACTCEN%'", $_POST['actcensor'], $text);
		$text = preg_replace("'%CENWORDS%'", $_POST['words'], $text);									
																				
		fwrite($fh, $text);
		if(file_exists("include/constant.php")) {
		header("Location: index.php?s=2");
		}
		else {
			header("Location: index.php?s=1&c=1");
		}
		fclose($fh);
	}
	
	function createStruc() {
		global $database;
		$str = file_get_contents("data/sql.sql");
		$str = preg_replace("'%PREFIX%'",TB_PREFIX,$str);
		if(CONNECT_TYPE){
			$result = $database->connection->multi_query($str);
		}
		else {
			$result = $database->mysql_exec_batch($str);
		}
		if($result) {
			header("Location: index.php?s=3");
		}
		else {
			header("Location: index.php?s=2&c=1");
		}
	}
	
	function createWdata() {
		header("Location: include/wdata.php");
	}
	
	function createAcc() {
		global $database;
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."users (username,password,access,email,timestamp,tribe) VALUES ('".$_POST['user']."', '".md5($_POST['pass'])."', ".ADMIN.", '".$_POST['email']."', $time, 1)";
		if($database->query($q)) {
			if(CONNECT_TYPE) {
				$uid = $database->connection->insert_id;
			}
			else {
				$uid = mysql_insert_id($database->connection);
			}
		// Buscamos en wdata la posicción X0 Y0 para asignarselo al admin
		$wq2 = "UPDATE ".TB_PREFIX."wdata set occupied = 1 where id = 8";
		$database->query($wq2);
		$vname = $_POST['user']."\'s village";
		$q2 = "INSERT into ".TB_PREFIX."vdata values (8, $uid, '$vname', 1, 1, 2, 750, 750, 750, 800, 750, 800, $time,100)";
		$database->query($q2);
		$q4 = "UPDATE ".TB_PREFIX."wdata set fieldtype = 3 where id = 8";
		$database->query($q4);
		$q3 = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values(8,1,4,1,3,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
		$database->query($q3);
		$q5 = "INSERT into ".TB_PREFIX."tdata (vref) values (8)";
		$database->query($q5);
		$q6 = "INSERT into ".TB_PREFIX."abdata (vref) values (8)";
		$database->query($q6);		
		$q7 = "INSERT into ".TB_PREFIX."units (vref) values (8)";
		$database->query($q7);
		header("Location: index.php?s=5");
		}
		else {
			header("Location: index.php?s=4&c=1&d=$uid");
		}
	}
};

$process = new Process;
?>