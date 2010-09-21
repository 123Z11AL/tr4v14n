<table id="production" cellpadding="1" cellspacing="1">
	<thead><tr>
			<th colspan="4"><?php echo PROD_HEADER; ?>:</th>
	</tr></thead><tbody>	
	<tr>
		<td class="ico"><img class="r1" src="img/x.gif" alt="<?php echo $lang['product'][1]; ?>" title="<?php echo $lang['product'][1]; ?>" /></td>
		<td class="res"><?php echo $lang['product'][1]; ?>:</td>
		<td class="num"><?php echo $village->getProd("wood"); ?></td>
		<td class="per"><?php echo PER_HR; ?></td>
	</tr>
		
	<tr>
		<td class="ico"><img class="r2" src="img/x.gif" alt="<?php echo $lang['product'][2]; ?>" title="<?php echo $lang['product'][2]; ?>" /></td>
		<td class="res"><?php echo $lang['product'][2]; ?>:</td>
		<td class="num"><?php echo $village->getProd("clay"); ?></td>
		<td class="per"><?php echo PER_HR; ?></td>
	</tr>
		
	<tr>
		<td class="ico"><img class="r3" src="img/x.gif" alt="<?php echo $lang['product'][3]; ?>" title="<?php echo $lang['product'][3]; ?>" /></td>
		<td class="res"><?php echo $lang['product'][3]; ?>:</td>
		<td class="num"><?php echo $village->getProd("iron"); ?></td>
		<td class="per"><?php echo PER_HR; ?></td>
	</tr>
		
	<tr>
		<td class="ico"><img class="r4" src="img/x.gif" alt="<?php echo $lang['product'][4]; ?>" title="<?php echo $lang['product'][4]; ?>" /></td>
		<td class="res"><?php echo $lang['product'][4]; ?>:</td>
		<td class="num"><?php echo $village->getProd("crop"); ?></td>
		<td class="per"><?php echo PER_HR; ?></td>
	</tr>
		</tbody>	
</table>