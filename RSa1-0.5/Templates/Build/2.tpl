<div id="build" class="gid2"><a href="#" onClick="return Popup(2,4);" class="build_logo">
<img class="building g2" src="img/x.gif" alt="<?php echo $lang['building'][2][0]; ?>" title="<?php echo $lang['building'][2][0]; ?>" />
</a>
<h1><?php echo $lang['building'][2][0]; ?> <span class="level"><?php echo LEVEL." "; echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][2][1]; ?></p>

<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th><?php echo CUR_PROD; ?>:</th>
		<td><b><?php echo $bid2[$village->resarray['f'.$id]]['prod']* SPEED; ?></b> <?php echo PER_HR; ?></td>
	</tr>
	 <?php 
    if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
    ?>
	<tr>
		<th><?php echo CUR_PROD; echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid2[$village->resarray['f'.$id]+1]['prod']* SPEED; ?></b> <?php echo PER_HR; ?></td>
	</tr>
    <?php 
    }
    ?>
</table>

<?php 
include("upgrade.tpl");
?></p></div>

