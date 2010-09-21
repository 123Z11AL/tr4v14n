<?php
include("engine/village.php");
$start = $generator->pageLoadTimeStart();
$battle->procSim($_POST);
?>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<div id="content"  class="warsim">
<h1>Combat simulator</h1>
<?php
// Ataca con nobles
if (isset($_POST['result'][9])){
echo "loyalty lowered ".$_POST['result'][9]."%<br>";
}
?>
<form action="warsim.php" method="post">
<?php 
//
// Parseamos los templates de resultados si existen
//
if(isset($_POST['result'])) { 
//print_r($_POST['result']);  
	$target = isset($_POST['target'])? $_POST['target'] : array();
	$tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
	// Template del Resultado Atacante
	include("Templates/Simulator/res_a".$tribe.".tpl");
	// Template del Resultado Defensor/es
	foreach($target as $tar) {
		include("Templates/Simulator/res_d".$tar.".tpl");
	}
	//include("Templates/Simulator/return.tpl"); // Para pruebas
	echo "<p>Type of attack: <b>";
	echo $form->getValue('ktyp') == 0? "Normal" : "Raid";
	echo "</b></p>";
	// Ataca con catapultas, calcula el nivel de derribo y lo muestra
	if (isset($_POST['result'][3])&&isset($_POST['result'][4])){
		if ($_POST['result'][4]>$_POST['result'][3]){
			echo "Edificio demolido";
		}elseif ($_POST['result'][4]==0){
			echo "El edificio no ha sufrido daños";
		}else{
			$demolish=$_POST['result'][4]/$_POST['result'][3];
			$Katalife=round($_POST['result'][4]-($_POST['result'][4]*$_POST['result'][1])); 
			$totallvl = round($form->getValue('kata')-($form->getValue('kata') * $demolish));
		echo "<p>Damage done by catapult: from level <b>".$form->getValue('kata')."</b> to level <b>".$totallvl."</b></p>";
		}	
	}
}

$target = isset($_POST['target'])? $_POST['target'] : array();
$tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
if(count($target) > 0) {
	include("Templates/Simulator/att_".$tribe.".tpl");
	echo "<table id=\"defender\" class=\"fill_in\" cellpadding=\"1\" cellspacing=\"1\">

	<thead>
		<tr>
			<th>
				Defender <span class=\"small\"></span>
			</th>
		</tr>
	</thead>";
	foreach($target as $tar) {
		include("Templates/Simulator/def_".$tar.".tpl");
	}
	include("Templates/Simulator/def_end.tpl");
	echo "<div class=\"clear\"></div>";
}
?>
<table id="select" cellpadding="1" cellspacing="1">
<thead><tr>
	<td>Attacker</td>
	<td>Defender</td>
	<td>Type of attack</td>
</tr></thead>
<tbody><tr>
	<td>
		<label><input class="radio" type="radio" name="a1_v" value="1" <?php if($tribe == 1) { echo "checked"; } ?>> Romans</label><br/>
		<label><input class="radio" type="radio" name="a1_v" value="2" <?php if($tribe == 2) { echo "checked"; } ?>> Teutons</label><br/>
		<label><input class="radio" type="radio" name="a1_v" value="3" <?php if($tribe == 3) { echo "checked"; } ?>> Gauls</label>
	</td><td>
		<label><input class="check" type="checkbox" name="a2_v1" value="1" <?php if(in_array(1,$target)) { echo "checked"; } ?>> Romans</label><br/>

		<label><input class="check" type="checkbox" name="a2_v2" value="1" <?php if(in_array(2,$target)) { echo "checked"; } ?>> Teutons</label><br/>
		<label><input class="check" type="checkbox" name="a2_v3" value="1" <?php if(in_array(3,$target)) { echo "checked"; } ?>> Gauls</label><br/>
		<label><input class="check" type="checkbox" name="a2_v4" value="1" <?php if(in_array(4,$target)) { echo "checked"; } ?>> Nature</label>
		</td><td>
		<label><input class="radio" type="radio" name="ktyp" value="0" <?php if($form->getValue('ktyp') == 0 || $form->getValue('ktyp') == "") { echo "checked"; } ?>> normal</label><br/>

		<label><input class="radio" type="radio" name="ktyp" value="1" <?php if($form->getValue('ktyp') == 1) { echo "checked"; } ?>> raid</label><br/>
		<label><input type="hidden" name="uid" value="<?php echo $session->uid; ?>"></label>
	</td>
</tr></tbody>
</table>
-rev. 0.3-
<p class="btn"><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></p>
</form>
</div>
<div id="side_info">
<?php
include("Templates/quest.tpl");
?>
</div>
<div class="clear"></div>
</div>
<div class="footer-stopper"></div>
<div class="clear"></div>

<?php 
include("Templates/footer.tpl"); 
include("Templates/res.tpl"); 
?>
<div id="stime">
<div id="ltime">
<div id="ltimeWrap">
Calculated in <b><?php
echo round(($generator->pageLoadTimeEnd()-$start)*1000);
?></b> ms
 
<br />Server time: <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>

<div id="ce"></div>
</body>
</html>