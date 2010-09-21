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
		<table cellpadding="1" cellspacing="1" id="reinforcement">

<thead><tr>
<td class="role">sender</td><td colspan="10"><?php echo ($dataarray[1] == 0)? "taskmaster" : $database->getUserField($dataarray[1],"username",0); ?> from the village <?php echo ($dataarray[0] == 0)? "village of the elders" : $database->getVillageField($dataarray[0],"name"); ?></td></tr></thead>
<tbody class="units"><tr>
<td>&nbsp;</td>
<?php
$start = $dataarray[2] == 1? 1 : (($dataarray[2] == 2)? 11 : (($dataarray[2] == 3)? 21 : 31));
for($i=$start;$i<=($start+9);$i++) {
	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Troops</th>";
$unitarray = $database->getEnforceArray($dataarray[3]);
for($i=$start;$i<=($start+9);$i++) {
	if($unitarray['u'.$i] == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else {
    echo "<td>".$unitarray['u'.$i]."</td>";
    }
}
?></tr></tbody>
<tbody class="infos"><tr><th>upkeep</th><td colspan="10">
<?php echo $technology->getUpkeep($unitarray,$dataarray[2]); ?><img src="img/x.gif" class="r4" title="Crop" alt="Crop" />per hour</td>
</tr></tbody>
</table></td></tr></tbody></table>
