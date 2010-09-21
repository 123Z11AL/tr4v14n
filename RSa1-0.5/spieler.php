<?php
include("engine/village.php");
$start = $generator->pageLoadTimeStart();
$profile->procProfile($_POST);
$profile->procSpecial($_GET);
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
?>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
        <div id="content"  class="player">
<?php
if(isset($_GET['uid'])) {
	if($_GET['uid'] != 0) {
	include("Templates/profile/overview.tpl");
	}
	else {
		include("Templates/profile/special.tpl");
	}
}
else if (isset($_GET['s'])) {
	if($_GET['s'] == 1) {
		include("Templates/profile/profile.tpl");
	}
	if($_GET['s'] == 2) {
		include("Templates/profile/preference.tpl");
	}
	if($_GET['s'] == 3) {
		include("Templates/profile/account.tpl");
	}
	if($_GET['s'] == 4) {
		include("Templates/profile/graphic.tpl");
	}
} else {
include("Templates/profile/graphic.tpl");
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