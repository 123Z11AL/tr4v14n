<div id="build" class="gid14"><a href="#" onClick="return Popup(14,4);" class="build_logo">
	<img class="building g14" src="img/x.gif" alt="<?php echo $lang['building'][14][0]; ?>" title="<?php echo $lang['building'][14][0]; ?>" />
</a>
<h1><?php echo $lang['building'][14][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][14][1]; ?></p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current speed bonus:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]]['attri']; ?></b> Percent</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Speed bonus at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]+1]['attri']; ?></b> Percent</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>