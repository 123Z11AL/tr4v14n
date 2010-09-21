<h1>S<?php echo SEND_TROOPS; ?></h1>

<form method="POST" name="snd" action="a2b.php"><input name="timestamp" value="1278280730" type="hidden"> <input name="timestamp_checksum" value="597fa8" type="hidden"> <input name="b" value="1" type="hidden">


		<table id="troops" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="line-first column-first large"><img class="unit u11" src="img/x.gif" title="Legionnaire" onclick="document.snd.t1.value=''; return false;" alt="Legionnaire"> <input class="text <?php if ($village->unitarray['u11']<=0) {echo "disabled";}?>" name="t1" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u11']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u11']."; return false;\">(".$village->unitarray['u11'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		
        <td class="line-first large"><img class="unit u14" src="img/x.gif" title="Equites Legati" alt="Equites Legati"> <input class="text <?php if ($village->unitarray['u14']<=0) {echo "disabled";}?>" name="t4" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u14']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u14']."; return false;\">(".$village->unitarray['u14'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
        <td class="line-first regular"><img class="unit u17" src="img/x.gif" title="Battering Ram" alt="Battering Ram"> <input class="text <?php if ($village->unitarray['u17']<=0) {echo "disabled";}?>" name="t7" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u17']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u17']."; return false;\">(".$village->unitarray['u17'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>

		
        <td class="line-first column-last small"><img class="unit u19" src="img/x.gif" title="Senator" alt="Senator"> <input class="text <?php if ($village->unitarray['u19']<=0) {echo "disabled";}?>" name="t9" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u19']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u19']."; return false;\">(".$village->unitarray['u19'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="column-first large"><img class="unit u12" src="img/x.gif" title="Praetorian" alt="Praetorian"> <input class="text <?php if ($village->unitarray['u12']<=0) {echo "disabled";}?> " name="t2" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u12']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u12']."; return false;\">(".$village->unitarray['u12'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>

		<td class="large"><img class="unit u15" src="img/x.gif" title="Equites Imperatoris" alt="Equites Imperatoris"> <input class="text <?php if ($village->unitarray['u15']<=0) {echo "disabled";}?>" name="t5" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u15']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u15']."; return false;\">(".$village->unitarray['u15'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="regular"><img class="unit u18" src="img/x.gif" title="Fire Catapult" alt="Fire Catapult"> <input class="text <?php if ($village->unitarray['u18']<=0) {echo "disabled";}?>" name="t8" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u18']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u18']."; return false;\">(".$village->unitarray['u18'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="column-last small"><img class="unit u20" src="img/x.gif" title="Settler" alt="Settler"> <input class="text <?php if ($village->unitarray['u20']<=0) {echo "disabled";}?>" name="t10" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u20']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u20']."; return false;\">(".$village->unitarray['u20'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
	</tr>
	<tr>
		<td class="line-last column-first large"><img class="unit u13" src="img/x.gif" title="Imperian" alt="Imperian"> <input class="text <?php if ($village->unitarray['u13']<=0) {echo "disabled";}?>" name="t3" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u13']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u13']."; return false;\">(".$village->unitarray['u13'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="line-last large"><img class="unit u16" src="img/x.gif" title="Equites Caesaris" alt="Equites Caesaris"> <input class="text <?php if ($village->unitarray['u16']<=0) {echo "disabled";}?>" name="t6" value="" maxlength="6" type="text">
		<?php 
        if ($village->unitarray['u16']>0){
        	echo "<a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u16']."; return false;\">(".$village->unitarray['u16'].")</a></td>";
        }else{ 
       		echo  "<span class=\"none\">(0)</span></td>";
		}
        ?>
		<td class="line-last regular"></td>
			<td class="line-last column-last"></td>		</tr>
</tbody></table>

