<div id="content"  class="messages">
<h1>Messages</h1>
<?php 
include("menu.tpl");
?>
<form method="post" action="nachrichten.php" name="msg" ><table cellpadding="1" cellspacing="1" id="overview">
<thead>
<tr>
<th colspan="2">Subject</th>
<th>Sender</th>
<th class="sent">Sent</th>
</tr></thead><tfoot><tr><th>&nbsp;</th>
	<th colspan="2" class="buttons">
		<input name="delmsg" value="delete" type="image" id="btn_delete" class="dynamic_img" src="img/x.gif" alt="delete" />
        <?php if($session->plus) { echo "<input name=\"archive\" value=\"Archive\" type=\"image\" id=\"btn_archiv\" class=\"dynamic_img\" src=\"img/x.gif\" alt=\"Archive\" />"; } ?>
        <input name="ft" value="m3" type="hidden" />
	</th><th class="navi"><?php 
    if(!isset($_GET['s']) && count($message->inbox) < 10) {
    echo "&laquo;&raquo;";
    }
    else if (!isset($_GET['s']) && count($message->inbox) > 10) {
    echo "&laquo;<a href=\"?s=10&o=0\">&raquo;</a>";
    }
    else if(isset($_GET['s']) && count($message->inbox) > $_GET['s']) {
    	if(count($message->inbox) > ($_GET['s']+10) && $_GET['s']-10 < count($message->inbox) && $_GET['s'] != 0) {
         echo "<a href=\"?s=".($_GET['s']-10)."&o=0\">&laquo;</a><a href=\"?s=".($_GET['s']+10)."&o=0\">&raquo;</a>";
         }
         else if(count($message->inbox) > $_GET['s']+10) {
         	echo "&laquo;<a href=\"?s=".($_GET['s']+10)."&o=0\">&raquo;</a>";
         }
        else {
        echo "<a href=\"?s=".($_GET['s']-10)."&o=0\">&laquo;</a>&raquo;";
        }
    }
    ?></th></tr></tfoot><tbody>
    <?php 
    if(isset($_GET['s'])) {
    $s = $_GET['s'];
    }
    else {
    $s = 0;
    }
      $name = 1;
    for($i=(1+$s);$i<=(10+$s);$i++) {
    if(count($message->inbox) >= $i) {
    if($message->inbox[$i-1]['owner'] == 0) {
    echo "<tr class=\"sup\">";
    }
    else {
    echo "<tr>";
    }
    echo "<td class=\"sel\"><input class=\"check\" type=\"checkbox\" name=\"n".$name."\" value=\"".$message->inbox[$i-1]['id']."\" /></td>
		<td class=\"top\"><a href=\"nachrichten.php?id=".$message->inbox[$i-1]['id']."\">".htmlspecialchars($message->inbox[$i-1]['topic'])."</a> ";
    if($message->inbox[$i-1]['viewed'] == 0) {
    echo "(new)";
    }
    $date = $generator->procMtime($message->inbox[$i-1]['time']);
    if($message->inbox[$i-1]['owner'] == 0) {
    echo "</td><td class=\"send\"><a><u>".htmlspecialchars($database->getUserField($message->inbox[$i-1]['owner'],'username',0))."</u></a></td>
		<td class=\"dat\">".$date[0]." ".$date[1]."</td></tr>";
    }
    else {
    echo "</td><td class=\"send\"><a href=\"spieler.php?uid=".$message->inbox[$i-1]['owner']."\"><u>".htmlspecialchars($database->getUserField($message->inbox[$i-1]['owner'],'username',0))."</u></a></td>
		<td class=\"dat\">".$date[0]." ".$date[1]."</td></tr>";
        }
        }
        $name++;
    }
    if(count($message->inbox) == 0) {
    echo "<td colspan=\"4\" class=\"none\">There are no messages available.</td></tr>";
    }
    ?>
        </tbody></table>
</form>
</div>