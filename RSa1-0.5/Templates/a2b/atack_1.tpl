<?php
if ($process['c']==2){
$actionType = RAINFORCEMENT;
}elseif ($process['c']==3){
$actionType = ATTACK_NORMAL;
}else{
$actionType = ATTACK_RAID;
}
?>
<h1><?php echo $actionType." ".TO." ".$process[villageName]; ?></h1>		
<form method="post" action="a2b.php">
			<table id="short_info" cellpadding="1" cellspacing="1">
				<tbody>
					<tr>
						<th><?php echo DESTINATION; ?>:</th>
						<td><a href="karte.php?d=&amp;c="><?php echo $process[villageName]; ?> (<?php echo $coor[x]; ?>|<?php echo $coor[y]; ?>)</a></td>
					</tr>
					<tr>
						<th><?php echo OWNER; ?>:</th>
						<td><a href="spieler.php?uid=<?php echo $process[villageOwner]; ?>"><?php echo $database->getUserField($process[villageOwner],'username',0); ?></a></td>
					</tr>
				</tbody>
			</table>

			<table class="troop_details" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<td><?php echo $process[villageName]; ?></td>
						<td colspan="10"><?php echo $actionType." ".TO." ".$process[villageName]; ?></td>
					</tr>
				</thead>
				<tbody class="units">
					<tr>
						<td></td>
						<td><img src="img/x.gif" class="unit u1" title="Legionario" alt="Legionario"></td>
                        <td><img src="img/x.gif" class="unit u2" title="Pretoriano" alt="Pretoriano"></td>
                        <td><img src="img/x.gif" class="unit u3" title="Imperano" alt="Imperano"></td>
                        <td><img src="img/x.gif" class="unit u4" title="Equites Legati" alt="Equites Legati"></td>
                        <td><img src="img/x.gif" class="unit u5" title="Equites Imperatoris" alt="Equites Imperatoris"></td>
                        <td><img src="img/x.gif" class="unit u6" title="Equites Caesaris" alt="Equites Caesaris"></td>
                        <td><img src="img/x.gif" class="unit u7" title="Carnero" alt="Carnero"></td>
                        <td><img src="img/x.gif" class="unit u8" title="Catapulta de fuego" alt="Catapulta de fuego"></td>
                        <td><img src="img/x.gif" class="unit u9" title="Senador" alt="Senador"></td>
                        <td><img src="img/x.gif" class="unit u10" title="Colono" alt="Colono"></td>
					</tr>
					<tr>
						<th><?php echo TROOPS; ?></th>
						<td <?php if ($process[t1] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t1];} ?></td>
                        <td <?php if ($process[t2] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t2];} ?></td>
                        <td <?php if ($process[t3] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t3];} ?></td>
                        <td <?php if ($process[t4] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t4];} ?></td>
                        <td <?php if ($process[t5] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t5];} ?></td>
                        <td <?php if ($process[t6] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t6];} ?></td>
                        <td <?php if ($process[t7] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t7];} ?></td>
                        <td <?php if ($process[t8] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t8];} ?></td>
                        <td <?php if ($process[t9] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t9];} ?></td>
                        <td <?php if ($process[t10] == ""){ echo "class=\"none\">0"; }else{ echo ">".$process[t10];} ?></td>
                     </tr>
				</tbody>
				<tbody class="infos">
		<tr>
			<th><?php echo ARRIVED; ?></th>
			<td colspan="10">
			<div class="in"><?php echo IN; ?> <?php echo $generator->getTimeFormat($process[speed]); ?></div>
			<div class="at"><?php echo AT; ?> <span id="tp2"> <?php echo date("H:i:s",time()+$process[speed])?></span><span> <?php echo HOURS; ?></span></div>
			</td>
		</tr>
	</tbody>
</table>

<input name="timestamp" value="1278280271" type="hidden"> 
<input name="timestamp_checksum" value="facaa5" type="hidden"> 
<input name="id" value="<?php echo $process[id]; ?>" type="hidden"> 
<input name="a" value="533374" type="hidden">
<input name="c" value="<?php echo $process['c']; ?>" type="hidden"> 
<input name="kid" value="411175" type="hidden"> 
<input name="t1" value="<?php echo $process[t1]; ?>" type="hidden"> 
<input name="t2" value="<?php echo $process[t2]; ?>" type="hidden"> 
<input name="t3" value="<?php echo $process[t3]; ?>" type="hidden"> 
<input name="t4" value="<?php echo $process[t4]; ?>" type="hidden"> 
<input name="t5" value="<?php echo $process[t5]; ?>" type="hidden"> 
<input name="t6" value="<?php echo $process[t6]; ?>" type="hidden"> 
<input name="t7" value="<?php echo $process[t7]; ?>" type="hidden"> 
<input name="t8" value="<?php echo $process[t8]; ?>" type="hidden"> 
<input name="t9" value="<?php echo $process[t9]; ?>" type="hidden"> 
<input name="t10" value="<?php echo $process[t10]; ?>" type="hidden"> 
<input name="t11" value="0" type="hidden">

		<p class="btn"><input value="ok" name="s1" id="btn_ok" class="dynamic_img " src="img/x.gif" alt="OK" type="image"></p>
</form>
</div>