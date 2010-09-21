<div id="build" class="gid15"><a href="#" onClick="return Popup(15,4);" class="build_logo">
	<img class="building g15" src="img/x.gif" alt="<?php echo $lang['building'][15][0]; ?>" title="<?php echo $lang['building'][15][0]; ?>" />
</a>
<h1><?php echo $lang['building'][15][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][15][1]; ?></p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current construction time:</th>
			<td><b><?php echo $bid15[$village->resarray['f'.$id]]['attri']; ?></b> Percent</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Construction time at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid15[$village->resarray['f'.$id]+1]['attri']; ?></b> Percent</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
if ($village->resarray['f'.$id]>=DEMOLISH_LEVEL_REQ){	
	include("15_1.tpl");
}

include("upgrade.tpl");
?>
</p></div>