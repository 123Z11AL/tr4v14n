<div id="build" class="gid22"><a href="#" onClick="return Popup(22,4);" class="build_logo">

	<img class="building g22" src="img/x.gif" alt="<?php echo $lang['building'][22][0]; ?>" title="<?php echo $lang['building'][22][0]; ?>" />
</a>
<h1><?php echo $lang['building'][22][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][22][1]; ?></p>
<?php
include("22_".$session->tribe.".tpl"); 
include("upgrade.tpl");
?>
        </p>
         </div>
