<?php
if(isset($_GET['c']) && $_GET['c'] == 1) {
echo "<div class=\"headline\"><span class=\"f10 c5\">Error creating constant.php check cmod.</span></div><br>";
}
?>
<form action="process.php" method="post" id="dataform">
<div class="lbox">
<span class="f10 c">SERVER RELATED</span>
<table><tr>
<td><span class="f8 c6">Server name:</span></td><td width="140"><input type="text" name="servername" id="servername"></td></tr><tr>
<td><span class="f8 c6">Speed:</span></td><td><input name="speed" type="text" id="speed" value="1"></td></tr><tr>
<td><span class="f8 c6">Increase Speed:</span></td><td><input name="incspeed" type="text" id="incspeed" value="2"></td></tr><tr>
<td><span class="f8 c6">Track Users:</span></td><td><select name="trackusers">
  <option value="false" selected="selected">No</option>
  <option value="true">Yes</option>
</select></td></tr>
<td><span class="f8 c6">User Timeout(min):</span></td><td><input name="timeout" type="text" id="timeout" value="10"></td></tr><tr>
<td><span class="f8 c6">Del Inactive Users:</span></td>
<td><select name="autodel">
  <option value="false" selected="selected">No</option>
  <option value="true">Yes</option>
</select></td></tr>
  <td><span class="f8 c6">Inactive Del Time:</span></td><td><input name="autodeltime" type="text" id="autodeltime" value="3600*24*7"></td></tr><tr>
<td><span class="f8 c6">World Max:</span></td><td><input name="wmax" type="text" id="wmax" value="400"></td></tr><tr>
<td><span class="f8 c6">Graphic Pack:</span></td><td><input name="gpack" type="text" id="gpack" value="false"></td></tr><tr>
<td><span class="f8 c6">Subdomain:</span></td><td><select name="subdom">
  <option value="0" selected="selected">No</option>
  <option value="1">Yes</option>
</select></td></tr>
<tr>
<td><span class="f8 c6">Lang:</span></td><td><select name="lang">
  <option value="EN" selected="selected">English</option>
  <option value="ES">Spanish</option>
</select></td></tr>
</table></div>

<div class="lbox">
<span class="f10 c">MESSAGE CENSOR</span>
<table><tr>
<td><span class="f8 c6">Active Censor:</span></td>
<td><select name="actcensor">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr>
<td><span class="f8 c6">Words:</span></td>
<td width="140"><input type="text" name="words" id="words" value="fuck,virgin" /></td></tr><tr>
</table>
</div>

<div class="lbox">
<span class="f10 c">LOG CONTROL</span>
<table><tr>
<td><span class="f8 c6">Build:</span></td>
<td width="140"><select name="log_build">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr><tr>
<td><span class="f8 c6">Tech:</span></td>
<td><select name="log_tech">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr><tr>
<td><span class="f8 c6">Login:</span></td>
<td><select name="log_login">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr><tr>
<td><span class="f8 c6">Admin:</span></td>
<td><select name="log_admin">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr><tr>
<td><span class="f8 c6">War:</span></td>
<td><select name="log_war">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr><tr>
<td><span class="f8 c6">Market:</span></td>
<td><select name="log_market">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr>
<tr>
<td><span class="f8 c6">Illegal:</span></td>
<td><select name="log_illegal">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr>
<tr>
<td><span class="f8 c6">Gold Fin:</span></td>
<td><select name="log_gold_fin">
  <option value="false">No</option>
  <option value="true" selected="selected">Yes</option>
</select></td></tr>
</table></div>

<div class="lbox">
<span class="f10 c">USER REGISTRATION</span>
<table><tr>
<td><span class="f8 c6">Min. User Length:</span></td>
<td width="140"><input type="text" name="userlength" id="userlength" value="3" /></td>
</tr><tr>
<td><span class="f8 c6">Min. Pass Length:</span></td>
<td><input name="passlength" type="text" id="passlength" value="4"></td></tr><tr>
<td><span class="f8 c6">Special Chars:</span></td>
<td><select name="specialchars">
  <option value="false" selected="selected">No</option>
  <option value="true">Yes</option>
</select></td></tr>
<tr>
<td><span class="f8 c6">Activation email:</span></td>
<td><select name="authmail">
  <option value="false" selected="selected">No</option>
  <option value="true">Yes</option>
</select></td></tr>
</table>
</div>

<div class="rbox">
<span class="f10 c">SQL RELATED</span>
<table><tr>
<td><span class="f8 c6">SERVER:</span></td><td><input name="sserver" type="text" id="sserver" value="localhost"></td></tr><tr>
<td><span class="f8 c6">USER:</span></td><td><input name="suser" type="text" id="suser" value="root"></td></tr><tr>
<td><span class="f8 c6">PASS:</span></td><td><input type="text" name="spass" id="spass"></td></tr><tr>
<td><span class="f8 c6">DB:</span></td><td><input type="text" name="sdb" id="sdb"></td></tr><tr>
<td><span class="f8 c6">PREFIX:</span></td><td><input type="text" name="prefix" id="prefix"></td></tr>
<td><span class="f8 c6">Connect Type:</span></td><td><select name="connectt">
  <option value="0" selected="selected">MYSQL</option>
  <option value="1">MYSQLi</option>
</select></td></tr>
</table>
<div class="lbox">
<span class="f10 c">MAILER RELATED</span>
<table><tr>
<td><span class="f8 c6">Admin Name:</span></td><td width="140"><input type="text" name="aname" id="aname"></td></tr><tr>
<td><span class="f8 c6">Admin Email:</span></td><td><input name="aemail" type="text" id="aemail"></td></tr>
<td><span class="f8 c6">Admin in Rankings?:</span></td>
<td><select name="admin_rank">
  <option value="false" selected="selected">No</option>
  <option value="true">Yes</option>
</select></td></tr>
</table>
<input type="submit" name="Submit" id="Submit" value="Submit">
</div>
<input type="hidden" name="subconst" value="1">
</form>