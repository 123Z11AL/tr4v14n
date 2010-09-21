<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       alliance.php                                                #
##	Version        0.2                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################

class Alliance {
	
	public $gotInvite = false;
	public $inviteArray = array();
	public $allianceArray = array();
	public $userPermArray = array();	
	
	public function procAlliance($get) {
		global $session,$database, $bbcode;
			
		if($session->alliance != 0) {
			$this->allianceArray = $database->getAlliance($session->alliance);
			// Permissions Array
			$this->userPermArray = $database->getAlliPermissions($session->uid, $session->alliance);
		}
		else {
			$this->inviteArray = $database->getInvitation($session->uid);
			$this->gotInvite = count($this->inviteArray) == 0? false : true;
		}
		if(isset($get['a'])) {
			switch($get['a']) {
				case 2:
				$this->rejectInvite($get);
				break;
				case 3:
				$this->acceptInvite($get);
				break;				
				default:
				break;
			}
		}
		if(isset($get['o'])) {
			switch($get['o']) {
				case 4:
				$this->delInvite($get);
				break;				
				default:
				break;
			}
		}		
	}
	
	public function procAlliForm($post) {
		if(isset($post['ft'])) {
			switch($post['ft']) {
				case "ali1":
				$this->createAlliance($post);
				break;
			}
		
		}
		if(isset($post['s'])==5) {
			if(isset($post['a'])) {			
				switch($post['a']) {
					case 1:
					if (isset($_POST['a_user'])){
					$this->changeUserPermissions($post);
					}
					break;
					case 2:
					if (isset($_POST['a_user'])){
					$this->kickAlliUser($post);
					}
					break;
					case 4:
					$this->sendInvite($post);
					break;					
					case 3:
					$this->updateAlliProfile($post);
					break;					
					case 11:
					$this->quitally($post);
					break;						
					case 100:
					$this->changeAliName($post);
					break;
				}
			}
		}	
	}
	
	/*****************************************
	Function to process of sending invitations
	*****************************************/	
	public function sendInvite($post) {
	global $form,$database,$session;
		// ¿El campo posee informacion?
		if(!isset($post['a_name']) || $post['a_name'] == "") {
			$form->addError("name1",NAME_EMPTY);
		}
		// ¿Existe el usuario?
		if(!$database->checkExist($post['a_name'],0)) {
			$form->addError("name2",NAME_NO_EXIST);			
		}
		// ¿La invitacion es a si mismo?
		if($post['a_name']==($session->username)) {
			$form->addError("name3",SAME_NAME);		
		}		
		// ¿Esta ya invitado a la alianza?
		$UserData = $database->getUserArray($post['a_name'],0);
		if($database->getInvitation($UserData['id'])) {
			$form->addError("name4",OLRADY_INVITED);		
		}
		// ¿Esta ya en la alianza?
		$UserData = $database->getUserArray($post['a_name'],0);
		if($UserData['alliance']==$session->alliance) {
			$form->addError("name5",OLRADY_IN_ALLY);		
		}				
		// ¿La invitación la envia un autorizado?
		if($this->userPermArray['opt4']==0){
			$form->addError("perm",NO_PERMISSION);		
		}
		if($form->returnErrors() != 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;
			header("Location: allianz.php");			
		}
		else {
		// Obtenemos la informacion necesaria
		$aid = $session->alliance;	
		// Insertamos invitacion
		$database->sendInvitation($UserData['id'], $aid, $session->uid);
		// Log the notice	
		$database->insertAlliNotice($session->alliance,'<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> has invited  <a href="spieler.php?uid='.$UserData['id'].'">'.$UserData['username'].'</a> into the alliance.');
		header("Location: allianz.php");
		}			
	}	
	
	/*****************************************
	Function to reject an invitation
	*****************************************/	
	private function rejectInvite($get) {
		global $database,$session;
		foreach($this->inviteArray as $invite) {
			if($invite['id'] == $get['d']) {
				$database->removeInvitation($get['d']);
			}
		}
		header("Location: allianz.php");
	}
	
	/*****************************************
	Function to del an invitation
	*****************************************/	
	private function delInvite($get) {
		global $database,$session;
		$inviteArray=$database->getAliInvitations($session->alliance);
		foreach($inviteArray as $invite) {
			if($invite['id'] == $get['d']) {
				$database->removeInvitation($get['d']);
			}
		}
		header("Location: allianz.php");
	}	
	
	/*****************************************
	Function to accept an invitation
	*****************************************/	
	private function acceptInvite($get) {
		global $database, $session;
		foreach($this->inviteArray as $invite) {
			if($invite['id'] == $get['d']) {
				$database->removeInvitation($get['d']);
				$database->updateUserField($invite['uid'],"alliance",$invite['alliance'],1);
				$database->createAlliPermissions($invite['uid'],$invite['alliance'],'','0','0','0','0','0','0','0','0');
				// Log the notice
				$database->insertAlliNotice($invite['alliance'],'<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> has joined the alliance.');			
			}
		}
		header("Location: build.php?id=".$get['id']);
	}
	
