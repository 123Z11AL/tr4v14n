<?php 
include("engine/village.php");
$PageStart = $generator->pageLoadTimeStart();
$ranking->procRankReq($_GET);
$ranking->procRank($_POST);
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
?>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
		<div id="content"  class="statistics">
<h1>Statistics</h1>
<div id="textmenu">
   <a href="statistiken.php" <?php if(!isset($_GET['id']) || (isset($_GET['id']) && ($_GET['id'] == 1 || $_GET['id'] == 31 || $_GET['id'] == 32 || $_GET['id'] == 7))) { echo "class=\"selected \""; } ?>>Player</a>
 | <a href="statistiken.php?id=4" <?php if(isset($_GET['id']) && ($_GET['id'] == 4 || $_GET['id'] == 41 || $_GET['id'] == 42 || $_GET['id'] == 47)) { echo "class=\"selected \""; } ?>>Alliances</a>
 | <a href="statistiken.php?id=2" <?php if(isset($_GET['id']) && $_GET['id'] == 2) { echo "class=\"selected \""; } ?>>Villages</a>
 | <a href="statistiken.php?id=8" <?php if(isset($_GET['id']) && $_GET['id'] == 8) { echo "class=\"selected \""; } ?>>Heroes</a>
 | <a href="statistiken.php?id=0" <?php if(isset($_GET['id']) && $_GET['id'] == 0) { echo "class=\"selected \""; } ?>>General</a>
</div>
<?php
if(isset($_GET['id'])) {
	switch($_GET['id']) {
		case 0:
		include("Templates/Ranking/general.tpl");		
		break;
		case 31:
		include("Templates/Ranking/player_attack.tpl");
		break;
		case 32:
		include("Templates/Ranking/player_defend.tpl");
		break;
		case 2:
		include("Templates/Ranking/villages.tpl");
		break;
		case 4:
		include("Templates/Ranking/alliance.tpl");
		break;
		case 41:
		include("Templates/Ranking/alliance_attack.tpl");
		break;
		case 42:
		include("Templates/Ranking/alliance_defend.tpl");
		break;
		case 1:
		default:
		include("Templates/Ranking/overview.tpl");
		break;
	}
}
else {
	include("Templates/Ranking/overview.tpl");
}
?>
 </div>
						</td>
					</tr>
				</table>
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
echo round(($generator->pageLoadTimeEnd()-$PageStart)*1000);
?></b> ms
 
<br />Server time: <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>

<div id="ce"></div>
</body>
</html>