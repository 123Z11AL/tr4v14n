<div id="build" class="gid28"><a href="#" onClick="return Popup(28,4);" class="build_logo">
	<img class="building g28" src="img/x.gif" alt="<?php echo $lang['building'][28][0]; ?>" title="<?php echo $lang['building'][28][0]; ?>" />
</a>
<h1><?php echo $lang['building'][28][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][28][1]; ?></p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Current merchant load:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]]['attri']; ?></b> Percent</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Merchant load at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]+1]['attri']; ?></b> Percent</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>
