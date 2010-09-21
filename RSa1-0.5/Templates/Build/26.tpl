<div id="build" class="gid26"><a href="#" onClick="return Popup(25,4);" class="build_logo">
	<img class="building g26" src="img/x.gif" alt="<?php echo $lang['building'][26][0]; ?>" title="<?php echo $lang['building'][26][0]; ?>" />
</a>
<h1><?php echo $lang['building'][26][0]; ?> <span class="level">level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc"><?php echo $lang['building'][26][1]; ?></p>

<div id="textmenu">
   <a href="build.php?id=<?php echo $_GET['id']; ?>" <?php if(!isset($_GET['s']) || (isset($_GET['s']) && ($_GET['s'] == 1))) { echo "class=\"selected \""; } ?>>Train</a>
 | <a href="build.php?id=<?php echo $_GET['id']; ?>&amp;s=2" <?php if(isset($_GET['s']) && $_GET['s'] == 2) { echo "class=\"selected \""; } ?>>Culture points</a>
 | <a href="build.php?id=<?php echo $_GET['id']; ?>&amp;s=3" <?php if(isset($_GET['s']) && $_GET['s'] == 3) { echo "class=\"selected \""; } ?>>Loyalty</a>
 | <a href="build.php?id=<?php echo $_GET['id']; ?>&amp;s=4" <?php if(isset($_GET['s']) && $_GET['s'] == 4) { echo "class=\"selected \""; } ?>>Expansion</a>
</div>

		<form method="POST" name="snd" action="build.php">
				<input type="hidden" name="id" value="<?php echo $id; ?>" />
				<input type="hidden" name="ft" value="t1" />
			<table cellpadding="1" cellspacing="1" class="build_details">
				<thead>
					<tr>
						<td>Name</td>
						<td>Quantity</td>
						<td>Max</td>
					</tr>
				</thead>
				<tbody>
				<?php 
                include("26_".$session->tribe.".tpl");
                ?>	
				<!--<tr>
					<td class="desc">
						<div class="tit">
							<img class="unit u20" src="img/x.gif" alt="Settler" title="Settler" />
							<a href="#" onClick="return Popup(20,1);">Settler</a> <span class=\"info\">(Available: <?php echo $village->unitarray['u20']; ?>)</span>
					</div>
						</div>
						<div class="details">
							<img class="r1" src="img/x.gif" alt="Wood" title="Wood" /><span class="little_res">7200</span>|<img class="r2" src="img/x.gif" alt="Klei" title="Klei" /><span class="little_res">5500</span>|<img class="r3" src="img/x.gif" alt="IJzer" title="IJzer" /><span class="little_res">5800</span>|<img class="r4" src="img/x.gif" alt="Graan" title="Graan" /><span class="little_res">6500</span>|<img class="r5" src="img/x.gif" alt="Graanverbruik" title="Graanverbruik" />1|<img class="clock" src="img/x.gif" alt="duur" title="duur" />0:57:54
						</div>
					</td>
					<td class="val">
						<input type="text" class="text" name="t20" value="0" maxlength="4">
					</td>
					<td class="max">
						<a href="#" onClick="document.snd.t20.value=<?php echo $technology->maxUnit(20); ?>; return false;">(<?php echo $technology->maxUnit(20); ?>)</a>
					</td>
				</tr>
			
				</tbody>-->
			</table>
			<p>
				<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" />
			</p>
		</form>
    <?php
    $trainlist = $technology->getTrainingList(1);
    if(count($trainlist) > 0) {
    $timer = 2*count($trainlist);
    	echo "
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Training</td>
			<td>Duration</td>
			<td>Finished</td>
		</tr></thead>
		<tbody>";
        foreach($trainlist as $train) {
        echo "<tr><td class=\"desc\">";
        echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />".$train['amt']." ".$train['name']."</td><td class=\"dur\"><span id=timer".$timer.">".$generator->getTimeFormat(($train['commence']+($train['eachtime']*$train['amt']))-time())."</span></td><td class=\"fin\">";
        $timer -= 1;
        $time = $generator->procMTime($train['commence']+(1*$train['amt']));
        if($time[0] != "today") {
            echo "on ".$time[0]." at";
            }
            echo $time[1]."</span><span> o'clock</td>
		</tr><tr class=\"next\"><td colspan=\"3\">The next unit will be finished in <span id=timer".$timer.">".$generator->getTimeFormat(($train['commence']+$train['eachtime'])-time())."</span></td></tr>";
        }
        echo "</tbody></table>";
    }
    ?>
    


<?php 
include("upgrade.tpl");
?>
</p>
</div>