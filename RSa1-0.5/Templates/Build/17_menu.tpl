<div id="textmenu"> 
   <a href="build.php?id=<?php echo $id; if(!isset($_GET['t'])) { echo "class=\"selected\""; } ?>">Send Resouces</a> 
 | <a href="build.php?id=<?php echo $id; ?>&amp;t=1" <?php if(isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"selected\""; } ?>>Buy</a> 
 | <a href="build.php?id=<?php echo $id; ?>&amp;t=2" <?php if(isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"selected\""; } ?>>Offer</a> 
 <?php if($session->userinfo['gold'] > 3) {
 ?>
 | <a href="build.php?id=<?php echo $id; ?>&amp;t=3" <?php if(isset($_GET['t']) && $_GET['t'] == 3) { echo "class=\"selected\""; } ?>>NPC trading</a> 
 <?php
 }
 ?>
</div> 