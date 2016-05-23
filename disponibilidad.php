<?php
    include 'conexion.php';

    $array=json_decode($_POST['myJSONText'],True);
    $data_idioma = "";
    // print_r($array);
    foreach ( $array as $value) {
        //echo $value;
        $object = (object) $value;
        $data_idioma .="('".$object->dia."',".$object->id_docente.",".$object->id_semestre.", '".$object->horas."','".$object->turno."'),";
        }

   
    $query_string = "INSERT INTO disponibilidad(
            dia, id_docente, id_semestre, horas,  turno)
    VALUES";
    $qry = substr($query_string.$data_idioma, 0, -1);
    echo $qry;
    $verdad = pg_query($connect, $qry);
    echo $verdad;
    
?>