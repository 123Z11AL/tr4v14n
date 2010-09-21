 <tr><th>&nbsp;</th>
            <td><img src="img/x.gif" class="unit u11" title="Clubswinger" alt="Clubswinger" /></td>
            <td><img src="img/x.gif" class="unit u12" title="Spearman" alt="Spearman" /></td>
            <td><img src="img/x.gif" class="unit u13" title="Axeman" alt="Axeman" /></td>
            <td><img src="img/x.gif" class="unit u14" title="Scout" alt="Scout" /></td>
            <td><img src="img/x.gif" class="unit u15" title="Paladin" alt="Paladin" /></td>
            <td><img src="img/x.gif" class="unit u16" title="Teutonic Knight" alt="Teutonic Knight" /></td>
            <td><img src="img/x.gif" class="unit u17" title="Ram" alt="Ram" /></td>
            <td><img src="img/x.gif" class="unit u18" title="Catapult" alt="Catapult" /></td>
            <td><img src="img/x.gif" class="unit u19" title="Chief" alt="Chief" /></td>
            <td><img src="img/x.gif" class="unit u20" title="Settler" alt="Settler" /></td></tr><tr><th>Troops</th>
            <?php
            for($i=11;$i<21;$i++) {
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
            <td colspan="10"><?php echo $technology->getUpkeep($village->unitarray,2); ?><img class="r4" src="img/x.gif" title="Crop" alt="Crop" />per hour</td></tr>