<?php
$fromUsername = $database->getUserField($message->readingNotice['from_user'],'username',0);
$toUsername = $database->getUserField($message->readingNotice['from_user'],'username',0);
$villageFromName = $database->getVillageField($message->readingNotice['from_village'],'name') ;
$villageToName = $database->getVillageField($message->readingNotice['to_village'],'name') ;
$res=explode("-", $message->readingNotice['steal']);
$date = $generator->procMtime($message->readingNotice['time']);
?>
<table cellpadding="1" cellspacing="1" id="report_surround">
			<thead>
				<tr>
					<th>Subject:</th>
					<th><?php echo $villageFromName; ?> entrega a <?php echo $villageToName; ?></th>
				</tr>

				<tr>
					<td class="sent">Sent:</td>
					<td><?php echo $date[0]." ".$date[1]  ?><span></span></td>
			  </tr>
			</thead>
			<tbody>
				<tr><td colspan="2" class="empty"></td></tr>
				<tr><td colspan="2" class="report_content">
		<table cellpadding="1" cellspacing="1" id="trade"><thead><tr>
<td>&nbsp;</td>
<td><a href="spieler.php?uid=<?php echo $message->readingNotice['from_user']; ?>"><?php echo $fromUsername ?></a> desde <a href="karte.php?d=<?php echo $message->readingNotice['from_village']; ?>"><?php echo $villageFromName ?></a></td>
</tr></thead><tbody><tr>
<th>Resources</th>
<td><img class="r1" src="img/x.gif" alt="Hout" title="Hout" /><?php echo $res[0]; ?> | <img class="r2" src="img/x.gif" alt="Klei" title="Klei" /><?php echo $res[1]; ?> | <img class="r3" src="img/x.gif" alt="IJzer" title="IJzer" /><?php echo $res[2]; ?> | <img class="r4" src="img/x.gif" alt="Graan" title="Graan" /><?php echo $res[3]; ?></td></tr></tbody>

</table></td></tr></tbody></table>
