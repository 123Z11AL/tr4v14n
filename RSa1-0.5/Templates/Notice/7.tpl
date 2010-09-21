<?php
$dataarray = explode(",",$message->readingNotice['data']);
?>
<table cellpadding="1" cellspacing="1" id="report_surround">
			<thead>
				<tr>
					<th>Subject:</th>
					<th><?php echo $message->readingNotice['topic']; ?></th>
				</tr>
 
				<tr>
					<?php
                $date = $generator->procMtime($message->readingNotice['time']); ?>
					<td class="sent">Sent:</td>
					<td>on <?php echo $date[0]."<span> at ".$date[1]; ?></span><span> </span></td>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="2" class="empty"></td></tr>
				<tr><td colspan="2" class="report_content">
		<table cellpadding="1" cellspacing="1" id="attacker"><thead>
<tr>
<td class="role">Attacker</td>
<td colspan="10"><a href="spieler.php?uid=<?php echo $dataarray[1]; ?>"><?php echo $database->getUserField($dataarray[1],"username",0); ?></a> from the village <a href="karte.php?d=<?php echo $dataarray[0]."&amp;c=".$generator->getMapCheck($dataarray[0]); ?>"><?php echo $database->getVillageField($dataarray[0],"name"); ?></a></td>
</tr>
</thead>
<tbody class="units">
<tr>
<td>&nbsp;</td>
<?php
$start = $dataarray[2] == 1? 1 : (($dataarray[2] == 2)? 11 : (($dataarray[2] == 3)? 21 : 31));
for($i=$start;$i<=($start+9);$i++) {
	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Troops</th>";
for($i=3;$i<=12;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else {
    	echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Casualties</th>";
for($i=3;$i<=12;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else if (round($dataarray[$i] / 100 * $dataarray[13]) == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else {
    	echo "<td>".round($dataarray[$i] / 100 * $dataarray[13])."</td>";
    }
}

echo "</tr></tbody><tbody class=\"goods\"><tr><th>Bounty</th><td colspan=\"10\">";
?>
	<div class="res"><img class="r1" src="img/x.gif" alt="Lumber" title="Lumber" /><?php echo $dataarray[14]; ?> | <img class="r2" src="img/x.gif" alt="Clay" title="Clay" /><?php echo $dataarray[15]; ?> | <img class="r3" src="img/x.gif" alt="Iron" title="Iron" /><?php echo $dataarray[16]; ?> | <img class="r4" src="img/x.gif" alt="Crop" title="Crop" /><?php echo $dataarray[17]; ?></div><div class="carry"><img class="car" src="img/x.gif" alt="carry" title="carry" /><?php echo ($dataarray[17]+$dataarray[14]+$dataarray[15]+$dataarray[16])."/".$dataarray[18]; ?></div>
    </td></tr></tbody></table><table cellpadding="1" cellspacing="1" class="defender">
	<thead>
	<tr>
	<td class="role">Defender</th>
	<td colspan="10"><a href="spieler.php?uid=<?php echo $session->uid; ?>"><?php echo $session->username; ?></a> from the village <a href="karte.php?d=401946&amp;c=ac">tes121</a></td>
	</tr></thead>
	<tbody class="units">
	<tr>
	<td>&nbsp;</td><td><img src="img/x.gif" class="unit u1" title="Legionnaire" alt="Legionnaire" /></td><td><img src="img/x.gif" class="unit u2" title="Praetorian" alt="Praetorian" /></td><td><img src="img/x.gif" class="unit u3" title="Imperian" alt="Imperian" /></td><td><img src="img/x.gif" class="unit u4" title="Equites Legati" alt="Equites Legati" /></td><td><img src="img/x.gif" class="unit u5" title="Equites Imperatoris" alt="Equites Imperatoris" /></td><td><img src="img/x.gif" class="unit u6" title="Equites Caesaris" alt="Equites Caesaris" /></td><td><img src="img/x.gif" class="unit u7" title="Battering Ram" alt="Battering Ram" /></td><td><img src="img/x.gif" class="unit u8" title="Fire Catapult" alt="Fire Catapult" /></td><td><img src="img/x.gif" class="unit u9" title="Senator" alt="Senator" /></td><td><img src="img/x.gif" class="unit u10" title="Settler" alt="Settler" /></td></tr><tr><th>Troops</th><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td></tr><tr><th>Casualties</th><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td><td class="none">0</td></tr></tbody></table></td></tr></tbody></table>