<?php
if(!is_numeric($_SESSION['search'])) {
	echo "<p class=\"error\">The alliance <b>".$_SESSION['search']."</b> does not exist.</p>";
    $search = 0;
}
else {
$search = $_SESSION['search'];
}
?>
<table cellpadding="1" cellspacing="1" id="alliance" class="row_table_data">
			<thead>
				<tr>
					<th colspan="5">
						The largest alliances						<div id="submenu"><a title="Top 10" href="statistiken.php?id=47"><img class="btn_top10" src="img/x.gif" alt="Top 10" /></a><a title="defender" href="statistiken.php?id=42"><img class="btn_def" src="img/x.gif" alt="defender" /></a><a title="attacker" href="statistiken.php?id=41"><img class="btn_off" src="img/x.gif" alt="attacker" /></a></div>		    
					</th>
				</tr>
		<tr><td></td><td>Alliance</td><td>Player</td><td>&Oslash;</td><td>Points</td></tr>
		</thead><tbody>  
        <?php
        $start = $_SESSION['start'];
        if(count($ranking->getRank()) > 0) {
        	$ranking = $ranking->getRank();
            for($i=$start;$i<($start+20);$i++) {
            	if(isset($ranking[$i]['name']) && $ranking[$i] != "pad") {
                	if($i == $search) {
                    echo "<tr class=\"hl\"><td class=\"ra fc\" >";
                    }
                    else {
                    echo "<tr><td class=\"ra \" >";
                    }
                    echo $i.".</td><td class=\"al \" ><a href=\"allianz.php?aid=".$ranking[$i]['id']."\">".htmlspecialchars($ranking[$i]['tag'])."</a></td><td class=\"pla \" >";
                    echo $ranking[$i]['players']."</td><td class=\"av \" >".$ranking[$i]['avg']."</td><td class=\"po \">".$ranking[$i]['totalpop']."</td></tr>";
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