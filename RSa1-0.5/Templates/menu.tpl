<?php
if(!$session->logged_in) {
?>
	<div id="side_navi">
				<a id="logo" href=""><img src="img/x.gif" alt="Travian" /></a>
		<p>
			<a href="index.php"><?php echo HOME; ?></a>
			<a href="anleitung.php"><?php echo INSTRUCT; ?></a>
			<a href="login.php"><?php echo LOGIN; ?></a>
			<a href="anmelden.php"><?php echo REG; ?></a>
		</p>
		<p>
							<a href="http://forum.2kdesign.es/" target="_blank"><?php echo FORUM; ?></a>
						<a href="" target="_blank"><?php echo CHAT; ?></a>
		</p>
		<p>
			<a href="impressum.php"><?php echo IMPRINT; ?></a>
			<a href="support.php">Support</a>
		</p>
	</div>
<?php
}
else {
?>
    <div id="side_navi">
		<a id="logo" href=""><img src="img/x.gif" <?php if($session->plus) { echo "class=\"logo_plus\""; } ?> alt="Travian" /></a>
				<p>
			<a href="index.php"><?php echo HOME; ?></a>
			<a href="#" onclick="return Popup(0,0);"><?php echo INSTRUCT; ?></a>
			<a href="spieler.php?uid=<?php echo $session->uid ?>"><?php echo PROFILE; ?></a>
            <?php if($session->access >= MODERATOR) {
            echo "<a href=\"cpanel/moderator/\">Multi Hunter</a>";
            }
           	if($session->access == ADMIN) {
            echo "<a href=\"cpanel/admin/\">Admin Panel</a>";
            }
            ?>
			<a href="logout.php"><?php echo LOGOUT; ?></a>
		</p>
		<p>
							<a href="http://forum.2kdesign.es/" target="_blank"><?php echo FORUM; ?></a>
										<a href="" target="_blank"><?php echo CHAT; ?></a>
					</p>
		<p>
			<a href="plus.php?id=3 ">Travian <b><span class="plus_g">P</span><span class="plus_o">l</span><span class="plus_g">u</span><span class="plus_o">s</span></b></a>
			<a href="support.php"><?php echo SUPPORT; ?></a>
		</p>
					</div>
<?php
}
?>