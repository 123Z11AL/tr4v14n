<?php
echo "<tr><td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u20\" src=\"img/x.gif\" alt=\"Settler\" title=\"Settler\" />
						<a href=\"#\" onClick=\"return Popup(20,1);\"> Settler</a> <span class=\"info\">(Available: ".$village->unitarray['u20'].")</span>
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Wood\" title=\"Wood\" /><span class=\"little_res\">7200</span>|<img class=\"r2\" src=\"img/x.gif\" alt=\"Klei\" title=\"Klei\" /><span class=\"little_res\">5500</span>|<img class=\"r3\" src=\"img/x.gif\" alt=\"IJzer\" title=\"IJzer\" /><span class=\"little_res\">5800</span>|<img class=\"r4\" src=\"img/x.gif\" alt=\"Graan\" title=\"Graan\" /><span class=\"little_res\">6500</span>|<img class=\"r5\" src=\"img/x.gif\" alt=\"Graanverbruik\" title=\"Graanverbruik\" />1|<img class=\"clock\" src=\"img/x.gif\" alt=\"Duration\" title=\"Duration\" />";
				echo $generator->getTimeFormat(round($u20['time'] / $bid19[$village->resarray['f'.$id]]['attri'] * 100 / SPEED));
				echo "</div>
				</td>
				<td class=\"val\"><input type=\"text\" class=\"text\" name=\"t20\" value=\"0\" maxlength=\"4\"></td>
				<td class=\"max\"><a href=\"#\" onClick=\"document.snd.t20.value=".$technology->maxUnit(20)."; return false;\">(".$technology->maxUnit(20).")</a></td></tr></tbody>
				";
    ?>