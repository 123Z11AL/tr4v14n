<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       build.php                                                   #
##	Version        0.1                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  Original by:   Akakori													   #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################

include("engine/village.php");
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
$PageStart = $generator->pageLoadTimeStart();
$alliance->procAlliForm($_POST);
$technology->procTech($_POST);
$market->procMarket($_POST);
$building->procBuild($_POST);

if(isset($_GET['gid'])) {
	$_GET['id'] = $building->getTypeField($_GET['gid']);
}
if(isset($_GET['id'])) {
	if($village->resarray['f'.$_GET['id'].'t'] == 17) {
		$market->procRemove($_GET);
	}
	if($village->resarray['f'.$_GET['id'].'t'] == 18) {
		$alliance->procAlliance($_GET);
	}
	if($village->resarray['f'.$_GET['id'].'t'] == 22) {
		$technology->procTechno($_GET);
	}
}
?>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<div id="content"  class="build">
<?php
if(isset($_GET['id'])) {
	$id = $_GET['id'];
	if($village->resarray['f'.$_GET['id'].'t'] == 0 && $_GET['id'] >= 19) {
		include("Templates/Build/avaliable.tpl");
	}
	else {
		if(isset($_GET['t'])) {
			if($_GET['t'] == 1) {
			$_SESSION['loadMarket'] = 1;
			}
			include("Templates/Build/".$village->resarray['f'.$_GET['id'].'t']."_".$_GET['t'].".tpl");
		}
		else {
			include("Templates/Build/".$village->resarray['f'.$_GET['id'].'t'].".tpl");
		}
	}
}
?>

</div>

<div id="side_info">
			<div id="anm" style="width:120px; height:140px; visibility:hidden;"></div>
			<div id="qge">
				<!--<img onclick="qst_handle();" src="img/x.gif" id="qgei" class="q_l1" title="to the task" alt="to the task" />-->
			</div>
			<!--<script type="text/javascript">
				quest.number = -1;
				quest.last = 24;
				cache_preload = new Image();
				cache_preload.src = "img/x.gif";
				cache_preload.className = "farm";
			</script>-->
<?php
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
echo round(($generator->pageLoadTimeEnd()-$PageStart)*1000);
?></b> ms
 
<br />Server time: <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>

<div id="ce"></div>
</body>
</html>
</html>