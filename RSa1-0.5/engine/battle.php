<?php
################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 #
## --------------------------------------------------------------------------- #
##  Filename       batlle.php                                                  #
##	Version        0.3                                                         #
##  Developed by:  scr1pt <scr1pt@2kdesign.es>                                 #
##  License:       GNU LGPL v.3                                                #
##  Site:          http://www.2kdesign.es                                      #
##  Copyright:     Kravian (c) 2009-2010. All rights reserved.                 #
##                                                                             #
################################################################################
class Battle {
	
	public function procSim($post) {
		global $form;
		// Recivimos el formulario y procesamos
		if(isset($post['a1_v']) && (isset($post['a2_v1']) || isset($post['a2_v2']) || isset($post['a2_v3']) || isset($post['a2_v4']))) {
				$_POST['mytribe'] = $post['a1_v'];
				$target = array();
				if(isset($post['a2_v1'])) {
					array_push($target,1);
				}
				if(isset($post['a2_v2'])) {
					array_push($target,2);
				}
				if(isset($post['a2_v3'])) {
					array_push($target,3);
				}
				if(isset($post['a2_v4'])) {
					array_push($target,4);
				}
				$_POST['target'] = $target;
				if(isset($post['a1_1'])) {
					$sum = $sum2 = 0;
					for($i=1;$i<=10;$i++) {
						$sum += $post['a1_'.$i];
					}
					if($sum > 0) {
						if($post['palast'] == "") {
							$post['palast'] = 0;
						}
						if(isset($post['wall1']) && $post['wall1'] == "") {
							$post['wall1'] = 0;
						}
						if(isset($post['wall2']) && $post['wall2'] == "") {
							$post['wall2'] = 0;
						}
						if(isset($post['wall3']) && $post['wall3'] == "") {
							$post['wall3'] = 0;
						}
						$post['tribe'] = $target[0];
						$_POST['result'] = $this->simulate($post);
						$form->valuearray = $post;
					}
				}
		}
	}
	
