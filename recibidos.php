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

          foreach ($_POST['name_idioma'] as $key => $value) {
                //echo $_POST['fecha_inicio_idioma'][$key];
                $var_nuevo = $_POST['name_idioma'][$key];
                pg_query($connect, "INSERT INTO conocimientosidiomas(
                        id_docente, idioma, nivel, fecha_ini, fecha_fin)
                  VALUES(1,'$var_nuevo', 'as', '1991-12-2', '1991-12-2')");
          }

 ?>
