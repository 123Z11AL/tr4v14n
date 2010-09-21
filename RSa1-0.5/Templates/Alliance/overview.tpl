<?php
if(isset($_GET[aid])) {
$aid = $_GET[aid];
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
$memberlist = $database->getAllMember($aid);
$totalpop = 0;
// Calculamos el total de población
foreach($memberlist as $member) {
	$totalpop += $database->getVSumField($member['id'],"pop");
}
echo "<h1>".htmlspecialchars($allianceinfo['tag'])." - ".htmlspecialchars($allianceinfo['name'])."</h1>";
include("alli_menu.tpl"); 
//print_r ($memberlist);
?>
<table cellpadding="1" cellspacing="1" id="profile">
<thead>
<tr>
<th colspan="2">Alliance</th>
</tr>
<tr>
<td>Details</td>
<td>Description</td>
</tr>
</thead>
<tbody>
<tr><td class="empty"></td><td class="empty"></td></tr>
<tr>
	<td class="details">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<th>Tag</th>
				<td><?php echo htmlspecialchars($allianceinfo['tag']); ?></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><?php echo htmlspecialchars($allianceinfo['name']); ?></td>
			</tr>
			<tr>
				<td colspan="2" class="empty"></td>
			</tr>
			<tr>
				<th>Rank</th>
				<td><?php echo $ranking->getAllianceRank($aid); ?>.</td>
			</tr>
			<tr>
				<th>Points</th>
				<td><?php echo $totalpop; ?></td>
			</tr>
			<tr>
				<th>Members</th>
				<td><?php echo count($memberlist); ?></td>
			</tr><tr>
					<td colspan="2" class="empty"></td>
				</tr><tr>
					<th>alliance founder</th>
					<td><a href="spieler.php?uid=<?php echo $allianceinfo['leader']; ?>"><?php echo htmlspecialchars($database->getUserField($allianceinfo['leader'],"username",0)); ?></a></td>
				</tr>
                <?php
                if($allianceinfo['coor'] != 0) {
                echo "<tr><th>alliance founder</th>";
                }
                ?>
                <tr>
				<td colspan="2" class="emmty"></td>
			</tr>
			<tr>
				<td class="desc2" colspan="2"><?php echo htmlspecialchars($alliance->allianceArray[notice]); ?>
				</td>
			</tr>
			</table>
	</td>
	<td class="desc1"><?php echo htmlspecialchars($alliance->allianceArray[desc]); ?>
	</td>
</tr>
</tbody>
</table><table cellpadding="1" cellspacing="1" id="member"><thead>
<tr>
<th>&nbsp;</th>
<th>Player</th>
<th>Population</th>
<th>Villages</th>
<?    
if($aid == $session->alliance){
 	echo "<th>&nbsp;</th>";
}
?>
</tr>
</thead>
<tbody>
<?php
// Alliance Member list loop
$rank=0;
foreach($memberlist as $member) {
	$rank = $rank+1;
    $TotalUserPop = $database->getVSumField($member['id'],"pop");
	$TotalVillages = $database->getProfileVillages($member['id']);    
	
    echo "	<tr>";
    echo "	<td class=ra>".$rank.".</td>";
	echo "	<td class=pla><a href=spieler.php?uid=".$member['id'].">".htmlspecialchars($member['username'])."</a></td>"; 
	echo "	<td class=hab>".$TotalUserPop."</td>"; 
	echo "	<td class=vil>".count($TotalVillages)."</td>";
	
    if($aid == $session->alliance){	
    	if ((time()-600) < $member['timestamp']){ // 0 Min - 10 Min
    		echo "	<td class=on><img class=online1 src=img/x.gif title=now online alt=now online /></td>";
    	}elseif ((time()-86400) < $member['timestamp'] && (time()-600) > $member['timestamp']){ // 10 Min - 1 Days
    		echo "	<td class=on><img class=online2 src=img/x.gif title=now online alt=now online /></td>";              
   	 	}elseif ((time()-259200) < $member['timestamp'] && (time()-86400) > $member['timestamp']){ // 1-3 Days
    		echo "	<td class=on><img class=online3 src=img/x.gif title=now online alt=now online /></td>";    
    	}elseif ((time()-604800) < $member['timestamp'] && (time()-259200) > $member['timestamp']){
    		echo "	<td class=on><img class=online4 src=img/x.gif title=now online alt=now online /></td>";    
    	}else{
     		echo "	<td class=on><img class=online5 src=img/x.gif title=now online alt=now online /></td>";   
    	}
	}
    
    echo "	</tr>";    
}

?> 
</tbody>
</table>