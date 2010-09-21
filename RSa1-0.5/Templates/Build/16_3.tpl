 <tr><th>&nbsp;</th>
            <td><img src="img/x.gif" class="unit u21" title="Phalanx" alt="Phalanx" /></td>
            <td><img src="img/x.gif" class="unit u22" title="Swordsman" alt="Swordsman" /></td>
            <td><img src="img/x.gif" class="unit u23" title="Pathfinder" alt="Pathfinder" /></td>
            <td><img src="img/x.gif" class="unit u24" title="Theutates Thunder" alt="Theutates Thunder" /></td>
            <td><img src="img/x.gif" class="unit u25" title="Druidrider" alt="Druidrider" /></td>
            <td><img src="img/x.gif" class="unit u26" title="Haeduan" alt="Haeduan" /></td>
            <td><img src="img/x.gif" class="unit u27" title="Ram" alt="Ram" /></td>
            <td><img src="img/x.gif" class="unit u28" title="Trebuchet" alt="Trebuchet" /></td>
            <td><img src="img/x.gif" class="unit u29" title="Chieftain" alt="Chieftain" /></td>
            <td><img src="img/x.gif" class="unit u30" title="Settler" alt="Settler" /></td></tr><tr><th>Troops</th>
          <?php
            for($i=21;$i<=30;$i++) {
            	if($village->unitarray['u'.$i] == 0) {
                	echo "<td class=\"none\">";
                }
                else {
                echo "<td>";
                }
                echo $village->unitarray['u'.$i]."</td>";
            }
            ?>
           </tr></tbody>
            <tbody class="infos"><tr><th>Upkeep</th>
            <td colspan="10"><?php echo $technology->getUpkeep($village->unitarray,3); ?><img class="r4" src="img/x.gif" title="Crop" alt="Crop" />per hour</td></tr>