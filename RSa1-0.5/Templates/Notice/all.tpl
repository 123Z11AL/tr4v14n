<?php 
$noticeClass = array("","Won as attacker without losses","","","","Won as defender with losses","Lost as defender with losses","Lost as defender without losses","Reinforcement arrived");
?>
<form method="post" action="berichte.php" name="msg">
<table cellpadding="1" cellspacing="1" id="overview"
	class="row_table_data">
	<thead>
		<tr>
			<th colspan="2">Subject:</th>
			<th class="sent">
<a href="berichte.php?s=0&amp;o=1">Sent</a></th>
		</tr>
	</thead><tfoot>
		<tr><th><input class="check" type="checkbox" id="s10" name="s10" onclick="Allmsg(this.form);" /></th>
			<th class="buttons"><input name="del" type="image" id="btn_delete" class="dynamic_img" src="img/x.gif" value="delete" alt="delete" />
            <?php if($session->plus) { 
			if(isset($_GET['t']) && $_GET['t'] == 5) {
				echo "<input name=\"start\" type=\"image\" value=\"back\" alt=\"back\" id=\"btn_back\" class=\"dynamic_img\" src=\"img/x.gif\" />";
			}
			else {
				echo "<input name=\"archive\" type=\"image\" value=\"Archive\" alt=\"Archive\" id=\"btn_archiv\" class=\"dynamic_img\" src=\"img/x.gif\" />"; 
			}
			}?>
            </th>
						<th class=navi>
                        <?php 
    if(!isset($_GET['s']) && count($message->noticearray) < 10) {
    echo "&laquo;&raquo;";
    }
    else if (!isset($_GET['s']) && count($message->noticearray) > 10) {
    echo "&laquo;<a href=\"?s=10&o=0\">&raquo;</a>";
    }
    else if(isset($_GET['s']) && count($message->noticearray) > $_GET['s']) {
    	if(count($message->noticearray) > ($_GET['s']+10) && $_GET['s']-10 < count($message->noticearray) && $_GET['s'] != 0) {
         echo "<a href=\"?s=".($_GET['s']-10)."&o=0\">&laquo;</a><a href=\"?s=".($_GET['s']+10)."&o=0\">&raquo;</a>";
         }
         else if(count($message->noticearray) > $_GET['s']+10) {
         	echo "&laquo;<a href=\"?s=".($_GET['s']+10)."&o=0\">&raquo;</a>";
         }
        else {
        echo "<a href=\"?s=".($_GET['s']-10)."&o=0\">&laquo;</a>&raquo;";
        }
    }
    ?>
     </th>
		</tr>
	</tfoot>
	<tbody>
<?php 

    if(isset($_GET['s'])) {
    $s = $_GET['s'];
    }
    else {
    $s = 0;
    }
    
      $name = 1;
    for($i=(1+$s);$i<=(10+$s);$i++) {
    if(count($message->noticearray) >= $i) {
    echo "<tr><td class=\"sel\"><input class=\"check\" type=\"checkbox\" name=\"n".$name."\" value=\"".$message->noticearray[$i-1]['id']."\" /></td>
		<td class=\"sub\">";
        $type = (isset($_GET['t']) && $_GET['t'] == 5)? $message->noticearray[$i-1]['archive'] : $message->noticearray[$i-1]['type'];
      echo "<img src=\"img/x.gif\" class=\"iReport iReport$type\" alt=\"".$noticeClass[$type]."\" title=\"".$noticeClass[$type]."\" />";
     echo "<div><a href=\"berichte.php?id=".$message->noticearray[$i-1]['id']."\">".$message->noticearray[$i-1]['topic']."</a> ";
    if($message->noticearray[$i-1]['viewed'] == 0) {
    echo "(new)";
    }
    $date = $generator->procMtime($message->noticearray[$i-1]['time']);
	echo "</div></td><td class=\"dat\">".$date[0]." ".$date[1]."</td></tr>";
        }
        $name++;
    }
    if(count($message->noticearray) == 0) {
     echo "<td colspan=\"3\" class=\"none\">There are no reports available.</td></tr>";
    } 
    ?>
</tbody>
 
</table>

 