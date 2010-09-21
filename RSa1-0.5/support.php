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


				<div id="content"  class="support"><br>
<h1>Support</h1><table cellpadding="1" cellspacing="1">
		<thead><tr>
			<th>Support</th>

		</tr></thead>
		<tbody>	<tr>
			<td><b>Ingame-Support:</b><br>The Support Team consists of experienced players glad to help you and answer any of your questions about the game play. Just send a message to "Support" to contact them.<br /><a href="nachrichten.php?t=1&id=0">&raquo; Write message</a></td>
		</tr><tr>
			<td><b>Game rules:</b><br>
If you read the <a href="/spielregeln.php" target="_blank">game rules</a> and still have questions, just contact <a href="spieler.php?uid=1">Multihunter</a>.<br /><a href="nachrichten.php?t=1&id=1">&raquo; Write message</a></td>

		</tr><tr>
			<input type="hidden" name="spiel_welt"/>
			<input type="hidden" name="spieler_name"/>
			<input type="hidden" name="spieler_email" value="" />
			<input type="hidden" name="spieler_volk" value="1" />
			<input type="hidden" name="ckey"/>
			<input type="hidden" name="spieler_uid"/>
			<td><b>General Support via E-Mail:</b><br>

If you encountered more severe problems or bugs you can contact the admin at scr1pt@2kdesign.es. You will receive an answer by e-mail.
			<br />
			</td></tr>
			</form>
			</tbody></table>				</div>

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