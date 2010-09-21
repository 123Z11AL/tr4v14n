<?php
echo "<tr><td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u30\" src=\"img/x.gif\" alt=\"Settler\" title=\"Settler\" />
						<a href=\"#\" onClick=\"return Popup(30,1);\"> Settler</a> <span class=\"info\">(Available: ".$village->unitarray['u30'].")</span>
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" /><span class=\"little_res\">5500</span>|<img class=\"r2\" src=\"img/x.gif\" alt=\"Klei\" title=\"Klei\" /><span class=\"little_res\">7000</span>|<img class=\"r3\" src=\"img/x.gif\" alt=\"IJzer\" title=\"IJzer\" /><span class=\"little_res\">5300</span>|<img class=\"r4\" src=\"img/x.gif\" alt=\"Graan\" title=\"Graan\" /><span class=\"little_res\">4900</span>|<img class=\"r5\" src=\"img/x.gif\" alt=\"Graanverbruik\" title=\"Graanverbruik\" />1|<img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
				echo $generator->getTimeFormat(round($u30['time'] / $bid19[$village->resarray['f'.$id]]['attri'] * 100 / SPEED));
				echo "</div>
				</td>
				<td class=\"val\"><input type=\"text\" class=\"text\" name=\"t30\" value=\"0\" maxlength=\"4\"></td>
				<td class=\"max\"><a href=\"#\" onClick=\"document.snd.t30.value=".$technology->maxUnit(30)."; return false;\">(".$technology->maxUnit(30).")</a></td></tr></tbody>
				";
    ?>