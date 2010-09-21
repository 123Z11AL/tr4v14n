<div id="build" class="gid12"><a href="#" onClick="return Popup(12,4);" class="build_logo">

	<img class="building g12" src="img/x.gif" alt="<?php echo $lang['building'][12][0]; ?>" title="<?php echo $lang['building'][12][0]; ?>" />
</a>
<h1><?php echo $lang['building'][12][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][12][1]; ?></p>

<table cellpadding="1" cellspacing="1" class="build_details">
	<thead>
		<tr>
			<td><?php echo $lang['building'][12][0]; ?></td>
			<td>Action</td>
		</tr>
	</thead>
	<tbody>

		<tr>
			<td class="desc">

				<div class="tit">
					<img class="unit u21" src="img/x.gif" alt="Phalanx" title="Phalanx" />
					<a href="#" onClick="return Popup(21,1);">Phalanx</a> <span class="info">(Level					0)</span>
				</div>
				<div class="details">
					<img class="r1" src="img/x.gif" alt="Lumber" title="Lumber" />800|<img class="r2" src="img/x.gif" alt="Clay" title="Clay" />1010|<img class="r3" src="img/x.gif" alt="Iron" title="Iron" />585|<img class="r4" src="img/x.gif" alt="Crop" title="Crop" /><span class="little_res">370</span>|<img class="clock" src="img/x.gif" alt="duration" title="duration" />1:22:00<?php if($session->userinfo['gold'] >= 3  && $building->getTypeLevel(17) > 1) { echo "|<a href=\"build.php?gid=17&t=3&bid=21&r1=800&r2=1010&r3=585&r4=370\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";	} ?>			</div>

				<span class="none">Enough resources today at 08:19 am</span>			</td>
			<td class="act"><span class="none">too few<br>resources</span></td>
		</tr>
		</tbody>
</table>

<?php 
include("upgrade.tpl");
?>
        </p>
         </div>
