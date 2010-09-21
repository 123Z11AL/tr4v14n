<?php

include("engine/village.php");
$start = $generator->pageLoadTimeStart();
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
else {
	$building->procBuild($_GET);
}

?>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<div id="content"  class="village1">
<h1><?php echo htmlspecialchars($village->vname); ?><br /></h1>
<?php include("Templates/field.tpl");
$timer = 1;
?>
<div id="map_details">


<?php	
if (count($village->movements[to]) > 0 || count($village->movements[from]) > 0 ){
	include ("Templates/incoming.tpl");
}
include("Templates/production.tpl");
include("Templates/troops.tpl"); ?>
<?php 
if($building->NewBuilding) {
	include("Templates/Building.tpl");
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