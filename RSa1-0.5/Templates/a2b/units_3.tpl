<h1><?php echo SEND_TROOPS; ?></h1>

<form method="POST" name="snd" action="a2b.php"><input name="timestamp" value="1278280730" type="hidden"> <input name="timestamp_checksum" value="597fa8" type="hidden"> <input name="b" value="1" type="hidden">


		<table id="troops" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="line-first column-first large"><img class="unit u21" src="img/x.gif" title="Legionnaire" onclick="document.snd.t1.value=''; return false;" alt="Legionnaire"> <input class="text <?php if ($village->unitarray['u21']<=0) {echo "disabled";}?>" name="t1" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u21']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u21']."; return false;\">(".$village->unitarray['u21'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		
        <td class="line-first large"><img class="unit u4" src="img/x.gif" title="Equites Legati" alt="Equites Legati"> <input class="text <?php if ($village->unitarray['u24']<=0) {echo "disabled";}?>" name="t4" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u24']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u24']."; return false;\">(".$village->unitarray['u24'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
        <td class="line-first regular"><img class="unit u27" src="img/x.gif" title="Battering Ram" alt="Battering Ram"> <input class="text <?php if ($village->unitarray['u27']<=0) {echo "disabled";}?>" name="t7" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u27']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u27']."; return false;\">(".$village->unitarray['u27'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>

		
        <td class="line-first column-last small"><img class="unit u29" src="img/x.gif" title="Senator" alt="Senator"> <input class="text <?php if ($village->unitarray['u29']<=0) {echo "disabled";}?>" name="t9" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u29']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u29']."; return false;\">(".$village->unitarray['u29'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="column-first large"><img class="unit u22" src="img/x.gif" title="Praetorian" alt="Praetorian"> <input class="text <?php if ($village->unitarray['u22']<=0) {echo "disabled";}?> " name="t2" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u22']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u22']."; return false;\">(".$village->unitarray['u22'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>

		<td class="large"><img class="unit u25" src="img/x.gif" title="Equites Imperatoris" alt="Equites Imperatoris"> <input class="text <?php if ($village->unitarray['u25']<=0) {echo "disabled";}?>" name="t5" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u25']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u25']."; return false;\">(".$village->unitarray['u25'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="regular"><img class="unit u28" src="img/x.gif" title="Fire Catapult" alt="Fire Catapult"> <input class="text <?php if ($village->unitarray['u28']<=0) {echo "disabled";}?>" name="t8" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u28']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u28']."; return false;\">(".$village->unitarray['u28'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="column-last small"><img class="unit u30" src="img/x.gif" title="Settler" alt="Settler"> <input class="text <?php if ($village->unitarray['u30']<=0) {echo "disabled";}?>" name="t10" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u30']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u30']."; return false;\">(".$village->unitarray['u30'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="line-last column-first large"><img class="unit u23" src="img/x.gif" title="Imperian" alt="Imperian"> <input class="text <?php if ($village->unitarray['u23']<=0) {echo "disabled";}?>" name="t3" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u23']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u23']."; return false;\">(".$village->unitarray['u23'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="line-last large"><img class="unit u26" src="img/x.gif" title="Equites Caesaris" alt="Equites Caesaris"> <input class="text <?php if ($village->unitarray['u26']<=0) {echo "disabled";}?>" name="t6" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u26']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u26']."; return false;\">(".$village->unitarray['u26'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="line-last regular"></td>
			<td class="line-last column-last"></td>		</tr>
</tbody></table>

