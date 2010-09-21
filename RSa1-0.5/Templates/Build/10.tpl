<div id="build" class="gid10"><a href="#" onClick="return Popup(10,4);" class="build_logo">
	<img class="building g10" src="img/x.gif" alt="<?php echo $lang['building'][10][0]; ?>" title="<?php echo $lang['building'][10][0]; ?>" />
</a>
<h1><?php echo $lang['building'][10][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][10][1]; ?></p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Current capacity:</th>
		<td><b><?php echo $bid10[$village->resarray['f'.$id]]['attri']; ?></b> units</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Capacity at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid10[$village->resarray['f'.$id]+1]['attri']; ?></b> units</td>
        <?php
            }
            ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>