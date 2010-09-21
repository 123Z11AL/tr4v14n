<?php
class foro{

	  var $id;
	  var $db;
	  var $lastError = '';

  /**
   *  Constructor de la clase
   *  @param string $con (instancia de la conexion a la BD )
   *  @return void    
   *  	   
  */ 
  
	function foro($con){
    
    $this->db = $con;
  }
  
	 /**
   *  Devuelve todos los temas del foro
   *  @param int $id (id del tema_foro )
   *  @return array (todos los temas del foro)
   *  @return string (cabecera del tema del foro)
   */ 
  
  function detalle_temas($id=-1,$ret=0){
  	
  	if ( $id != -1)
			$condicion = "where id =".$id;
		else
			$condicion = "";
			
		$sql = sprintf("select id,descripcion,nombre,habilitado,tema_foro.fecha_alta from tema_foro %s order by id ",$condicion);
		$res = $this->db->select($sql);
		foreach ($res as $key=>$valor){
			$res[$key]['cantidad_hilos_temas']=$this->cantidad_hilos_temas($valor['id']);
		}
		if ($ret == 0){	
			return $res;
		}else{
				$value = $res[0];
				$html = "\t<table border='1'>\n";
				$html .= "\t<tr>\n";
				$html .="\t\t<td>".$value['nombre']."</td>\n";
				$html .= "\t</tr>\n";				
				$html .= "\t<tr>\n";
				$html .="\t\t<td>".$value['descripcion']."</td>\n";
				$html .= "\t</tr>\n";	
				$html .= "\t<tr>\n";
				$html .="\t\t<td style='text-align:right'> Fecha de inicio: ".$value['fecha_alta']."</td>\n";
				$html .= "\t</tr>\n";
				$html .="\t</table>\n";	
				echo $html;		
		}		
	}
	
  /**
   *  Devuelve un detalle general agrupado por temas y los hilos 
   *  correspondientes a esos temas 
   *     
   */ 
  