	private function simulate($post) {
		// Establecemos los arrays con las unidades del atacante y defensor
		$attacker = array('u1'=>0,'u2'=>0,'u3'=>0,'u4'=>0,'u5'=>0,'u6'=>0,'u7'=>0,'u8'=>0,'u9'=>0,'u10'=>0,'u11'=>0,'u12'=>0,'u13'=>0,'u14'=>0,'u15'=>0,'u16'=>0,'u17'=>0,'u18'=>0,'u19'=>0,'u20'=>0,'u21'=>0,'u22'=>0,'u23'=>0,'u24'=>0,'u25'=>0,'u26'=>0,'u27'=>0,'u28'=>0,'u29'=>0,'u30'=>0,'u31'=>0,'u32'=>0,'u33'=>0,'u34'=>0,'u35'=>0,'u36'=>0,'u37'=>0,'u38'=>0,'u39'=>0,'u40'=>0,'u41'=>0,'u42'=>0,'u43'=>0,'u44'=>0,'u45'=>0,'u46'=>0,'u47'=>0,'u48'=>0,'u49'=>0,'u50'=>0);
		$start = ($post['a1_v'] == 1)? 1 : (($post['a1_v'] == 2)? 11 : 21);
		$att_ab = array('a1'=>0,'a2'=>0,'a3'=>0,'a4'=>0,'a5'=>0,'a6'=>0,'a7'=>0,'a8'=>0);
		$def_ab = array('b1'=>0,'b2'=>0,'b3'=>0,'b4'=>0,'b5'=>0,'b6'=>0,'b7'=>0,'b8'=>0);
		$index = 1;
		for($i=$start;$i<=($start+9);$i++) {
			$attacker['u'.$i] = $post['a1_'.$index];
			if($index <=8) {
				$att_ab['a'.$index] = $post['f1_'.$index];
			}
			$index += 1;
		}
		$defender = array();
		for($i=1;$i<=50;$i++) {
			if(isset($post['a2_'.$i]) && $post['a2_'.$i] != "") {
				$defender['u'.$i] = $post['a2_'.$i];
			}
			else {
				$defender['u'.$i] = 0;
			}
		}
		$deftribe = $post['tribe'];
		$wall = 0;
		switch($deftribe) {
			case 1:
			for($i=1;$i<=8;$i++) {
				$def_ab['b'.$i] = $post['f2_'.$i];
			}
			$wall = $post['wall1'];
			break;
			case 2:
			for($i=11;$i<=18;$i++) {
				$def_ab['b'.$i] = $post['f2_'.$i];
			}
			$wall = $post['wall2'];
			break;
			case 3:
			for($i=21;$i<=28;$i++) {
				$def_ab['b'.$i] = $post['f2_'.$i];
			}
			$wall = $post['wall3'];
			break;
		}
		if($post['kata'] == "") {
			$post['kata'] = 0;
		}
		return $this->calculateBattle($attacker,$defender,$wall,$post['a1_v'],$deftribe,$post['palast'],$post['ew1'],$post['ew2'],$post['ktyp'],$def_ab,$att_ab,$post['kata'],1);
	}
	/*
	1: 1
2: 2
3: 2
4: 3
5: 4
6: 6
7: 8
8: 10
9: 12
10: 14
11: 17
12: 20
13: 23
14: 27
15: 31
16: 35
17: 39
18: 43
19: 48
20: 53*/
	//1 raid 0 normal
	function calculateBattle($Attacker,$Defender,$def_wall,$att_tribe,$def_tribe,$residence,$attpop,$defpop,$type,$def_ab,$att_ab,$tblevel,$stonemason) {
		global $bid34;
		//Definimos los array con las unidades
		$calvary = array(4,5,6,15,16,23,24,25,26);
		$catapult = array(8,18,28);
		$rams = array(7,17,27);		
		$catp = $ram = 0;
		// Array que devolveremos con el resultado del calculo
		$result = array();
		$involve = 0;
		$winner = false;
		// Ponemos a 0 todos los resultados parciales
		$cap = $ap = $dp = $cdp = $rap = $rdp = 0;
		
		//
		// Procedemos al calculo del total de puntos del Atacante
		//
		$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11: 21);
		$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20: 30);
		$abcount = 1;
		for($i=$start;$i<=$end;$i++) {
			global ${'u'.$i};
			if($abcount <= 8 && $att_ab['a'.$abcount] > 0) {
				if(in_array($i,$calvary)) {
					$cap+= $Attacker['u'.$i]*${'u'.$i}['atk']+ (($Attacker['u'.$i]*${'u'.$i}['atk'] + 300 * $Attacker['u'.$i]*${'u'.$i}['pop'] /7)*(1.007^$att_ab['a'.$abcount] - 1));
						}
				else {
					$ap += $Attacker['u'.$i]*${'u'.$i}['atk'] + (($Attacker['u'.$i]*${'u'.$i}['atk'] + 300 * $Attacker['u'.$i]*${'u'.$i}['pop'] /7) *(1.007^$att_ab['a'.$abcount] - 1));
				}
			}
			else {
				if(in_array($i,$calvary)) {
					$cap += $Attacker['u'.$i]*${'u'.$i}['atk'];
				}
				else {
					$ap += $Attacker['u'.$i]*${'u'.$i}['atk'];
				}
			}
			$abcount +=1;
			// Contamos los puntos de Ataque de las Catapultas
			if(in_array($i,$catapult)) {
				$catp += $Attacker['u'.$i];
			}
			// Contamos los puntos de Ataque de las Arietes
			if(in_array($i,$rams)) {
				$ram += $Attacker['u'.$i];
			}
			$involve += $Attacker['u'.$i]; 
		}
		
		//
		// Procedemos al calculo del total de puntos del Defensor
		//
		$start = ($def_tribe == 1)? 1 : (($def_tribe == 2)? 11: 21);
		$end = ($def_tribe == 1)? 10 : (($def_tribe == 2)? 20: 30);
		$abcount = 1;
		for($y=1;$y<=50;$y++) {
			global ${'u'.$y};
			if($y >= $start && $y <= ($end-2) && $def_ab['b'.$abcount] > 0) {
				$dp += $Defender['u'.$y]*${'u'.$y}['di']+(($Defender['u'.$y]*${'u'.$y}['di'] + 300 * $Defender['u'.$y]*${'u'.$y}['pop'] /7) * (1.007^$def_ab['b'.$y] -1));
				$cdp += $Defender['u'.$y]*${'u'.$y}['dc'] +(($Defender['u'.$y]*${'u'.$y}['dc'] + 300 * $Defender['u'.$y]*${'u'.$y}['pop'] /7) * (1.007^$def_ab['b'.$y] -1));
				$abcount +=1;
			}
			else {
				$dp += $Defender['u'.$y]*${'u'.$y}['di'];
				$cdp += $Defender['u'.$y]*${'u'.$y}['dc'];
			}
			$involve += $Defender['u'.$y]; 
		}
		
		//
		// Formula para el calculo del Bono Defensivo "Muralla" y "Residencia";
		//		
		if($def_wall > 0) {
			// Establecemos el factor de calculo para la "Muralla" dado el tipo de civilización
			// Factor = 1.030 Muralla Romana
			// Factor = 1.020 Muralla Germana
			// Factor = 1.025 Muralla Gala						
			$factor = ($def_tribe == 1)? 1.030 : (($def_tribe == 2)? 1.020 : 1.025);
			// Defensa Infanteria = Infanteria * Muralla(%)
			$dp *= ($factor^$def_wall);
			// Defensa Caballeria = Caballeria * Muralla (%)
			$cdp *= ($factor^$def_wall);
			
			// Calculo del Bono de Defensa Básico "Residencia" 
			$dp += (2*$residence^2) * $factor^$def_wall;
			$cdp += (2*$residence^2) * $factor^$def_wall;
		}
		else {
			// Calculo del Bono de Defensa Básico "Residencia" 			
			$dp += (2*$residence^2);
			$cdp += (2*$residence^2);
		}
		
		//
		// Formula para el calculo de Puntos Atacantes (Infanteria + Caballeria)
		//
		$rap = $ap+$cap;
		
		//
		// Formula para el calculo de Puntos Defensivos
		//
		$rdp = ($dp * ($ap/$rap)) + ($cdp * ($cap/$rap)) + 10;		
		//
		// Establece el ganador
		//
		$winner = ($rap > $rdp);
		$result[0] = ($winner)? "a" : "d";
		
		// Formula para el calculo de la Moral
		if($attpop > $defpop) {
			$moralbonus = pow($attpop / $defpop,(0.2*($rap/$rdp)));
		}
		else {
			$moralbonus = pow($attpop / $defpop,0.2);
		}
		if($involve >= 1000) {
			$Mfactor = round(2*(1.8592-pow($involve,0.015)),4);
		}
		else {
			$Mfactor = 1.5;
		}
		// Formula para el calculo de unidades perdidas
		// $type = 1 Atraco, 0 Normal
		if($type) {
			$holder = ($winner)? 100*(pow(($rdp/$rap*$moralbonus),$Mfactor)) : 100*(pow(($rap/$rdp*$moralbonus),$Mfactor));
			$result[1] = round(((100 * $holder /(100+$holder)))/100,2);
			$result[2] = (100 - ($result[1]*100))/100;
			$catp -= ($winner)? round($catp*$result[1]/100) : round($catp*$result[2]/100);	
		}
		else {
			// Atacante
			$result[1] = ($winner)? pow(($rdp/$rap*$moralbonus),$Mfactor) : "1";
			$result[1] = round($result[1],2);
			// Si ataca con Noble...
			$kings = ($att_tribe == 1)? $Attacker['u9'] : (($att_tribe == 2)? $Attacker['u19']: $Attacker['u29']);
			$aviables= $kings-round($kings*$result[1]);
			if ($aviables>0){
				switch($aviables){
				case 1:
				$fealthy = rand(20,30);
				break;
				case 2:
				$fealthy = rand(40,60);				
				break;
				case 3:
				$fealthy = rand(60,80);				
				break;
				case 4:
				$fealthy = rand(80,100);				
				break;
				default:
				$fealthy = 100;
				break;														
				}
				$result[9] = $fealthy;
			}
			
			// Defensor
			$result[2] = (!$winner)?  pow(($rap/$rdp*$moralbonus),$Mfactor) : "1";
			$result[2] = round($result[2],2);			
			$catp -= ($winner)? round($catp*$result[1]/100) : round($catp*$result[2]/100);
		
		}
		// Formula para el calculo de catapultas necesarias
		if($catp > 0 && $tblevel != 0) {
			$wctp = ($rap/$rdp)^1.5;
			$wctp = ($wctp >= 1)? 1-0.5/$wctp : 0.5*$wctp;
			$wctp *= $catp;
			
			//$need = round((($attpop / $defpop)^0.3 * ($tblevel^2 + $tblevel + 1) / (8 * (round(200 * 1.0205^$att_ab['a8'])/200) / (1 * $bid34[$stonemason]['attri']/100))) + 0.5);
			$need = round((pow(($attpop / $defpop),0.3) * (pow($tblevel,2) + $tblevel + 1) / (8 * (round(200 * pow(1.0205,$att_ab['a8']))/200) / (1 * $bid34[$stonemason]['attri']/100))) + 0.5);
			// Cantidad de Catapultas para derribar el edificio
			$result[3] = $need;
			// Cantidad de Catapultas que actuan
			$result[4] = $wctp;
		}
		
		$result[6] = pow($rap/$rdp*$moralbonus,$Mfactor);		
		print_r($result);
		return $result;
	}
	
};

$battle = new Battle;
?>