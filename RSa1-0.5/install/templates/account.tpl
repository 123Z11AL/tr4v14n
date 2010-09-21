<?php
if(isset($_GET['c']) && $_GET['c'] == 1) {
echo "<div class=\"headline\"><span class=\"f10 c5\">Error creating account.</span></div><br>";
}
?>
<form action="process.php" method="post" id="dataform">
<div class="lbox">
<table><tr>
<td><span class="f9 c6">Username:</span></td><td><input name="user" type="text" id="user" value="admin"></td></tr><tr>
<td><span class="f9 c6">Password:</span></td><td><input name="pass" type="text" id="pass" value="admin"></td></tr><tr>
<td><span class="f9 c6">Email:</span></td><td><input name="email" type="text" id="email" value="admin@admin.com"></td></tr><tr>
<td><input type="submit" name="Submit" id="Submit" value="Submit"></td></tr>
</table>
</div>
<input type="hidden" name="subacc" value="1">
</form>