  function detalle_general(){
	
		$res =  $this->detalle_temas();
		$html = "";
		foreach ($res as $key=>$value) {
			$res_hilo = $this->datos_foro_tema($value['id']);
			if ($value['cantidad_hilos_temas']>0)	{
				$html .= "\t<table border=1>\n";
				
				$html .= "\t<tr>\n";
				$html .="\t\t<td colspan=6 style='text-align:right'><a href='insert_hilo.php?id=".$value['id']."'>Agregar un nuevo hilo</td>\n";
				$html .= "\t</tr>\n";				
				
				$html .= "\t<tr>\n";
				$html .="\t\t<th colspan=2 width=40%>".$value['nombre']."</th>\n";
				$html .="\t\t<th>Fecha de inicio</th>\n";
				$html .="\t\t<th>Mensajes</th>\n";
				$html .="\t\t<th>Le&iacute;do</th>\n";
				$html .="\t\t<th>&Uacute;ltimo mensaje</th>\n";
				$html .="\t</tr>\n";
					for ($i=0;$i<count($res_hilo);$i++){
						$sql_aux = sprintf("select max(hilo_respuestas.fecha_alta) as ultimo
										from hilo_respuestas
										where hilo_respuestas.id_hilo= %d ",$res_hilo[$i]['id']);
						$res_fecha = $this->db->select($sql_aux);	
						$html .= "\t<tr>\n";					
						$html .="\t\t<td><a href='detalle.php?id=".$res_hilo[$i]['id']."'>".$res_hilo[$i]['titulo']."</a></td>\n";
						$html .="\t\t<td>".$res_hilo[$i]['descripcion']."</td>\n";
						$html .="\t\t<td>".$res_hilo[$i]['fecha_alta']."</td>\n";
						$html .="\t\t<td align=center>".$this->cantidad_mensajes_hilo($res_hilo[$i]['id'])."</td>\n";
						$html .="\t\t<td align=center>".$res_hilo[$i]['leido']."</td>\n";
						$html .="\t\t<td>".$res_fecha[0]['ultimo']."</td>\n";
						$html .="\t</tr>\n";
					}
				$html .="\t</table>\n";
				$html .="\t<br>\n";
			}else{
				$html .= "\t<table border=1>\n";
				$html .= "\t<tr>\n";
				$html .="\t\t<th colspan=6>".$value['nombre']."  -  No posee hilos</th>\n";
				$html .= "\t</tr>\n";
				$html .= "\t<tr>\n";
				$html .="\t\t<td colspan=6 style='text-align:right'><a href='insert_hilo.php?id=".$value['id']."'>Agregar un nuevo hilo</td>\n";
				$html .= "\t</tr>\n";						
				$html .="\t</table>\n";
			
			}
	  }
    echo $html; 
	}
	
	/**
	 *	Devuelve el detalle del foro/hilo con sus respectivos mensajes 
	 *	@param int $id (id del hilo )	 
	 *
	 */
	 	 	 	 	
	function detalle_foro($id,$n = 0){
	
		$res = $this->datos_foro($id);
		$html = "";
		$html .= "\t<table border=1>\n";
		$html .= "\t<tr>\n";
		$html .="\t\t<td width=60% colspan=2><strong>".$res[0]['titulo']."</strong></td>\n";
		$html .="\t\t<td><strong>Fecha de inicio: ".$res[0]['fecha_alta']."</strong></td>\n";
		$html .="\t</tr>\n";
		$html .= "\t<tr>\n";
		$html .="\t\t<td><strong>".$res[0]['descripcion']."</strong></td>\n";
		$html .="\t\t<td><strong>Le&iacute;do: ".$res[0]['leido']."</strong></td>\n";
		$html .="\t\t<td><strong>Cantidad de mensajes: ".$res[0]['cantidad_mensajes_hilo']."</strong></td>\n";
		$html .="\t</tr>\n";		
		$sql_aux = sprintf("select usuarios.usuario,usuarios.id as id_usuario,hilo_respuestas.id, 
							hilo_respuestas.texto,hilo_respuestas.titulo,
							hilo_respuestas.fecha_alta,habilitado
							from hilo_respuestas,usuarios
							where
							usuarios.id=hilo_respuestas.id_usuario and
							hilo_respuestas.id_hilo= %d order by hilo_respuestas.id",$id) ;
		$res_hilo_respuestas = $this->db->select($sql_aux);
		if (is_array($res_hilo_respuestas)){
		$html .= "\t<tr>\n";
		$html .="\t\t<td colspan=3>\n";
		if ($n == 0){
		foreach ($res_hilo_respuestas as $key=>$valor){
			$html .= "\t\t\t<table border=1>\n";
			$html .= "\t\t\t<tr>\n";
			$html .="\t\t\t\t<td colspan=2>Fecha del mensaje: ".$valor['fecha_alta']."</td>\n";	
			$html .= "\t\t\t</tr>\n";
			$html .= "\t\t\t<tr>\n";
			$html .="\t\t\t\t<td width=10%>Usuario: ".$valor['usuario']."</td>\n";					
			$html .="\t\t\t\t<td>[ Comentarios realizados: ".$this->cantidad_mensajes_usuario($valor['id_usuario'])." ]</td>\n";
			$html .="\t\t\t</tr>\n";
			$html .= "\t\t\t<tr>\n";
			$html .="\t\t\t\t<td colspan=2>".$valor['titulo']."</td>\n";	
			$html .= "\t\t\t</tr>\n";
			$html .= "\t\t\t<tr>\n";			
			$html .="\t\t\t\t<td colspan=2>".nl2br($valor['texto'])."</td>\n";	
			$html .= "\t\t\t</tr>\n";
			$html .="\t\t\t</table>\n";	
		}}/**/
		$html .="\t</td>\n";
		$html .= "\t</tr>\n";		
		$html .="\t</table>\n";
		}
    echo $html; 
	}
	
		/**
	 *	Devuelve el detalle del foro/hilo  
	 *	parametros : el id del hilo
	 *	@param int $id (id del hilo )		 
	 *
	 */
	 	 	 	 	
	function datos_foro($id =-1){
	
	 	if ( $id != -1)
			$condicion = "and hilo.id =".$id;
		else
			$condicion = "";
		
		$sql = sprintf("select hilo.id_tema_foro,hilo.id,hilo.titulo,hilo.usuario_alta,hilo.descripcion,
						hilo.id_estado_foro,
						hilo.leido,fecha_alta,
						usuarios.usuario
						from hilo,usuarios
						where hilo.usuario_alta=usuarios.id %s order by id ",$condicion );
		$res = $this->db->select($sql);
		if (isset($res[0]['id']))
			$res[0]['cantidad_mensajes_hilo']=$this->cantidad_mensajes_hilo($res[0]['id']);
	  return $res; 
	}
	
		/**
	 *	Devuelve los hilos que correspondan a el tema pasado  
	 *	parametros : el id del hilo
	 *	@param int $id (id del hilo )		 
	 *
	 */
	 	 	 	 	
	function datos_foro_tema($id = -1){
	
	 	if ( $id != -1)
			$condicion = "and hilo.id_tema_foro = ".$id;
		else
			$condicion = "";	
	
		$sql = sprintf("select hilo.id,hilo.titulo,hilo.descripcion,hilo.leido, 
									hilo.fecha_alta	
									from hilo,tema_foro
									where hilo.id_tema_foro= tema_foro.id %s order by hilo.id ",$condicion );
		$res = $this->db->select($sql);
		if (isset($res[0]['id']))
			$res[0]['cantidad_mensajes_hilo']=$this->cantidad_mensajes_hilo($res[0]['id']);
	  return $res; 
	}	
	
	/**
	 *	Incrementa la cantidad de veces que fue leido el hilo 
	 *	parametros : el id del hilo a incrementar
	 *	@param int $id (id del hilo )		 
	 *
	 */
	 	 	 	
	function inc_leido($id){
	
		$sql = sprintf("update hilo set leido = leido + 1 where id = %d",$id );
		$res = $this->db->query($sql); 
		if ($res)
      return true;
    else{
      $this->lastError = "No se ha podido incrementar el campo leido";
      return false;        
    }
	}
	
		/**
	 *	Devuelve la cantidad de hilos correspondientes a ese tema
	 *	parametros : el id del tema
	 *	@param int $id (id del tema )		 
	 */
	 
	 function cantidad_hilos_temas($id){
	 
	 	 $sql = sprintf("select count(id) as cantidad from hilo where 
											hilo.id_tema_foro = %d ",$id);
		 $res = $this->db->select($sql);
		 return $res[0]['cantidad']; 					
						
	 } 
	
	/**
	 *	Devuelve la cantidad de mensajes que ha escrito un usuario
	 *	parametros : el id del usuario
	 *	@param int $id (id del usuario )	 
	 */
	 
	 function cantidad_mensajes_usuario($id_usuario){
	 
	 	 $sql = sprintf("select count(id) as cantidad from hilo_respuestas
						where hilo_respuestas.id_usuario= %d ",$id_usuario);
		 $res = $this->db->select($sql);
		 return $res[0]['cantidad']; 					
						
	 } 	 
	 
	/**
	 *	Devuelve la cantidad de mensajes que hay en un determinado hilo 
	 *	parametros : el id del hilo
	 *	@param int $id (id del hilo )	 
	 *		 
	 */
	 
	 function cantidad_mensajes_hilo($id_hilo){
	 	 
	 	 $sql = sprintf("select count(id) as cantidad
						from hilo_respuestas
						where hilo_respuestas.habilitado = 1 and hilo_respuestas.id_hilo = %d ",$id_hilo);
		 $res = $this->db->select($sql);
		 return $res[0]['cantidad']; 					
						
	 } 	 	 	
	 
	 	/**
	 *	Agrega un comentario a un determinado hilo 
	 *	parametros : array de datos 
	 *	@param array 	 
	 */
	 
	 function agregar_comentario($array){
	   
		 $titulo = $array['titulo'];
		 $texto = $array['texto'];
		 $id_usuario= $array['id_usuario'];
		 $id_hilo = $array['id_hilo'];
		 
		 $sql = sprintf("insert into hilo_respuestas(id_usuario,titulo,texto,id_hilo)
						 				values(%d,'%s','%s',%d)",	$id_usuario,$titulo,$texto,$id_hilo);	 
		 $res = $this->db->query($sql); 
		 if ($res)
       return true;
     else{
       $this->lastError = "No se ha podido ingresar el nuevo comentario";
       return false;        
    }				 	

	 }	
	 
	 	/**
	 *	Agrega un  hilo 
	 *	parametros : array de datos 
	 *	@param array 	 
	 */
	 
	 function agregar_hilo($array){
	   
		 $titulo = $array['titulo'];
		 $descripcion = $array['descripcion'];
		 $usuario_alta = $array['id_usuario'];
		 $id_tema_foro= $array['id_tema_foro'];
		 
		 $sql = sprintf("insert into hilo(usuario_alta,titulo,descripcion,id_tema_foro)
						 				values(%d,'%s','%s',%d)",	$usuario_alta,$titulo,$descripcion,$id_tema_foro);	 
		 $res = $this->db->query($sql); 
		 if ($res)
       return true;
     else{
       $this->lastError = "No se ha podido ingresar el nuevo hilo";
       return false;        
    }				 	

	 }		 

   /**
   *  Ultimo error reportado.
   *  return void()   
   *
   */        
	 function getLastError(){
	 
	   return $this->lastError;
	 } 
	 
  }
?>
