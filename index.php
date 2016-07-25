<?php
  session_start();
//PUT THIS HEADER ON TOP OF EACH UNIQUE PAGE
  if(!isset($_SESSION['username'])){
    header("location:main_login.php");
  }
  include 'conexion.php'; 
            $string_sql = " select codigo from semestre where estado = 'ACTIVO' " ;
            $data_semestre =  pg_query($connect ,$string_sql );
            $id_semestre = pg_fetch_result($data_semestre, 0);
            
            $es_docente_sql = "select id_docente from docente where id_persona=".$_SESSION["clave"];
            $es_docente_row =  pg_query($connect ,$es_docente_sql );
             if($row =  pg_fetch_array($es_docente_row)){
              $es_docente = $row['id_docente'];                   
            }
            
            $string_crono = "select * from cronograma";
            $data_crono = pg_query($connect , $string_crono);
            if($row_crono = pg_fetch_array($data_crono)){
              $fecha_inicio_crono = $row_crono['fechaini'];
              $fecha_final_crono = $row_crono['fechafin'];
            } 
   
            
   ?>
        

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
        <link rel="stylesheet" href="css/css.css" media="screen" title="no title" charset="utf-8">
       <link href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald" rel="stylesheet">
    <script src="js/jquery.min.js" charset="utf-8"></script>
    <script src="js/js.js" charset="utf-8"></script>
    <script src="js/main.js" charset="utf-8"></script>
    
</head>
<body>
   <?php include("./bloques/header.php") ?>
  <div class="maestro_full">
    <div class="maestro_max ">
      <div  class="espacios">
        
        <h1> Bienvenido :    <?php  echo $_SESSION['nombre_per']. " " .$_SESSION['apepat_per']   ?>   </h1>
        <h3> Seleccione opciones :  </h3>
        <ul class="menu_list">
          <li> 
 
            <?php if($es_docente){?>
              <p class="p_off"> Llenar todos los datos ! <span class="span_normal">  formulario completado </span> </p>  
            <?php }else{ ?>
              <a href="formulario.php" >  Llenar todos los datos ! </a> 
            <?php } ?>
          </li>
          <li>
          <?php  if( date('Y-m-d') >= $fecha_inicio_crono  && date('Y-m-d') <= $fecha_final_crono){ ?>
                <?php if(!$es_docente){?>
                  <p class="p_off">Seleccionar Disponibilidad !</p>
                <?php }else{ ?>
                  <a href="tablero.php" > Seleccionar Disponibilidad ! </a> 
                <?php } ?>
          <?php   }else {?>
               <p class="p_off">Seleccionar Disponibilidad ! <span class="span_normal"> formulario no disponible </span> </p>
          <?php } ?>
           
            
          </li>
          <li>
            <a href="logout.php" > salir! </a> 
            
          </li>
          
        </ul>
        <div>
          <p> Centro Pre Universitario Juan Francisco Aguinaga Castro  - Semestre <?php  echo $id_semestre ?> </p>
        </div>
        </div>
      </div>
    </div>
     <?php include("./bloques/footer.php") ?>
</body>
</html>