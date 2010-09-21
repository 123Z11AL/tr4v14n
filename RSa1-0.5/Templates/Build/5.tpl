<div id="build" class="gid5"><a href="#" onClick="return Popup(5,4);" class="build_logo">
	<img class="building g5" src="img/x.gif" alt="<?php echo $lang['building'][5][0]; ?>" title="<?php echo $lang['building'][5][0]; ?>" />
</a>
<h1><?php echo $lang['building'][5][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][5][1]; ?></p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current wood bonus:</th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]]['attri']; ?></b> Percent</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Wood bonus at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]+1]['attri']; ?></b> Percent</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>