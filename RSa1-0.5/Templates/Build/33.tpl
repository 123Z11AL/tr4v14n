<div id="build" class="gid33">
<h1><?php echo $lang['building'][33][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][33][1]; ?></p>

<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Defence Bonus now:</th>
			<td><b><?php echo $bid33[$village->resarray['f'.$id]]['attri']; ?></b> Percent</td>
		</tr><tr>
        <?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Defence Bonus at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>

			<td><b><?php echo $bid33[$village->resarray['f'.$id]+1]['attri']; ?></b> Percent</td>
            <?php
            }
            ?>
		</tr></table>
<?php 
include("upgrade.tpl");
?>
        </p>
         </div>