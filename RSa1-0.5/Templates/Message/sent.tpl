<div id="content"  class="messages">
<h1>Messages</h1>
<?php 
include("menu.tpl");
?>
<form method="post" action="nachrichten.php" name="msg">
<input type="hidden" name="ft" value="m4" />
<table cellpadding="1" cellspacing="1" id="overview">
<thead><tr>
<th></th>
<th>Subject</th>
<th>Recipient</th>
<th class="sent"><a href="nachrichten.php?s=0&amp;t=2&amp;o=1">Sent</a></th>
</tr></thead><tfoot><tr><th><!--<input class="check" type="checkbox" id="s10" name="s10" onclick="Allmsg(this.form);" />--></th>
	<th colspan="2" class="buttons"><input name="delmsg" value="delete" type="image" id="btn_delete" class="dynamic_img" src="img/x.gif" alt="delete" /></th><th class="navi"><?php 
     if(!isset($_GET['s']) && count($message->sent) < 10) {
    echo "&laquo;&raquo;";
    }
    else if (!isset($_GET['s']) && count($message->sent) > 10) {
    echo "&laquo;<a href=\"?s=10&o=0\">&raquo;</a>";
    }
    else if(isset($_GET['s']) && count($message->sent) > $_GET['s']) {
    	if(count($message->sent) > ($_GET['s']+10) && $_GET['s']-10 < count($message->sent) && $_GET['s'] != 0) {
         echo "<a href=\"?s=".($_GET['s']-10)."&o=0\">&laquo;</a><a href=\"?s=".($_GET['s']+10)."&o=0\">&raquo;</a>";
         }
         else if(count($message->sent) > $_GET['s']+10) {
         	echo "&laquo;<a href=\"?s=".($_GET['s']+10)."&o=0\">&raquo;</a>";
         }
        else {
        echo "<a href=\"?s=".($_GET['s']-10)."&o=0\">&laquo;</a>&raquo;";
        }
    }
    ?></th></tr></tfoot>
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
    if(count($message->sent) >= $i) {
    if($message->sent[$i-1]['target'] == 0) {
    echo "<tr class=\"sup\">";
    }
    else {
    echo "<tr>";
    }
    echo "<td class=\"sel\"><input class=\"check\" type=\"checkbox\" name=\"n".$name."\" value=\"".$message->sent[$i-1]['id']."\" /></td>
		<td class=\"top\"><a href=\"nachrichten.php?id=".$message->sent[$i-1]['id']."\">".htmlspecialchars($message->sent[$i-1]['topic'])."</a> ";
    if($message->sent[$i-1]['viewed'] == 0) {
    echo "(unread)";
    }
    $date = $generator->procMtime($message->sent[$i-1]['time']);
    echo "</td><td class=\"send\"><a href=\"spieler.php?uid=".$message->sent[$i-1]['target']."\"><u>".$database->getUserField($message->sent[$i-1]['target'],'username',0)."</u></a></td>
		<td class=\"dat\">".$date[0]." ".$date[1]."</td></tr>";
        }
        $name++;
    }
    if(count($message->sent) == 0) {
    echo "<td colspan=\"4\" class=\"none\">There are no sent messages available.</td></tr>";
    }
    ?>
</tbody></table>
</form>
</div>
