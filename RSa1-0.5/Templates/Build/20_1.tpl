<?php 
$success = 0;
for($i=4;$i<=6;$i++) {
	if($technology->getTech($i)) {
    echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u$i\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
		<a href=\"#\" onClick=\"return Popup($i,1);\">".$technology->getUnitName($i)."</a> <span class=\"info\">(Avaliable: ".$village->unitarray['u'.$i].")</span></div>";
        echo "<div class=\"details\">
							<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" />".${'u'.$i}['wood']."|<img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".${'u'.$i}['clay']."|<img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".${'u'.$i}['iron']."|<img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".${'u'.$i}['crop']."|<img class=\"r5\" src=\"img/x.gif\" alt=\"Crop consumption\" title=\"Crop consumption\" />".${'u'.$i}['pop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
        echo $generator->getTimeFormat(round(${'u'.$i}['time'] * $bid20[$village->resarray['f'.$id]]['attri'] / 100 / SPEED));
        echo "</div></td>
					<td class=\"val\">
						<input type=\"text\" class=\"text\" name=\"t$i\" value=\"0\" maxlength=\"$i\">
					</td>

					<td class=\"max\">
						<a href=\"#\" onClick=\"document.snd.t$i.value=".$technology->maxUnit($i)."; return false;\">(".$technology->maxUnit($i).")</a>
					</td>
				</tr>";
          $success += 1;
    }
}
if($success == 0) {
	echo "<tr><td colspan=\"3\"><div class=\"none\" align=\"center\">No units avaliable. Research at academy</div></td></tr>";
}
?>