<?php

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|              .: PLEASE DONT'T REMOVE OR CHANGE THIS NOTICE :.               	|
| ---------------------------------------------------------------------------   |
|  Filename       quest_core.tpl	                                       	    |
|  Version        0.1                                                           |
|  Developed by:  DesPlus <desplus@gmail.com>                                   |
|  Copyright:     Kravian (c) 2009-2010. All rights reserved.                   |
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

include("engine/village.php");

$uArray = $database->getUserArray($_SESSION['username'],0);

if (isset($qact)){
 switch($qact) {
	case 'enter':
	$database->updateUserField($_SESSION['username'],'quest','1',0);
	$_SESSION['qst']= 1;
	break;
	
	case 'skip':
	$database->updateUserField($_SESSION['username'],'quest','23',0);
	$_SESSION['qst']= 23;
	
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=25;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	$skiped=true;
	break;

	case '2':
	$database->updateUserField($_SESSION['username'],'quest','2',0);		
	$_SESSION['qst']= 2;	
	break;

	case '3':
	$database->updateUserField($_SESSION['username'],'quest','3',0);
	$_SESSION['qst']= 3;
	
	//Give Reward
	$database->modifyResource($session->villages[0],50,60,30,10,1);	
	break;

	case '4':
	$database->updateUserField($_SESSION['username'],'quest','4',0);
	$_SESSION['qst']= 4;
	
	//Give Reward
	$database->modifyResource($session->villages[0],30,60,30,20,1);		
	break;
	
	case 'rank':
	$rSubmited=$qact2;
	break;
	
	case '5':
	$database->updateUserField($_SESSION['username'],'quest','5',0);
	$_SESSION['qst']= 5;
		
	//Give Reward
	$database->modifyResource($session->villages[0],40,30,20,30,1);	
	break;

	case '6':
	$database->updateUserField($_SESSION['username'],'quest','6',0);
	$_SESSION['qst']= 6;
	$Subject="Message From The Taskmaster";
	$Message="You are to be informed that a nice reward is waiting for you at the taskmaster.<br /><br />Hint: The message has been generated automatically. An answer is not necessary.";
	$database->sendMessage($session->userinfo['id'],0,$Subject,$Message,0);
	$RB=true;
		
	//Give Reward
	$database->modifyResource($session->villages[0],50,60,30,30,1);	
	break;
	
	case '7':
	$database->updateUserField($_SESSION['username'],'quest','7',0);
	$_SESSION['qst']= 7;
		
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=20;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
	
	case '8':
	$crop = round($village->acrop);
	if ($crop>=200){
	$database->updateUserField($_SESSION['username'],'quest','8',0);
	$_SESSION['qst']= 8;	
	
	//Get 200 Crop	
	$database->modifyResource($session->villages[0],0,0,0,-200,1);		
	//Give Reward
	$database->modifyUnit($session->villages[0],31,1,1);
	} else{
	$NoCrop="No Enough Crop!";
	}
	break;
	
	case '9':
	$database->updateUserField($_SESSION['username'],'quest','9',0);
	$_SESSION['qst']= 9;
	
	//Give Reward
	$database->modifyResource($session->villages[0],75,80,30,50,1);	
	break;
	
	case '10':
	$database->updateUserField($_SESSION['username'],'quest','10',0);
	$_SESSION['qst']= 10;
		
	//Give Reward
	$database->modifyResource($session->villages[0],120,200,140,100,1);	
	break;
	
	case '11':
	$database->updateUserField($_SESSION['username'],'quest','11',0);
	$_SESSION['qst']= 11;
			
	//Give Reward
	$database->modifyResource($session->villages[0],150,180,30,130,1);
	break;
	
	case '12':
	$database->updateUserField($_SESSION['username'],'quest','12',0);
	$_SESSION['qst']= 12;
			
	//Give Reward
	$database->modifyResource($session->villages[0],60,50,40,30,1);
	break;
	
	case 'lumber':
	$lSubmited=$qact2;
	break;
	
	case '13':
	$database->updateUserField($_SESSION['username'],'quest','13',0);
	$_SESSION['qst']= 13;
			
	//Give Reward
	$database->modifyResource($session->villages[0],50,30,60,20,1);
	break;
	
	case '14':
	$database->updateUserField($_SESSION['username'],'quest','14',0);
	$_SESSION['qst']= 14;
			
	//Give Reward
	$database->modifyResource($session->villages[0],75,75,40,40,1);
	break;
	
	case '15':
	$database->updateUserField($_SESSION['username'],'quest','15',0);
	$_SESSION['qst']= 15;
			
	//Give Reward
	$database->modifyResource($session->villages[0],100,90,100,60,1);
	break;
	
	case '16':
	$database->updateUserField($_SESSION['username'],'quest','16',0);
	$_SESSION['qst']= 16;			
	break;
	
	case '17':
	$database->updateUserField($_SESSION['username'],'quest','17',0);
	$_SESSION['qst']= 17;
	
	//Give Reward
	$database->modifyResource($session->villages[0],80,90,60,40,1);
	break;
	
	case '18':
	$database->updateUserField($_SESSION['username'],'quest','18',0);
	$_SESSION['qst']= 18;
	
	//Give Reward
	$database->modifyResource($session->villages[0],70,100,90,100,1);
	break;

	case '19':
	$database->updateUserField($_SESSION['username'],'quest','19',0);
	$_SESSION['qst']= 19;			
	break;
	
	case '20':
	$database->updateUserField($_SESSION['username'],'quest','20',0);
	$_SESSION['qst']= 20;
	
	//Give Reward
	$database->modifyResource($session->villages[0],80,90,60,40,1);
	break;
	
	case '21':
	$database->updateUserField($_SESSION['username'],'quest','21',0);
	$_SESSION['qst']= 21;
	break;
	
	case '22':
	$database->updateUserField($_SESSION['username'],'quest','22',0);
	$_SESSION['qst']= 22;
	
	//Give Reward
	$database->modifyResource($session->villages[0],300,320,360,570,1);
	break;
	
	case '23':
	$database->updateUserField($_SESSION['username'],'quest','23',0);
	$_SESSION['qst']= 23;
	
	//Give Reward
	$gold=$database->getUserField($_SESSION['username'],'gold','username');
	$gold+=15;
	$database->updateUserField($_SESSION['username'],'gold',$gold,0);
	break;
}

}

