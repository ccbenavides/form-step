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
            
            
   ?>
        

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
        <link rel="stylesheet" href="css/css.css" media="screen" title="no title" charset="utf-8">
    <script src="js/jquery.min.js" charset="utf-8"></script>
    <script src="js/js.js" charset="utf-8"></script>
    <script src="js/main.js" charset="utf-8"></script>
</head>
<body>
  <div class="maestro_full">
    <div class="maestro_max ">
      <div  class="espacios">
        
        <h1> Bienvenido :    <?php  echo $_SESSION['username'] ?>   </h1>
        <h3> Seleccione opciones :  </h3>
        <ul class="menu_list">
          <li> 
            <a href="formulario.php" > Llenar todos los datos ! </a> 
            
          </li>
          <li>
            <?php if(!$es_docente){?>
              <p class="p_off">Seleccionar Disponibilidad !</p>
            <?php }else{ ?>
              <a href="tablero.php" > Seleccionar Disponibilidad ! </a> 
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
</body>
</html>