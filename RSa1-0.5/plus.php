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
<?php
$id = $_GET['id'];
if ($id == "") {
include("Templates/Plus/1.tpl");
}
if ($id == 2) {
include("Templates/Plus/2.tpl");
}
if ($id == 3) {
include("Templates/Plus/3.tpl");
}
if ($id == 4) {
include("Templates/Plus/4.tpl");
}
if ($id == 5) {
include("Templates/Plus/5.tpl");
}
if ($id == 7) {
include("Templates/Plus/7.tpl");
}
if ($id == 8) {
include("Templates/Plus/8.tpl");
}
if ($id == 9) {
include("Templates/Plus/9.tpl");
}
if ($id == 10) {
include("Templates/Plus/10.tpl");
}
if ($id == 11) {
include("Templates/Plus/11.tpl");
}
if ($id == 12) {
include("Templates/Plus/12.tpl");
}
if ($id == 13) {
include("Templates/Plus/13.tpl");
}
if ($id == 14) {
include("Templates/Plus/14.tpl");
}
?>
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
</div> 
</body> 
</html> 