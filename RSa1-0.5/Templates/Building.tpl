<table cellpadding="1" cellspacing="1" id="building_contract">
		<thead><tr>
        <th colspan="4">Building:
			<?php
            if($session->gold >= 2) {
            ?> <a href="?buildingFinish=1" onclick="return confirm('Finish all construction and research orders in this village immediately for 2 Gold?');" title="Finish all construction and research orders in this village immediately for 2 Gold?"><img class="clock" alt="Finish all construction and research orders in this village immediately for 2 Gold?" src="img/x.gif"/></a>
            <?php
            }
            ?>
            </th>
		</tr></thead>
		<tbody>
        <?php 
        if(!isset($timer)) {
        $timer = 1;
        }
        foreach($building->buildArray as $jobs) {
        	echo "<tr><td class=\"ico\"><a href=\"?d=".$jobs['id']."&a=0&c=$session->checker\">";
            echo "<img src=\"img/x.gif\" class=\"del\" title=\"cancel\" alt=\"cancel\" /></a></td><td>";
            echo $building->procResType($jobs['type'])." (Level ".($village->resarray['f'.$jobs['field']]+1).")";
           // if($jobs['loopcon'] == 1) {
            	//echo " (waiting loop).";
          //  }
            echo "</td><td><span id=\"timer".$timer."\">";
            echo $generator->getTimeFormat($jobs['timestamp']-time());
            echo "</span> hrs.</td>";
            echo "<td>done at ".date('H:i', $jobs['timestamp'])."</td></tr>";
            $timer +=1;
        }
        ?>
            </tbody>
	</table>
	<script type="text/javascript">var bld=[{"stufe":1,"gid":"1","aid":"3"}]</script>