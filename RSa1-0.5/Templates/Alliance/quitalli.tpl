<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>".htmlspecialchars($allianceinfo['tag'])." - ".htmlspecialchars($allianceinfo['name'])."</h1>";
include("alli_menu.tpl"); 
?>
<table cellpadding="1" cellspacing="1" id="quit" class="small_option"><thead>

<form method="post" action="allianz.php">
<input type="hidden" name="a" value="11">
<input type="hidden" name="o" value="11">
<input type="hidden" name="s" value="5">

<tr>
<th colspan="2">Quit alliance</th>
</tr>
</thead><tbody>
<tr><td colspan="2" class="info">In order to quit the alliance you have to enter your password again for safety reasons.</td></tr>
<tr><th>password:</th>
<td><input class="pass text" type="password" name="pw" maxlength="20"></td>
</tr></tbody></table>
<span class="error"><?php echo $form->getError("error"); ?> </span><br>
<p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></form></p>