<div id="build" class="gid34"><a href="#" onClick="return Popup(34,4);" class="build_logo">
	<img class="building g34" src="img/x.gif" alt="<?php echo $lang['building'][34][0]; ?>" title="<?php echo $lang['building'][34][0]; ?>" />
</a>
<h1><?php echo $lang['building'][34][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][34][1]; ?></p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current stability bonus:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]]['attri']; ?></b> Percent</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Stability bonus at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]+1]['attri']; ?></b> Percent</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>