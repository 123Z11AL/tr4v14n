<div id="build" class="gid16"><a href="#" onClick="return Popup(16,4);" class="build_logo">
	<img class="g16" src="img/x.gif" alt="<?php echo $lang['building'][16][0]; ?>" title="<?php echo $lang['building'][16][0]; ?>" />
</a>
<h1><?php echo $lang['building'][16][0]; ?> <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][16][1]; ?></p>

<div id="textmenu">
		<a href="build.php?id=<?php echo $id; ?>">Overview</a> |
		<a href="a2b.php">Send troops</a> |
		<a href="warsim.php">Combat Simulator</a></div><h4>Troops in the village</h4>
        <table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td><td colspan="10">
            <a href="spieler.php?uid=<?php echo $session->uid; ?>">Own troops</a></td></tr></thead>
            <tbody class="units">
           <?php include("16_".$session->tribe.".tpl"); 
           for($i=31;$i<=40;$i++) {
           	if($village->unitarray['u'.$i] > 0) {
            	include("16_4.tpl");
            }
           }
           ?>
            </tbody></table>
            
            <?php
            if(count($village->enforcearray) > 0) {
            echo "<h4>Enforcement in the village</h4>";
            foreach($village->enforcearray as $enforce) {
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$enforce['from']."&c=".$generator->getMapCheck($enforce['from'])."\">".$database->getVillageField($enforce['from'],"name")."</a></td>
                  <td colspan=\"10\">";
                  echo "<a href=\"spieler.php?uid=".$database->getVillageField($enforce['from'],"owner")."\">".$database->getUserField($database->getVillageField($enforce['from'],"owner"),"username",0)." troops</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
                  $start = ($tribe == 1)? 1 : (($tribe == 2)? 11 : 21);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($start+9);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
                  echo "</tr><tr><th>Troops</th>";
                  for($i=$start;$i<=($start+9);$i++) {
                  if($enforce['u'.$i] == 0) {
                	echo "<td class=\"none\">";
                       }
                      else {
                     echo "<td>";
                        }
                        echo $enforce['u'.$i]."</td>";
                  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><th>Upkeep</th><td colspan=\"10\">".$technology->getUpkeep($enforce,$tribe)."<img class=\"r4\" src=\"img/x.gif\" title=\"Crop\" alt=\"Crop\" />per hour</td></tr>";
            
                  echo "</tbody></table>";
            }
            }
            ?>
<?php 
include("upgrade.tpl");
?>
</p></div>