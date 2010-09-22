<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       allianz.php                                                 #
##	Version        0.2                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################

include("engine/Village.php");
include("engine/Forum.php");
include("engine/chat.php");
$start = $generator->pageLoadTimeStart();
$alliance->procAlliance($_GET);
$alliance->procAlliForm($_POST);

?>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<?php
if($_GET['s']== 2){
echo '<div id="content"  class="forum">';
}else{
echo '<div id="content"  class="alliance">';
}
?>
<?php 
if(isset($_GET['s'])) {
	switch($_GET['s']) {
		case 2:
		include("Templates/Alliance/forum.tpl");
		break;
		case 3:
		include("Templates/Alliance/attacks.tpl");
		break;
		case 4:
		include("Templates/Alliance/news.tpl");
		break;
		case 5:		
		include("Templates/Alliance/option.tpl");
		break;
		case 6:
		include("Templates/Alliance/chat.tpl");
		break;
		case 1:
		default:
		include("Templates/Alliance/overview.tpl");
		break;
	}
// Options
} elseif (isset($_POST['o'])) {
		switch($_POST['o']) {
			case 1:
			if (isset($_POST['a_user'])){
				include("Templates/Alliance/changepos.tpl");
				}else{
				include("Templates/Alliance/assignpos.tpl");
			}
			break;
			case 2:
			include("Templates/Alliance/kick.tpl");			
			break;
			case 3:
			include("Templates/Alliance/allidesc.tpl");		
			break;
			case 4:
			include("Templates/Alliance/invite.tpl");		
			break;
			case 5:
			include("Templates/Alliance/linkforum.tpl");
			break;
			case 6:
			include("Templates/Alliance/chgdiplo.tpl");
			break;
			case 11:
			include("Templates/Alliance/quitalli.tpl");
			break;
			default:
			include("Templates/Alliance/option.tpl");
			break;
			case 100:
			include("Templates/Alliance/changename.tpl");
			break;
		}
}else{
	include("Templates/Alliance/overview.tpl");
}
	
?>
</div>
<div id="side_info">
<?php
include("Templates/quest.tpl");
include("Templates/multivillage.tpl");
include("Templates/links.tpl");
?>
</div>
<div class="clear"></div>
</div>
<div class="footer-stopper"></div>
<div class="clear"></div>

<?php 
include("Templates/footer.tpl"); 
include("Templates/res.tpl"); 
?>
<div id="stime">
<div id="ltime">
<div id="ltimeWrap">
Calculated in <b><?php
echo round(($generator->pageLoadTimeEnd()-$start)*1000);
?></b> ms
 
<br />Server time: <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>

<div id="ce"></div>
</body>
</html>