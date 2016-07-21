<?php
include 'conexion.php';

session_start();
//PUT THIS HEADER ON TOP OF EACH UNIQUE PAGE
if(!isset($_SESSION['username'])){
  header("location:main_login.php");
}
// sacando el id del semestre 
 $string_sql_semestre = " select codigo from semestre where estado = 'ACTIVO' " ;
 $data_semestre =  pg_query($connect ,$string_sql_semestre );
 $id_semestre = pg_fetch_result($data_semestre, 0);
// comentar esto             
 
// registro del docente primero 
  $fecha_nacimiento = $_POST['fecha_anio_nac'].'-'.$_POST['fecha_mes_nac'].'-'.$_POST['fecha_dia_nac'];
  $ruc = $_POST['ruc'];
  $direccion = $_POST['direccion'];
  $distrito = $_POST['distrito'];
  $departamento = $_POST['departamento'];
  $telefono = $_POST['telefono'];
  $provincia = $_POST['provincia'];
  $tipo_docente = ( strlen($_POST['tipo_docente']) == 0 ) ? 'invitado':'unprg';
 

  $query_docente = "INSERT INTO docente(fecha_nacimiento, ruc, direccion, distrito, departamento, telefono, 
              id_persona, id_semestre, estado, tipo, provincia)
              VALUES ('". $fecha_nacimiento ."', '". $ruc ."', '". $direccion ."','". $distrito ."', 
                    '". $departamento ."', '". $telefono ."', 
              ". $_SESSION['clave'].", ". $id_semestre .", 1 , '". $tipo_docente ."' , '" . $provincia . "') RETURNING id_docente";

  $id_docente_x = pg_query($connect, $query_docente);
  if($row =  pg_fetch_array($id_docente_x)){
          $id_Docente= $row['id_docente'];
  }

// registro de formacion academica


  $data_formacion = "";
  foreach ($_POST['tipo_forma'] as $key => $value ){
    $tipo_forma = $_POST['tipo_forma'][$key];
    $grado_forma = $_POST['grado_forma'][$key];
    if( $_POST['fecha_inicio_forma'][$key] ){
      $fecha_inicio_forma = $_POST['fecha_inicio_forma'][$key]."-1";    
    }else { $fecha_inicio_forma = "1000-01-1"; }
    if( $_POST['fecha_fin_forma'][$key]){
      $fecha_fin_forma = $_POST['fecha_fin_forma'][$key]."-1";    
    }else { $fecha_fin_forma = "1000-01-1"; }
    
    $universidad = $_POST['universidad_forma'][$key];
    $data_formacion .="(".$id_Docente.",
                      '". $grado_forma ."',
                      '". $fecha_inicio_forma."',
                      '". $fecha_fin_forma ."',
                      '". $universidad."',
                      '". $tipo_forma ."'),";     
  }
  if ($data_formacion != ""){
    $query_formacion_academica = "INSERT INTO formacionacademica(
                id_docente, 
                gradotitulo, 
                fecha_ini, 
                fecha_fin,
                universidad,
                tipo_grado)  VALUES";
    $qry_forma = substr($query_formacion_academica.$data_formacion, 0, -1);
    pg_query($connect, $qry_forma);  
    die($qry_forma);
  }


// agregar doctorado 
  $data_doctorado = "";
  foreach ( $_POST['tipo_doc'] as $key => $value ){
    $grado_md = $_POST['grado_doc'][$key];
    $tipo_md = $_POST['tipo_doc'][$key];
    $duracion_md = $_POST['duracion_doc'][$key];
    $universidad_md = $_POST['universidad_doc'][$key];
    $data_doctorado .="(". $id_Docente .",
                        '". $grado_md ."',
                        '". $duracion_md ."',
                        '". $universidad_md ."',
                        '". $tipo_md. "'),";
  }
  if ($data_doctorado != "" ){
    $query_md = "INSERT INTO maestriadoctor(
                id_docente, 
                grado, 
                duracion, 
                universidad,
                tipo_md)
              VALUES";
    $qry_md = substr($query_md.$data_doctorado, 0, -1);
    pg_query($connect, $qry_md);  
  }



//regisro experiencia de docente 
  $data_exp = "";
  foreach ($_POST['asig_exp'] as $key => $value) {
      $inst_exp = $_POST['inst_exp'][$key];
      $asig_exp = $_POST['asig_exp'][$key];
      if( $_POST['fecha_inicio_exp'][$key] ){
        $fecha_inicio_exp = $_POST['fecha_inicio_exp'][$key]."-1";       
      }else { $fecha_inicio_exp = '1000-1-1'; }
      if ( $_POST['fecha_fin_exp'][$key]){
      $fecha_fin_exp = $_POST['fecha_fin_exp'][$key]."-1";       
      }else { $fecha_fin_exp = '1000-1-1'; }
      $data_exp .="(".$id_Docente.",
                    '".$inst_exp."',
                    '".$asig_exp."', 
                    '".$fecha_inicio_exp."',
                    '".$fecha_fin_exp."'),";

  }
  if ($data_exp != ""){
    
    $query_exp = "INSERT INTO experienciadocente(
                id_docente, 
                institucion, 
                asignatura, 
                fecha_ini, 
                fecha_fin)  VALUES";
                
    $qry_exp = substr($query_exp.$data_exp, 0, -1);
    pg_query($connect, $qry_exp);
    
  }




