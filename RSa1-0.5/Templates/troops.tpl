<table id="troops" cellpadding="1" cellspacing="1">
<thead><tr>
	<th colspan="3">Troops:</th>
</tr></thead><tbody>
<?php
$units = $technology->getUnitList();
if(count($units) == 0) {
	echo "<tr><td>none</td></tr>";
}
else {
	foreach($units as $unit) {
		echo "<tr><td class=\"ico\"><a href=\"build.php?id=39\"><img class=\"unit u".$unit['id']."\" src=\"img/x.gif\" alt=\"".$unit['name']."\" title=\"".$unit['name']."\" /></a></td>
";	
		echo "<td class=\"num\">".$unit['amt']."</td><td class=\"un\">".$unit['name']."</td></tr>";
	}
	}


?>
	</tbody></table>
</div>