	/*****************************************
	Function to create an alliance
	*****************************************/	
	private function createAlliance($post) {
		global $form,$database,$session,$bid18,$village;
		if(!isset($post['ally1']) || $post['ally1'] == "") {
			$form->addError("ally1",ATAG_EMPTY);
		}
		if(!isset($post['ally2']) || $post['ally2'] == "") {
			$form->addError("ally2",ANAME_EMPTY);
		}
		if($database->aExist($post['ally1'],"tag")) {
			$form->addError("ally1",ATAG_EXIST);
		}
		if($database->aExist($post['ally2'],"name")) {
			$form->addError("ally2",ANAME_EXIST);
		}
		if($form->returnErrors() != 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;
			
			header("Location: build.php?id=".$post['id']);
		}
		else {
			$max = $bid18[$village->resarray['f'.$post['id']]]['attri'];
			$aid = $database->createAlliance($post['ally1'],$post['ally2'],$session->uid,$max);
			$database->updateUserField($session->uid,"alliance",$aid,1);
			// Asign Permissions
			$database->createAlliPermissions($session->uid,$aid,'Leader','1','1','1','1','1','1','1','1');	
			// log the notice
			$database->insertAlliNotice($aid,'The alliance has been founded by <a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a>');				
			header("Location: build.php?id=".$post['id']);
		}
	}
	
	/*****************************************
	Function to change the alliance name
	*****************************************/	
	private function changeAliName($get) {
		global $form,$database,$session ;
		if(!$database->isAllianceOwner($session->uid)) {
			$form->addError("owner",NO_OWNER);		
		}
		if(!isset($get['ally1']) || $get['ally1'] == "") {
			$form->addError("ally1",ATAG_EMPTY);
		}
		if(!isset($get['ally2']) || $get['ally2'] == "") {
			$form->addError("ally2",ANAME_EMPTY);
		}
		if($database->aExist($get['ally1'],"tag")) {
			$form->addError("tag",ATAG_EXIST);
		}
		if($database->aExist($get['ally2'],"name")) {
			$form->addError("name",ANAME_EXIST);
		}
		if($this->userPermArray['opt3']==0){
			$form->addError("perm",NO_PERMISSION);		
		}
		if($form->returnErrors() != 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			header("Location: allianz.php");
		}
		else {
		$database->setAlliName($session->alliance,$get['ally2'],$get['ally1']);
		// log the notice
		$database->insertAlliNotice($session->alliance,'<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> has changed the name of the alliance');
		header("Location: allianz.php");
		}				
	}

	/*****************************************
	Function to create/change the alliance description
	*****************************************/	
	private function updateAlliProfile($post) {
		global $database, $session, $form;
		if($this->userPermArray['opt3']==0){
			$form->addError("perm",NO_PERMISSION);		
		}
		if($form->returnErrors() != 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			header("Location: allianz.php");
		}
		else {		
		$database->submitAlliProfile($session->alliance,$post['be2'],$post['be1']);
		// log the notice
		$database->insertAlliNotice($session->alliance,'<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> as changed the alliance description');
		header("Location: allianz.php");
		}
	}
	
	/*****************************************
	Function to change the user permissions
	*****************************************/	
	private function changeUserPermissions($post) {
		global $database, $session, $form;
		if($this->userPermArray['opt1']==0){
			$form->addError("perm",NO_PERMISSION);		
		}
		if($form->returnErrors() != 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			header("Location: allianz.php");
		}else{					
			$database->updateAlliPermissions($post['a_user'],$session->alliance,$post['a_titel'],$post['e1'],$post['e2'],$post['e3'],$post['e4'],$post['e5'],$post['e6'],$post['e7']);	
			// log the notice
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> has changed permissions '.$post['a_user']);
			header("Location: allianz.php");
		}

	}	
	/*****************************************
	Function to kick a user from alliance
	*****************************************/	
	private function kickAlliUser($post) {
		global $database, $session, $form;
		
		if($this->userPermArray['opt2']==0){
			$form->addError("perm",NO_PERMISSION);		
		}
		if($form->returnErrors() != 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			header("Location: allianz.php");
		}
		else {
		$database->updateUserField($post['a_user'],'alliance',0,1);
		$database->deleteAlliPermissions($post['a_user']);
		// log the notice
		$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> kick <a href="spieler.php?uid='.$post['a_user'].'">'.$UserData['username'].'</a>.');		
		header("Location: allianz.php");				
		}	
	}
	
	/*****************************************
	Function to quit from alliance
	*****************************************/	
	private function quitally($post) {
		global $database, $session, $form;
		if(!isset($post['pw']) || $post['pw'] == "") {
			$form->addError("error",PW_EMPTY); 
		}elseif (md5($post['pw']) !== $session->userinfo['password']){	
			$form->addError("error",PW_ERR);		
		}else{
			// Procedemos al abandono de la alianza 		
			$database->updateUserField($session->uid,'alliance',0,1);
			$database->deleteAlliPermissions($session->uid);			
			// log the notice
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> has quit the alliance');			
			// Contamos todos los usuarios de la alianza
			// Dado el caso de ser el unico integrante de la alianza, purgamos			
			if($database->countTribeUser($session->alliance)==0){
				$database->cleanAlliance($session->alliance);			
			}			
			header("Location: dorf2.php");	
		}		
	}
}

$alliance = new Alliance;
?>