header("Content-Type: application/json;");

      if($_SESSION['qst']== 0){
	  ?>

{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Welcome to <?php echo SERVER_NAME; ?>!<\/h1><br \/><i>&bdquo;As I see you have been made chieftain of this little village. I will be your counselor for the first few days and never leave your (right hand) side.&rdquo;<\/i><br \/><br \/><span id=\"qst_accpt\"><a class=\"qle\" href=\"javascript: qst_next('','enter'); \">To the first task.<\/a><a class=\"qri\" href=\"javascript: qst_fhandle();\">Look\u00a0around\u00a0on\u00a0your\u00a0own.<\/a><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><br \/><br \/><br \/><a class=\"qri\" href=\"javascript: qst_next('','skip');\">Play no tasks.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"intro\"><\/div>\n\t\t","number":null,"reward":false,"qgsrc":"q_l<?php echo $session->userinfo['tribe'];?>g","msrc":"i4","altstep":0}

<?php } elseif($_SESSION['qst']== 1){

//Check one of Woodcutters is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$woodL=$tRes['f1']+$tRes['f3']+$tRes['f14']+$tRes['f17'];
if ($woodL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 1: Woodcutter<\/h1><br \/><i>&bdquo;There are four green forests around your village. Construct a woodcutter on one of them. Lumber is an important resource for our new settlement.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a woodcutter.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 1: Woodcutter<\/h1><br \/><i>&bdquo;Yes, that way you gain more lumber.I helped a bit and completed the order instantly.&rdquo;<\/i><br \/><br \/><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/><div class=\"rew\"><p class=\"ta_aw\">Your reward:<\/p>Woodcutter instantly completed.<br \/><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','2');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"wood\"><\/div>\n\t\t","number":"-1","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 2){ 

//Check one of Croplands is level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$cropL=$tRes['f2']+$tRes['f8']+$tRes['f9']+$tRes['f12']+$tRes['f13']+$tRes['f15'];
if ($cropL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 2: Crop<\/h1><br \/><i>&bdquo;Now your subjects are hungry from working all day. Extend a cropland to improve your subjects' supply. Come back here once the building is complete.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend one cropland.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":"-2","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 2: Crop<\/h1><br \/><i>&bdquo;Very good. Now your subjects have enough to eat again...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>50&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>10&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','3');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"farm\"><\/div>\n\t\t","number":2,"reward":{"plus":1},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 3){ 

//Check the village name is changed or is default name

$vName=$village->vname;
if ($vName==$session->userinfo['username']."'s village"){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/>Task 3: Your Village's Name<\/h1><br \/><i>&bdquo;Creative as you are you can grant your village the ultimate name.\r\n<br \/><br \/>\r\nClick on 'profile' in the left hand menu and then select 'change profile'...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Change your village's name to something nice.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":"-3","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/>Task 3: Your Village's Name<\/h1><br \/><i>&bdquo;Wow, a great name for their village. It could have been the name of my village!...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>20&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','4');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"village_name\"><\/div>\n\t\t","number":3,"reward":{"wood":30,"clay":60,"iron":30,"crop":20},"qgsrc":"q_l2g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 4){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
$ranking->procRankReq($temp);
$displayarray = $database->getUserArray($temp['uid'],1);
$rRes=$ranking->searchRank($displayarray['username'],"username");
if ($rRes!=$rSubmited){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 4: Other Players<\/h1><br \/><i>&bdquo;In <?php echo SERVER_NAME; ?> you play along with billions of other players. Click 'statistics' in the top menu to look up your rank and enter it here.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Look for your rank in the statistics and enter it here.<\/div><br \/><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" \/> <input onclick=\"qst_next('','rank',document.getElementById('qst_val').value)\" type=\"button\" value=\"complete task\"\/><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank\"><\/div>\n\t\t","number":-4,"reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 4: Other Players<\/h1><br \/><i>„Exactly! That's your rank.”<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>40&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>20&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>30&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','5');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t","number":4,"reward":{"wood":40,"clay":30,"iron":20,"crop":30},"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 5){ 

//Check one of Iron Mines and one of Clay Pites are level 1 or upper 
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=$tRes['f4']+$tRes['f7']+$tRes['f10']+$tRes['f11'];
$clayL=$tRes['f5']+$tRes['f6']+$tRes['f16']+$tRes['f18'];
if ($ironL<1 || $clayL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 5: Two Building Orders<\/h1><br \/><i>&bdquo;Build an iron mine and a clay pit. Of iron and clay one can never have enough.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p><ul><li>Extend one iron mine.<\/li><li>Extend one clay pit.<\/li><\/ul><\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":-5,"reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 5: Two Building Orders<\/h1><br \/><i>&bdquo;As you noticed, building orders take rather long. The world of <?php echo SERVER_NAME; ?> will continue to spin even if you are offline. Even in a few months there will be many new things for you to discover.\r\n<br \/><br \/>\r\nThe best thing to do is occasionally checking your village and giving you subjects new tasks to do.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>50&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>30&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','6');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"clay_iron\"><\/div>\n\t\t","number":5,"reward":{"wood":50,"clay":60,"iron":30,"crop":30},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 6){ 

//Check message is viewed or no
if ($message->unread || $RB==true){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 6: Messages<\/h1><br \/><i>&bdquo;You can talk to other players using the messaging system. I sent a message to you. Read it and come back here.\r\n<br \/><br \/>\r\nP.S. Don't forget: on the left the reports, on the right the messages.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Read your new message.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":"-6","reward":false,"qgsrc":"q_l3","msrc":"i2","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 6: Messages<\/h1><br \/><i>&bdquo;You received it? Very good.\r\n<br \/><br \/>\r\nHere is some Gold. With Gold you can do several things, e.g. extend your <b><font color=\"#71D000\">P<\/font><font color=\"#FF6F0F\">l<\/font><font color=\"#71D000\">u<\/font><font color=\"#FF6F0F\">s<\/font><\/b>-Account or increase your resource production.To do so click <a href=\"plus.php?id=3\"><font color=\"#000000\"><?php echo SERVER_NAME; ?><\/font> <b><font color=\"#71D000\">P<\/font><font color=\"#FF6F0F\">l<\/font><font color=\"#71D000\">u<\/font><font color=\"#FF6F0F\">s<\/font><\/b><\/a> in the left hand menu.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p>20 Gold<br \/><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','7');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"msg\"><\/div>\n\t\t","number":6,"reward":{"gold":20},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 7){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 7: Huge Army!<\/h1><br \/><i>&bdquo;Now I've got a very special quest for you. I am hungry. Give me 200 crop!\r\n<br \/><br \/>\r\nIn return I will try to organize a huge army to protect your village.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Send 200 crop to the taskmaster.<\/div><br \/><img class=\"r4\" src=\"img\/x.gif\" title=\"Crop\" alt=\"Crop\" \/>200 <input type=\"hidden\" id=\"qst_val\" value=\"set\" \/><input onclick=\"javascript: qst_next('','8');\" name=\"qstin\" type=\"button\" value=\"Send crop.\" \/><br \/><font color='#FF0000'><?php if(isset($NoCrop)){echo $NoCrop;}?><font\/><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"army\"><\/div>\n\t\t","number":-8,"reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}

<?php } elseif($_SESSION['qst']== 8){

//Check additional of each resource upgraded to lvl1 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>0){$ironL++;};if($tRes['f7']>0){$ironL++;};if($tRes['f10']>0){$ironL++;};if($tRes['f11']>0){$ironL++;}
if($tRes['f5']>0){$clayL++;};if($tRes['f6']>0){$clayL++;};if($tRes['f16']>0){$clayL++;};if($tRes['f18']>0){$clayL++;}
if($tRes['f1']>0){$woodL++;};if($tRes['f3']>0){$woodL++;};if($tRes['f14']>0){$woodL++;};if($tRes['f17']>0){$woodL++;}
if($tRes['f2']>0){$cropL++;};if($tRes['f8']>0){$cropL++;};if($tRes['f9']>0){$cropL++;};if($tRes['f12']>0){$cropL++;};if($tRes['f13']>0){$cropL++;};if($tRes['f15']>0){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/><?php echo $questc->q;?> Task 8: Everything to 1.<\/h1><br \/><i>&bdquo;Now we should increase your resource production a bit. Extend all your resource tiles to level 1.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend all resource tiles to level 1.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":-12,"reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 8: Everything to 1.<\/h1><br \/><i>&bdquo;Very good, your resource production just thrives.\r\n<br \/><br \/>\r\nSoon we can start with constructing buildings in the village.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>75&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>80&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>50&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','9');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":12,"reward":{"wood":75,"clay":80,"iron":30,"crop":50},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 9){ 

//Check player Descriptions for [#0]
$Dave= strrpos ($uArray['desc1'],'[#0]');
$Dave2=strrpos ($uArray['desc2'],'[#0]');
if (!is_numeric($Dave) and !is_numeric($Dave2)){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 9: Dove of Peace<\/h1><br \/><i>&bdquo;The first days after signing up you are protected against attacks by your fellow players. You can see how long this protection lasts by adding the code <b>[#0]<\/b> to your profile.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Write the code <b>[#0]<\/b> into your profile by adding it to one of the two description fields.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":"-13","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 9: Dove of Peace<\/h1><br \/><i>&bdquo;Well done! Now everyone can see what a great warrior the world is approached by.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>120&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>200&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>140&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>100&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','10');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"medal\"><\/div>\n\t\t","number":13,"reward":{"wood":120,"clay":200,"iron":140,"crop":100},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 10){

//Check cranny builded or no
$cranny = $building->getTypeLevel(23);
if ($cranny == 0){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 10: Cranny<\/h1><br \/><i>&bdquo;It's getting time to erect a cranny. The world of <?php echo SERVER_NAME; ?> is dangerous.\r\n<br \/><br \/>\r\nMany players live by stealing other players' resources. Build a cranny to hide some of your resources from enemies.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a Cranny.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"hide\"><\/div>\n\t\t","number":-14,"reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 10: Cranny<\/h1><br \/><i>&bdquo;Well done, now it's way harder for your mean fellow players to plunder your village.\r\n<br \/><br \/>\r\nIf under attack, your villagers will hide the resources in the Cranny all on their own.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>150&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>180&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>130&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','11');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"hide\"><\/div>\n\t\t","number":14,"reward":{"wood":150,"clay":180,"iron":30,"crop":130},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 11){

//Check one of each resource is lvl2 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<1 || $clayL<1 || $woodL<1 || $cropL<1){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 11: To Two.<\/h1><br \/><i>&bdquo;In <?php echo SERVER_NAME; ?> there is always something to do! Extend one woodcutter, one clay pit, one iron mine and one cropland to level 2 each.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend one of each resource tile to level 2.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":"-15","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 11: To Two.<\/h1><br \/><i>&bdquo;Very good, your village grows and thrives!&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>50&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>40&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>30&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','12');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":15,"reward":{"wood":60,"clay":50,"iron":40,"crop":30},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 12){ 

//Check player submited number Barracks cost lumber
if ($lSubmited!=210){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 12: Instructions<\/h1><br \/><i>&bdquo;In the ingame instructions you can find short information texts about different buildings and types of units.\r\n<br \/><br \/>\r\nClick on 'instructions' at the left to find out how much lumber is required for the barracks.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Enter how much lumber barracks cost<\/div><br \/><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" \/> <input onclick=\"qst_next('','lumber',document.getElementById('qst_val').value)\" type=\"button\" value=\"complete task\"\/><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"cost\"><\/div>\n\t\t","number":"-16","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 12: Instructions<\/h1><br \/><i>„Exactly! Barracks cost 210 lumber.”<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>50&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>30&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>20&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','13');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t","number":16,"reward":{"wood":50,"clay":30,"iron":60,"crop":20},"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 13){

//Check main building lvl is 3 or upper
$mainbuilding = $building->getTypeLevel(15);
if ($mainbuilding<3){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 13: Main Building<\/h1><br \/><i>&bdquo;Your master builders need a main building level 3 to erect important buildings such as the marketplace or barracks.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend your main building to level 3.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":-17,"reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 13: Main Building<\/h1><br \/><i>&bdquo;Well done. The main building level 3 has been completed.\r\n<br><br>\r\nWith this upgrade your master builders cannot only construct more types of buildings but also do so faster.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>75&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>75&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>40&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>40&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','14');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"main\"><\/div>\n\t\t","number":17,"reward":{"wood":75,"clay":75,"iron":40,"crop":40},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 14){

// Compare real player rank with submited rank
$temp['uid']=$session->userinfo['id'];
$ranking->procRankReq($temp);
$displayarray = $database->getUserArray($temp['uid'],1);
$rRes=$ranking->searchRank($displayarray['username'],"username");
if ($rRes!=$rSubmited){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 14: Advanced!<\/h1><br \/><i>&bdquo;Look up your rank in the player statistics again and enjoy your progress.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Look for your rank in the statistics and enter it here.<\/div><br \/><input id=\"qst_val\" class=\"text\" type=\"text\" name=\"qstin\" \/> <input onclick=\"qst_next('','rank',document.getElementById('qst_val').value)\" type=\"button\" value=\"complete task\"\/><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"rank\"><\/div>\n\t\t","number":"-18","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 14: Advanced!<\/h1><br \/><i>„Well done! That's your current rank.”<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\">100&nbsp;&nbsp;<img src=\"img/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\">90&nbsp;&nbsp;<img src=\"img/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\">100&nbsp;&nbsp;<img src=\"img/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\">60&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','15');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":18,"reward":{"wood":100,"clay":90,"iron":100,"crop":60},"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }?>

<?php } elseif($_SESSION['qst']== 15){

// Ask from plyer ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 16: Weapons or Dough<\/h1><br \/><i>&bdquo;Now you have to make a decision: Either trade peacefully or become a dreaded warrior.\r\n<br \/><br \/>\r\nFor the marketplace you need a granary, for the barracks you need a rally point.&rdquo;<\/i><br \/><br \/><input type=\"hidden\" id=\"qst_val\" value=\"\" \/><input onclick=\"javascript: qst_next('','19');\" type=\"button\" value=\"Economy\" class=\"qb1\"\/><input onclick=\"javascript: qst_next('','16');\" type=\"button\" value=\"Military\" class=\"qb2\" \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_rally\"><\/div>\n\t\t","number":"-19","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}

<?php } elseif($_SESSION['qst']== 16){

// Checking rollypoint builded or no
$rallypoint = $building->getTypeLevel(16);
if ($rallypoint==0){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 16: Military<\/h1><br \/><i>&bdquo;A brave decision. To be able to send troops you need a rally point.\r\n<br \/><br \/>\r\nThe rally point must be built on a specific building site. The <a href=\"build.php?id=39\">building site<\/a> is located on the right side of the main building, slightly below it. The building site itself is curved.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a rally point.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_rally\"><\/div>\n\t\t","number":"-19","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 16: Military<\/h1><br \/><i>&bdquo;Your rally point has been erected! A good move towards world domination!&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>80&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>90&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>40&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','17');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_rally\"><\/div>\n\t\t","number":19,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']==17){

// Checking barrack builded or no
$barrack = $building->getTypeLevel(19);
if ($barrack==0){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 17: Barracks<\/h1><br \/><i>&bdquo;Now you have a main building level 3 and a rally point. That means that all prerequisites for building barracks have been fulfilled.\r\n<br><br>\r\nYou can use the barracks to train troops for fighting.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct barracks.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"barracks\"><\/div>\n\t\t","number":"-20","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 17: Barracks<\/h1><br \/><i>&bdquo;Well done... The best instructors from the whole country have gathered to train your men\u2019s fighting skills to top form.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>70&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>100&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>90&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>100&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','18');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"barracks\"><\/div>\n\t\t","number":20,"reward":{"wood":70,"clay":100,"iron":90,"crop":100},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 18){

// Checking 2 warrior trained or no
$units = $village->unitall;
$unarray=array("","Legionnaire", "Clubswinger","Phalanx");
$unarray2=array("","u1", "u11","u21");
if ($units[$unarray2[$session->userinfo['tribe']]]<2){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 18: Train.<\/h1><br \/><i>&bdquo;Now that you have barracks you can start training troops. Train two <?php echo $unarray[$session->userinfo['tribe']];?>.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Please train 2 <?php echo $unarray[$session->userinfo['tribe']];?>.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":"-21","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 18: Train.<\/h1><br \/><i>&bdquo;The foundation for your glorious army has been laid.<br \/><br \/>\r\nBefore sending your army off to plunder you should check with the <a href=\"warsim.php\">Combat-Simulator<\/a> to see how many troops you need to successfully fight one rat without losses.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>300&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>320&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>360&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>570&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','22');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"units\"><\/div>\n\t\t","number":21,"reward":{"wood":300,"clay":320,"iron":360,"crop":570},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 19){

// Checking granary builded or no
$granary = $building->getTypeLevel(11);
if ($granary ==0){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 16: Economy <\/h1><br \/><i>&bdquo;„Trade & Economy was your choice. Golden times await you for sure!”<br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct a Granary.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_rally\"><\/div>\n\t\t","number":"-19","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 16: Economy <\/h1><br \/><i>&bdquo;Well done! With the Granary you can store more wheat.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>80&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>90&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>60&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>40&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','20');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"granary_rally\"><\/div>\n\t\t","number":19,"reward":{"wood":80,"clay":90,"iron":60,"crop":40},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']==20){

// Checking warehouse builded or no
$warehouse = $building->getTypeLevel(10);
if ($warehouse==0){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 17: Warehouse<\/h1><br \/><i>&bdquo;Not only Crop has to be saved. Other resources can go to waste as well if they are not stored correctly. Construct a Warehouse!&rdquo;\r\n<br><br>\r\n<\/i><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Construct Warehouse.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":"-20","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 17: Warehouse<\/h1><br \/><i>&bdquo;Well done, your Warehouse is complete...&rdquo;<\/i><br \/>Now you have fulfilled all prerequisites required to construct a Marketplace.<br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>70&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>120&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>90&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>50&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','21');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"warehouse\"><\/div>\n\t\t","number":20,"reward":{"wood":70,"clay":120,"iron":90,"crop":50},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 21){

// Checking market builded or no
$market = $building->getTypeLevel(17);
if ($market==0){ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 18: Marketplace.<\/h1><br \/><i>&bdquo;Construct a Marketplace so you can trade with your fellow players.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Please build a Marketplace.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":"-21","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 18: Marketplace.<\/h1><br \/><i>&bdquo;The Marketplace has been completed. Now you can make offers of your own and accept foreign offers! When creating your own offers, you should think about offering what other players need most to get more profit.&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p><img src=\"img\/x.gif\" class=\"r1\" alt=\"Lumber\" title=\"Lumber\" \/>200&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r2\" alt=\"Clay\" title=\"Clay\" \/>200&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r3\" alt=\"Iron\" title=\"Iron\" \/>700&nbsp;&nbsp;<img src=\"img\/x.gif\" class=\"r4\" alt=\"Crop\" title=\"Crop\" \/>450&nbsp;&nbsp;<\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','22');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"market\"><\/div>\n\t\t","number":21,"reward":{"wood":300,"clay":320,"iron":360,"crop":570},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

<?php } elseif($_SESSION['qst']== 22){

// Checking all resource lvl are 2 or upper
$tRes = $database->getResourceLevel($session->villages[0]);
$ironL=0;$clayL=0;$woodL=0;$cropL=0;
if($tRes['f4']>1){$ironL++;};if($tRes['f7']>1){$ironL++;};if($tRes['f10']>1){$ironL++;};if($tRes['f11']>1){$ironL++;}
if($tRes['f5']>1){$clayL++;};if($tRes['f6']>1){$clayL++;};if($tRes['f16']>1){$clayL++;};if($tRes['f18']>1){$clayL++;}
if($tRes['f1']>1){$woodL++;};if($tRes['f3']>1){$woodL++;};if($tRes['f14']>1){$woodL++;};if($tRes['f17']>1){$woodL++;}
if($tRes['f2']>1){$cropL++;};if($tRes['f8']>1){$cropL++;};if($tRes['f9']>1){$cropL++;};if($tRes['f12']>1){$cropL++;};if($tRes['f13']>1){$cropL++;};if($tRes['f15']>1){$cropL++;}
if ($ironL<4 || $clayL<4 || $woodL<4 || $cropL<6){?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 19: Everything to 2.<\/h1><br \/><i>&bdquo;Now it's time again to extend the cornerstones of might and wealth! This time level 1 is not enough... it will take a while but in the end it will be worth it. Extend all your resource tiles to level 2!&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\">Order:<\/p>Extend all resource tiles to level 2.<\/div><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":"-22","reward":false,"qgsrc":"q_l3","msrc":"i4","altstep":0}
<?php }else{ ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Task 19: Everything to 2.<\/h1><br \/><i>&bdquo;Congratulations! Your village grows and thrives...&rdquo;<\/i><br \/><br \/><div class=\"rew\"><p class=\"ta_aw\"><input type=\"hidden\" id=\"qst_val\" value=\"2\" \/>Your reward:<\/p>15 Gold<br \/><\/div><br \/><span id=\"qst_accpt\"><a href=\"javascript: qst_next('','23');\">Continue with the next task.<\/a><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"allres\"><\/div>\n\t\t","number":22,"reward":{"gold":15},"qgsrc":"q_l3g","msrc":"i4","altstep":0}
<?php } ?>

// End tasks message
<?php } elseif($_SESSION['qst']== 23){
$database->updateUserField($_SESSION['username'],'quest','24',0);
$_SESSION['qst']= 24; ?>
{"markup":"\n\t\t<div id=\"qstd\"><h1> <img class=\"point\" src=\"img\/x.gif\" alt=\"\" title=\"\"\/> Tasks<\/h1><br \/><i>&bdquo;<?php if ($skiped==true){echo 'Tasks skpiped <br \/> Your reward: 25 Gold.' ;}else{echo 'All tasks achieved!';}?>&rdquo;<\/i><br \/><span id=\"qst_accpt\"><\/span><\/div>\n\t\t<div id=\"qstbg\" class=\"intro\"><\/div>\n\t\t","number":-25,"reward":false,"qgsrc":"q_l3","msrc":"i2","altstep":0}

<?php } else { ?>

<?php }?>
