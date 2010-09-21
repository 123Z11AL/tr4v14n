 <tr><th>&nbsp;</th>
            <td><img src="img/x.gif" class="unit u1" title="Legionnaire" alt="Legionnaire" /></td>
            <td><img src="img/x.gif" class="unit u2" title="Praetorian" alt="Praetorian" /></td>
            <td><img src="img/x.gif" class="unit u3" title="Imperian" alt="Imperian" /></td>
            <td><img src="img/x.gif" class="unit u4" title="Equites Legati" alt="Equites Legati" /></td>
            <td><img src="img/x.gif" class="unit u5" title="Equites Imperatoris" alt="Equites Imperatoris" /></td>
            <td><img src="img/x.gif" class="unit u6" title="Equites Caesaris" alt="Equites Caesaris" /></td>
            <td><img src="img/x.gif" class="unit u7" title="Battering Ram" alt="Battering Ram" /></td>
            <td><img src="img/x.gif" class="unit u8" title="Fire Catapult" alt="Fire Catapult" /></td>
            <td><img src="img/x.gif" class="unit u9" title="Senator" alt="Senator" /></td>
            <td><img src="img/x.gif" class="unit u10" title="Settler" alt="Settler" /></td></tr><tr><th>Troops</th>
            <?php
            for($i=1;$i<=10;$i++) {
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
            <td colspan="10"><?php echo $technology->getUpkeep($village->unitarray,1); ?><img class="r4" src="img/x.gif" title="Crop" alt="Crop" />per hour</td></tr>