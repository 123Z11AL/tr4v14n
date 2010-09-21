<?php
if(!is_numeric($_SESSION['search'])) {
	echo "<p class=\"error\">The user <b>".htmlspecialchars($_SESSION['search'])."</b> does not exist.</p>";
    $search = 0;
}
else {
$search = $_SESSION['search'];
}
?>
<table cellpadding="1" cellspacing="1" id="player">
	<thead>
				<tr>
					<th colspan="5">
						The largest players						<div id="submenu"><a title="Top 10" href="statistiken.php?id=7"><img class="btn_top10" src="img/x.gif" alt="Top 10" /></a><a title="defender" href="statistiken.php?id=32"><img class="btn_def" src="img/x.gif" alt="defender" /></a><a title="attacker" href="statistiken.php?id=31"><img class="btn_off" src="img/x.gif" alt="attacker" /></a></div>		    
					</th>
				</tr>
		<tr><td></td><td>Player</td><td>Alliance</td><td>Population</td><td>Villages</td></tr>
		</thead><tbody>  
        <?php
        $start = $_SESSION['start'];
        if(count($ranking->getRank()) > 0) {
        	$ranking = $ranking->getRank();
            for($i=$start;$i<($start+20);$i++) {
            	if(isset($ranking[$i]['username']) && $ranking[$i] != "pad") {
                	if($i == $search) {
                    echo "<tr class=\"hl\"><td class=\"ra fc\" >";
                    }
                    else {
                    echo "<tr><td class=\"ra \" >";
                    }
                    echo $i.".</td><td class=\"pla \" ><a href=\"spieler.php?uid=".$ranking[$i]['id']."\">".htmlspecialchars($ranking[$i]['username'])."</a></td><td class=\"al \" >";
                    if($ranking[$i]['alliance'] != 0) {
                    echo "<a href=\"allianz.php?aid=".$ranking[$i]['alliance']."\">".htmlspecialchars($ranking[$i]['aname'])."</a>";
                    }
                    else {
                    echo "-";
                    }
                    echo "</td><td class=\"pop \" >".$ranking[$i]['totalpop']."</td><td class=\"vil\">".$ranking[$i]['totalvillage']."</td></tr>";
                }
            }
        }
        else {
        	echo "<td class=\"none\" colspan=\"5\">No users found</td>";
        }
        ?>
 </tbody>
</table>
<?php
include("ranksearch.tpl");
?>