<?php
$wood = $village->getProd("wood");
$clay = $village->getProd("clay");
$iron = $village->getProd("iron");
$crop = $village->getProd("crop");
//$crop = ($session->prod['crop']-$session->baseinfo['pop']);
?>
<div id="res">
<div id="resWrap">

	<table cellpadding="1" cellspacing="1">
		<tr>
							<td><img src="img/x.gif" class="r1" alt="<?php echo $lang['product'][1]; ?>" title="<?php echo $lang['product'][1]; ?>" /></td>
				<td id="l4" title="<?php echo $wood ?>"><?php echo round($village->awood)."/".$village->maxstore; ?></td>
							<td><img src="img/x.gif" class="r2" alt="<?php echo $lang['product'][2]; ?>" title="<?php echo $lang['product'][2]; ?>" /></td>
				<td id="l3" title="<?php echo $clay ?>"><?php echo round($village->aclay)."/".$village->maxstore; ?></td>
							<td><img src="img/x.gif" class="r3" alt="<?php echo $lang['product'][3]; ?>" title="<?php echo $lang['product'][3]; ?>" /></td>
				<td id="l2" title="<?php echo $iron ?>"><?php echo round($village->airon)."/".$village->maxstore; ?></td>
							<td><img src="img/x.gif" class="r4" alt="<?php echo $lang['product'][4]; ?>" title="<?php echo $lang['product'][4]; ?>" /></td>
				<td id="l1" title="<?php echo $crop ?>"><?php echo round($village->acrop)."/".$village->maxcrop; ?></td>
							<td><img src="img/x.gif" class="r5" alt="<?php echo $lang['product'][5]; ?>" title="<?php echo $lang['product'][5]; ?>" /></td>
			<td><?php echo $village->pop."/".($village->getProd("crop")+$village->pop); ?></td>
		</tr>
	</table>
    </div>

</div>