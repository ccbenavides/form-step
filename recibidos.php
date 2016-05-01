<?php
include 'conexion.php';
/*$nombre= $_POST['nombres'];
$apellido_paterno= $_POST['apellido_paterno'];
$apellido_materno= $_POST['apellido_materno'];
$dni= $_POST['dni'];
$ruc= $_POST['ruc'];
$direccion= $_POST['direccion'];
$email= $_POST['email'];

echo $nombre . $apellido_paterno . $apellido_materno . $dni . $ruc . $direccion . $email ;

$bandera = pg_query($connect, "    INSERT INTO persona(
      nombre_per, apepat_per, apemat_per, email, id_asignatura, usuario,
      clave, dni)
      VALUES ('$nombre', '$apellido_paterno', '$apellido_materno', '$email', 1, 'gdfgd',
      'sfsr', '$dni');");
  */
/*  $name_idioma[] = json_decode($_POST['name_idioma']);
  $nivel_idioma[] =json_decode($_POST['nivel_idioma']);
  $fecha_inicio_idioma[] = json_decode($_POST['fecha_inicio_idioma']);
  $fecha_fin_idioma[] = json_decode($_POST['fecha_fin_idioma']);
*/
//  print_r($_POST['name_idioma']);
// echo $_POST['name_idioma'][0];
//echo $_POST['nombres'];
//  echo $_POST("name_idioma")[0];

$id_Docente = 1;
$data_idioma = "";
foreach ($_POST['name_idioma'] as $key => $value) {

    echo $_POST['name_idioma'][$key];
     $name_idioma = $_POST['name_idioma'][$key];
     $nivel_idioma = $_POST['nivel_idioma'][$key];
     $fecha_inicio_idioma = $_POST['fecha_inicio_idioma'][$key]."-1";
     $fecha_fin_idioma = $_POST['fecha_fin_idioma'][$key]."-1";
     $data_idioma .="(".$id_Docente.",'".$name_idioma."','".$nivel_idioma."', '".$fecha_inicio_idioma."','".$fecha_fin_idioma."'),";

}

$query_string = "INSERT INTO conocimientosidiomas(
               id_docente, idioma, nivel, fecha_ini, fecha_fin)
         VALUES";
$qry = substr($query_string.$data_idioma, 0, -1);
echo $qry;
pg_query($connect, $qry);
?>
