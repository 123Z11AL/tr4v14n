<?php if(!is_numeric($_SESSION['search'])) {
	echo "<p class=\"error\">The user <b>".$_SESSION['search']."</b> does not exist.</p>";
    $search = 0;
}
else {
$search = $_SESSION['search'];
}
?>
<table cellpadding="1" cellspacing="1" id="player_def" class="row_table_data">
			<thead>
				<tr>
					<th colspan="5">
						The most successful defenders						<div id="submenu"><a title="Top 10" href="statistiken.php?id=7"><img class="btn_top10" src="img/x.gif" alt="Top 10" /></a><a title="defender" href="statistiken.php?id=1"><img class="active btn_def" src="img/x.gif" alt="defender" /></a><a title="attacker" href="statistiken.php?id=31"><img class="btn_off" src="img/x.gif" alt="attacker" /></a></div>		    
					</th>
				</tr>
		<tr><td></td><td>Player</td><td>Population</td><td>Villages</td><td>Points</td></tr>
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
                    echo $i.".</td><td class=\"pla \" ><a href=\"spieler.php?uid=".$ranking[$i]['id']."\">".$ranking[$i]['username']."</a></td>";
                    echo "<td class=\"pop \" >".$ranking[$i]['totalpop'];
                    echo "</td><td class=\"vil\">".$ranking[$i]['totalvillage']."</td><td class=\"po \" >".$ranking[$i]['dp']."</td></tr>";
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