<?php

class Units {
	public $sending,$recieving,$return = array();
	
	public function procUnits($post) {
		if(isset($post['c'])) {
			switch($post['c']) {
				case "3":
				if (isset($post['a'])&& $post['a']==533374){
				$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				break;				
				case "4":
				if (isset($post['a'])&& $post['a']==533374){
				$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				break;
				case "5":
				if (isset($post['a'])&& $post['a']==533374){
				$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
			}
		}
	}
	private function loadUnits($post) {
		global $database,$village,$session,$generator,$logging,$form;
				// Busqueda por nombre de pueblo
				// Confirmamos y buscamos las coordenadas por nombre de pueblo
				if(	!$post['t1'] && !$post['t2'] && !$post['t3'] && !$post['t4'] && !$post['t5'] && 
					!$post['t6'] && !$post['t7'] && !$post['t8'] && !$post['t9'] && !$post['t10']){
				$form->addError("error",MIN_1_TROOP);				
				}				
				
				if(!$post['dname'] && !$post['x'] && !$post['y']){
				$form->addError("error",INSERT_NAME_OR_COOR);				
				}
				if(isset($post['dname']) && $post['dname'] != "") {
					$id = $database->getVillageByName($post['dname']);
					if (!isset($id)){				
					$form->addError("error",VILLAGE_NOT_EXIST);
					}else{
					$coor = $database->getCoor($id);
					}
				}
				// Busqueda por coordenadas de pueblo
				// Confirmamos y buscamos las coordenadas por coordenadas de pueblo				
				if(isset($post['x']) && isset($post['y']) && $post['x'] != "" && $post['y'] != "") {
					$coor = array('x'=>$post['x'], 'y'=>$post['y']);
					$id = $generator->getBaseID($coor['x'],$coor['y']);
					if (!$database->getVillageState($id)){
						$form->addError("error",ATACK_2_COOR_NOT_EXIST);
					}
				}			
				// Procesamos el array con los errores dados en el formulario
				if($form->returnErrors() > 0) {
					$_SESSION['errorarray'] = $form->getErrors();
					$_SESSION['valuearray'] = $_POST;
					header("Location: a2b.php");		
				}else{				
				// Debemos devolver un array con $post, que contiene todos los datos mas 
				// otra variable que definira que el flag esta levantado y se va a enviar y el tipo de envio
				$villageName = $database->getVillageField($id,'name');
				$villageOwner = $database->getVillageField($id,'owner');
				
				// Calculo de la unidad mas lenta
				$tribe = $session->tribe;
				$start = ($tribe == 1)? 1 : (($tribe == 2)? 11: 21);				
				for($i=$start;$i<=($start+9); $i++) {
					global ${'u'.$i};
					if($post['t'.$i]>0) {
						// Array Con todos los tiempos de desplazamiento de cada una de las unidades que actuan
						$arrayUnitsSpeed[$i] = ${'u'.$i}['speed'];
					}
				}
				// Devolvemos el valor mas bajo del array (la unidad mas lenta)
				//$speed = min(array_values($arrayUnitsSpeed));
				$speed = 250;
				$timeTaken = $generator->procDistanceTime($coor,$village->coor,$speed,1);								
				// Completamos el array que devolvemos con algunos datos mas.
				$post ['id'] = $id;
				$post ['villageName'] = $villageName;
				$post ['villageOwner'] = $villageOwner;
				$post ['speed'] = $timeTaken;												
				//print_r($post);
				return $post;
			}	
	
	}
	private function sendTroops($post) {
		global $form, $database, $village, $session, $generator;
		if (BATTLE_OPEN){
			// Filtramos $post
			if(	!$post['t1'] && !$post['t2'] && !$post['t3'] && !$post['t4'] && !$post['t5'] && 
				!$post['t6'] && !$post['t7'] && !$post['t8'] && !$post['t9'] && !$post['t10']){
				$form->addError("error",MIN_1_TROOP);				
			}		
			if(!$post['id']){
				$form->addError("error",NO_SE_HA_ESTABLECIDO_DESTINO);				
			}
			if(!$post['c']){
				$form->addError("error",NO_SE_HA_ESTABLECIDO_ACCION);				
			}					
			if($form->returnErrors() > 0) {
				$_SESSION['errorarray'] = $form->getErrors();
				$_SESSION['valuearray'] = $_POST;
				header("Location: a2b.php");
			}		
			// Cargamos las unidades del atacante y comparamos
			// Primero cargamos un array con todas las unidades que disponemos
			$myUnitArray = $village->unitarray;
			$start = ($session->tribe == 1)? 1 : (($session->tribe == 2)? 11 : 21);
			$index = 1;
			for($i=$start;$i<=($start+9);$i++) {
				if($index <=10) {				
					if ($myUnitArray['u'.$i]<$post['t'.$index]){
						$form->addError("error",NO_DISPONES_DE_TROPAS_SUFICIENTES);
					}					
				}
				$index += 1;
			}
			// Ahora Comprobamos si el destino existe
			if(!$database->getVillageState($post['id'])){
				$form->addError("error",VILLAGE_NOT_EXIST);
			}
			// Parseamos los errores en caso de haberlos
			if($form->returnErrors() > 0) {
				$_SESSION['errorarray'] = $form->getErrors();
				$_SESSION['valuearray'] = $_POST;
				header("Location: a2b.php");
			}			
			//
			// Calculamos los datos necesarios y añadimos el movimiento
			//
			
			// Calculo de la unidad mas lenta
			$start = ($session->tribe == 1)? 1 : (($session->tribe == 2)? 11: 21);				
			for($i=$start;$i<=($start+9); $i++) {
				global ${'u'.$i};
				if($post['t'.$i]>0) {
					// Array Con todos los tiempos de desplazamiento de cada una de las unidades que actuan
					$arrayUnitsSpeed[$i] = ${'u'.$i}['speed'];
				}
			}
			// Devolvemos el valor mas bajo del array (la unidad mas lenta)
			//$speed = min(array_values($arrayUnitsSpeed));
			$speed = 250;
			$coor = $database->getCoor($post[id]);
			$timeTaken = $generator->procDistanceTime($coor,$village->coor,$speed,1);			
						
			// Ejecutamos el movimiento
			$reference = $database->sendTroops($post[t1],$post[t2],$post[t3],$post[t4],$post[t5],$post[t6],$post[t7],$post[t8],$post[t9],$post[t10],$village->wid,$post[id],$session->tribe, 0);			
			$database->addMovement($post[c],$village->wid,$post[id],$reference,time()+$timeTaken); 
			
			// Y restamos las unidades, no es la mejor manera, pero es para probar
			$tribeStart = ($session->tribe == 1)? 1 : (($session->tribe == 2)? 11: 21);						
			$i = $tribeStart;
			$database->modifyUnit($village->wid,$i,$post[t1],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t2],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t3],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t4],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t5],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t6],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t7],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t8],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t9],0);
			$i++;
			$database->modifyUnit($village->wid,$i,$post[t0],0);																														
		
		}else{
			$form->addError("error",BATTLE_SYSTEM_IS_OFF);
		}
		if($form->returnErrors() > 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $_POST;
			header("Location: a2b.php");
		}			
	}		
};

$units = new Units;
?>