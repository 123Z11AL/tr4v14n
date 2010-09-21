<table id="movements" cellpadding="1" cellspacing="1">
	<thead>
    <tr><th colspan="3">Troop Movements:</th></tr>
    </thead>
    <tbody>
    
<?php
// Tropas entrando
$incoming = count($village->movements[to]);
if ($incoming > 0){
global $generator;
foreach($village->movements[to] as $value) {
	$value[endtime] =  $value[endtime]- time();
    $value[endtime] = $generator->getTimeFormat($value[endtime]);
    switch($value[type]) {
    case 3:
    echo "<tr><td class=\"typ\"><a href=\"build.php?gid=16\"><img src=\"img/x.gif\" class=\"def1\" alt=\"Arriving reinforcing troops\" title=\"Arriving reinforcing troops\" /></a><span class=\"d1\">&laquo;</span></td>";
    echo "<td><div class=\"mov\"><span class=\"d1\">1&nbsp;Reinf.</span></div><div class=\"dur_r\">in&nbsp;<span id=\"timer1\">".$value[endtime]."</span>&nbsp;hrs.</div></div></td></tr>";
    break;    
    case 4:
    echo "<tr><td class=\"typ\"><a href=\"build.php?gid=16\"><img src=\"img/x.gif\" class=\"att1\" alt=\"Arriving attack troops\" title=\"Arriving attack troops\" /></a><span class=\"a1\">&laquo;</span></td>";
    echo "<td><div class=\"mov\"><span class=\"a1\">1&nbsp;Atack.</span></div><div class=\"dur_r\">in&nbsp;<span id=\"timer1\">".$value[endtime]."</span>&nbsp;hrs.</div></div></td></tr>";
    break;
    case 5:
     echo "<tr><td class=\"typ\"><a href=\"build.php?gid=16\"><img src=\"img/x.gif\" class=\"att1\" alt=\"Arriving attack troops\" title=\"Arriving attack troops\" /></a><span class=\"a1\">&laquo;</span></td>";
    echo "<td><div class=\"mov\"><span class=\"a1\">1&nbsp;Atack.</span></div><div class=\"dur_r\">in&nbsp;<span id=\"timer1\">".$value[endtime]."</span>&nbsp;hrs.</div></div></td></tr>";
    break;
    }
	}
}

// Tropas saliendo
$out = count($village->movements[from]);
if ($out > 0){
global $generator;
foreach($village->movements[from] as $value) {
	$value[endtime] =  $value[endtime]- time();
    $value[endtime] = $generator->getTimeFormat($value[endtime]);
    switch($value[type]) {
    case 3:
    echo "<tr><td class=\"typ\"><a href=\"build.php?gid=16\"><img src=\"img/x.gif\" class=\"def2\" alt=\"Arriving reinforcing troops\" title=\"Arriving reinforcing troops\" /></a><span class=\"d1\">&raquo;</span></td>";
    echo "<td><div class=\"mov\"><span class=\"d1\">1&nbsp;Reinf.</span></div><div class=\"dur_r\">in&nbsp;<span id=\"timer1\">".$value[endtime]."</span>&nbsp;hrs.</div></div></td></tr>";
    break;    
    case 4:
    echo "<tr><td class=\"typ\"><a href=\"build.php?gid=16\"><img src=\"img/x.gif\" class=\"att2\" alt=\"Arriving attack troops\" title=\"Arriving attack troops\" /></a><span class=\"a1\">&raquo;</span></td>";
    echo "<td><div class=\"mov\"><span class=\"a1\">1&nbsp;Atack.</span></div><div class=\"dur_r\">in&nbsp;<span id=\"timer1\">".$value[endtime]."</span>&nbsp;hrs.</div></div></td></tr>";
    break;
    case 5:
     echo "<tr><td class=\"typ\"><a href=\"build.php?gid=16\"><img src=\"img/x.gif\" class=\"att1\" alt=\"Arriving attack troops\" title=\"Arriving attack troops\" /></a><span class=\"a1\">&raquo;</span></td>";
    echo "<td><div class=\"mov\"><span class=\"a1\">1&nbsp;Atack.</span></div><div class=\"dur_r\">in&nbsp;<span id=\"timer1\">".$value[endtime]."</span>&nbsp;hrs.</div></div></td></tr>";
    break;
    }
}
}
?>
      
    </tbody>
</table>