// registo de idioma

  $data_idioma = "";
  foreach ($_POST['name_idioma'] as $key => $value) {
      $name_idioma = $_POST['name_idioma'][$key];
      $nivel_idioma = $_POST['nivel_idioma'][$key];
      if($_POST['fecha_inicio_idioma'][$key]){
      $fecha_inicio_idioma = $_POST['fecha_inicio_idioma'][$key]."-1";       
      }else{ $fecha_inicio_idioma = '1000-1-1';}
      if($_POST['fecha_fin_idioma'][$key]){
      $fecha_fin_idioma = $_POST['fecha_fin_idioma'][$key]."-1";       
      }else { $fecha_fin_idioma = '1000-1-1';}
      $data_idioma .="(".$id_Docente.",'".$name_idioma."','".$nivel_idioma."', '".$fecha_inicio_idioma."','".$fecha_fin_idioma."'),";

  }
  if ($data_idioma != ""){
    $query_string = "INSERT INTO conocimientosidiomas(
                  id_docente, idioma, nivel, fecha_ini, fecha_fin)
            VALUES";
    $qry = substr($query_string.$data_idioma, 0, -1);
    pg_query($connect, $qry);
    
  }


// registro de conocimientos informaticos 
  $data_ci = "";
  foreach ($_POST['nivel_info'] as $key => $value) {
      $name_info = $_POST['name_info'][$key];
      $nivel_info = substr($_POST['nivel_info'][$key],0,2);
      if($_POST['fecha_inicio_info'][$key]){
      $fecha_inicio_info = $_POST['fecha_inicio_info'][$key]."-1";       
      }else{ $fecha_inicio_info = '1000-1-1';}
      if($_POST['fecha_fin_info'][$key] ){
      $fecha_fin_info = $_POST['fecha_fin_info'][$key]."-1";
      }else{ $fecha_fin_info = '1000-1-1';}
      $data_ci .="(".$id_Docente.",
                    '".$name_info."',
                    '".$nivel_info."', 
                    '".$fecha_inicio_info."',
                    '".$fecha_fin_info."'),";

  }
  if ($data_ci != ""){
    $query_ci = "INSERT INTO conocimientosinfor(
                id_docente, 
                curso_tem,
                nivel,
                fecha_ini,
                fecha_fin)   VALUES";
                
    $qry_ci = substr($query_ci.$data_ci, 0, -1);
    pg_query($connect, $qry_ci);
    
  }


// registro de capacitaciones 

  $data_cap = "";
  foreach ($_POST['name_capa'] as $key => $value) {
      $name_capa = $_POST['name_capa'][$key];
      $inst_capa = $_POST['inst_capa'][$key];
      if($_POST['fecha_inicio_capa'][$key]){
      $fecha_inicio_capa = $_POST['fecha_inicio_capa'][$key]."-1";       
      }else { $fecha_inicio_capa = '1000-1-1';}
      if( $_POST['fecha_fin_capa'][$key] ){
      $fecha_fin_capa = $_POST['fecha_fin_capa'][$key]."-1";       
      }else{ $fecha_fin_capa = '1000-1-1';}
      $data_cap .="(".$id_Docente.",
                    '".$name_capa."',
                    '".$inst_capa."', 
                    '".$fecha_inicio_capa."',
                    '".$fecha_fin_capa."'),";

  }
  if ($data_cap != ""){
    $query_capa = "INSERT INTO capacitacion(
                id_docente, 
                descripcion, 
                institucion, 
                fecha_ini, 
                fecha_fin) VALUES";
                
    $qry_capa = substr($query_capa.$data_cap, 0, -1);
    pg_query($connect, $qry_capa);
    
  }



// registro de  otros datos de interes


 
  $data_otro = "";
  foreach ($_POST['name_otro'] as $key => $value) {
      $name_otro = $_POST['name_otro'][$key];
      $data_otro .="('".$name_otro."',
                    ".$id_Docente."),";

  }

  if($data_otro != ""){
    $query_otro = "INSERT INTO otro_dato(            
                descripcion, 
                id_docente) VALUES";
                
    $qry_otro = substr($query_otro.$data_otro, 0, -1);
    pg_query($connect, $qry_otro);
    
  }


  
header("location:index.php?dato=" . $_SESSION['clave']);   

?>

