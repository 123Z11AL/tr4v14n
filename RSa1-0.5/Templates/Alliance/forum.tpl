<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>".htmlspecialchars($allianceinfo['tag'])." - ".htmlspecialchars($allianceinfo['name'])."</h1>";
include("alli_menu.tpl"); 
?>
<p class="error">No forum has been created yet.</p><p> 
			<a href="allianz.php?s=2&admin&newforum"><img id="fbtn_newforum" class="dynamic_img" src="img/x.gif" alt="Create new forum" /></a></p></div> 
<div id="side_info"> 
 
</div> 
<div class="clear"></div> 
</div> 
 
 
<div class="footer-stopper"></div> 
<div class="clear"></div> 