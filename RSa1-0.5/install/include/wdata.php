<?php
/*******wdata.php********
-- Consist of world data generation for travian clone
-- Revision: Beta 4
-- Author: akakori
-- Homepage: -
-- Beta Server: -
-- Please do not remove this section
-- WARNING: DO NOT EDIT THIS UNLESS YOU KNOW WHAT YOU ARE DOING!!
************************/
include("database.php");
$seperator = 3;
$sepcounter = 4;
$max = pow(WORLD_MAX*2+1,2);
$b7 = $b8 = $b9 = round($max/100*3);
$b6 = $b1 = round($max/100*1);
$b2 = $b4 = $b5 = $b11 = $b10 =  $b12 = round($max/100*8);
$o = round($max/100*10);
$b3 = $max - $b1 - $b2 - $b4 - $b5 - $b6 - $b7 - $b8 - $b9 - $b10 - $b11 - $b12 - $o;
function randomizer() {
	global $b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9,$b10,$b11,$b12,$o,$sepcounter,$seperator;
	$type = round(rand(0,13));
	if($sepcounter > 0) {
			$new = round(rand(1,12));
			$sepcounter -= 1;
			$tdata = 'b'.$new;
			if ($$tdata > 0) {
				$$tdata -= 1;
			return array($new,0,'t'.round(rand(0,9)));
			}
			else {
				$arraymore = array(2,4,5,11,10,12);
				$index = round(rand(0,5));
				$ndata = 'b'.$arraymore[$index];
				if($$ndata > 0) {
					$$ndata -= 1;
					return array($arraymore[$index],0,'t'.round(rand(0,9)));
				   }
				   else {
					$b3 -= 1;
					return array(3,0,'t'.round(rand(0,9)));
				   }
			}
	}
	else {
		switch($type) {
			case 0:
			case 13:
			$sepcounter = $seperator;
			$otype = round(rand(1,12));
			if($o > 0) {
			$o -= 1;
			return array(0,$otype,'o'.$otype);
			}
			else {
				return randomizer($sepcounter);
			}
			break;
			default:
			if ($sepcounter > 0) {
				$sepcounter -= 1;
			}
			$tdata = 'b'.$type;
			if ($$tdata > 0) {
				$$tdata -= 1;
			return array($type,0,'t'.round(rand(0,9)));
			}
			else {
				$arraymore = array(2,4,5,11,10,12);
				$index = round(rand(0,5));
				$ndata = 'b'.$arraymore[$index];
				if($$ndata > 0) {
					$$ndata -= 1;
					return array($arraymore[$index],0,'t'.round(rand(0,9)));
				   }
				   else {
					$b3 -= 1;
					return array(3,0,'t'.round(rand(0,9)));
				   }
			}
		}
	}
}
$y = WORLD_MAX;
$counter = 0;
$base = "INSERT into ".TB_PREFIX."wdata values ";
$q = $base;
for($i=-WORLD_MAX;$i<=WORLD_MAX; $i++) {
	$darray = randomizer();
	$type = $darray[0];
	$optype = $darray[1];
	$image = $darray[2];
	$q .= "(0,$type,$optype,'$i','$y',0,'$image')";
	if($i == WORLD_MAX) {
		$y-=1;
		$i = -WORLD_MAX-1;
	}
	else if ($y == (-WORLD_MAX-1)) {
		header("Location: ../index.php?s=4");
		exit;
	}
	$counter += 1;
	if($counter == 100 || $max < 100) {
		$q .= ";\n";
		if(!$database->query($q)) {
			header("Location: ../index.php?s=3&c=1");
		}
	$q = $base;
	$counter = 0;
	$max -= 100;
	}
	else {
		$q .= ",";
	}
}
?>