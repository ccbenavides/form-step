<?php
  session_start();
//PUT THIS HEADER ON TOP OF EACH UNIQUE PAGE
  if(!isset($_SESSION['username'])){
    header("location:main_login.php");
  }
  
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/css.css" media="screen" title="no title" charset="utf-8">
    <script src="js/jquery.min.js" charset="utf-8"></script>

   <style>
       td,th{
           padding: 15px;
       }
       h4{
           padding: 0;
           margin: 0;
       }
       .col-off{
           background:#F2F3F4 !important;          
       }
       .line-click td:nth-child(n+2){
           cursor: pointer;
       }
       td.td-on{
           background:#55D036;
       }
       .tabla_1 button{
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #777777;
            cursor: pointer;
       }
       
   </style>
  </head>

  <body>
    <div class="maestro_full">
      <div class="maestro_max ">
        <div  class="espacios">
            <ul class="breadcump">
                <li> <a href="index.php">incio</a> </li>
                / <li>tablero </li>
            </ul>
            <h1> INGRESE DISPONIBILIDAD - SEMESTRE II </h1>
            <ol>
                <li class="letra_normal"> Solo se acepta disponibilidad de cuatro horas seguidas </li>
                <li class="letra_normal"> Seleccione celdas en las cuales corresponda su disponibilidad </li>
                <li class="letra_normal"> Este solo sera llenado una vez </li>
            </ol>
            <legend class="top-50" >HORARIO - TURNO MAÑANA</legend>
            <table class="tabla_1 tabla_manania">
                <thead>
                    <th> Día / Hora</th>
                    <th>Lunes 
                        <br>
                        <button>llenar</button>
                    </th>
                    <th>Martes<br>
                        <button>llenar</button></th>
                    <th>Miercoles<br>
                        <button>llenar</button></th>
                    <th>Jueves<br>
                        <button>llenar</button></th>
                    <th>Viernes<br>
                        <button>llenar</button></th>
                    <th>Sabado<br>
                        <button>llenar</button></th>
                </thead>
                <tbody>
                    <tr class="line-click row-use">
                        <td> 07:30 - 08:20</td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                    </tr>
                    <tr class="line-click">
                        <td> 08:20 - 09:10</td>                       
                    </tr>
                    <tr class="line-click row-use">
                        <td> 09:10 - 10:00</td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                    </tr>
                    <tr class="line-click">
                        <td> 10:00 - 10:50</td>
    
                    </tr>
                    <tr class="col-off" >
                        <td> 10:50 - 11:10</td>
                        <td> <h4> R </h4> </td>
                        <td> <h4> E </h4> </td>
                        <td> <h4> C </h4></td>
                        <td> <h4> E </h4> </td>
                        <td> <h4> S </h4> </td>
                        <td> <h4> O </h4> </td>
                    </tr>
                    <tr class="line-click row-use">
                        <td> 11:10 - 12:00</td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                    </tr>
                    <tr class="line-click">
                        <td> 12:00 - 12:50</td>
        
                    </tr>
                </tbody>
            </table>
            
            
            <legend>HORARIO - TURNO TARDE</legend>
            <table class="tabla_1 tabla_tarde">
                <thead>
                    <th> Día / Hora</th>
                    <th>Lunes 
                        <br>
                        <button>llenar</button>
                    </th>
                    <th>Martes<br>
                        <button>llenar</button></th>
                    <th>Miercoles<br>
                        <button>llenar</button></th>
                    <th>Jueves<br>
                        <button>llenar</button></th>
                    <th>Viernes<br>
                        <button>llenar</button></th>
                    
                </thead>
                <tbody>
                    <tr class="line-click row-use">
                        <td> 07:30 - 08:20</td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                    </tr>
                    <tr class="line-click">
                        <td> 08:20 - 09:10</td>                       
                    </tr>
                    <tr class="line-click row-use">
                        <td> 09:10 - 10:00</td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                    </tr>
                    <tr class="line-click">
                        <td> 10:00 - 10:50</td>
    
                    </tr>
                    <tr class="col-off" >
                        <td> 10:50 - 11:10</td>
                        <td> <h4> R </h4> </td>
                        <td> <h4> E </h4> </td>
                        <td> <h4> C </h4></td>
                        <td> <h4> E </h4> </td>
                        <td> <h4> S </h4> </td>
                    </tr>
                    <tr class="line-click row-use">
                        <td> 11:10 - 12:00</td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                        <td rowspan="2"></td>
                    </tr>
                    <tr class="line-click">
                        <td> 12:00 - 12:50</td>
        
                    </tr>
                </tbody>
            </table>
            
             <p class="center">
                <input id="enviar_disponibilidad" type="submit" class="post-form" value="ENVIAR DISPONIBILIDAD" />
              </p>
         </div>
       </div>
     </div>
        <?php include 'conexion.php'; 
            $string_sql = " select codigo from semestre where estado = 'ACTIVO' " ;
            $data_semestre =  pg_query($connect ,$string_sql );
            $id_semestre = pg_fetch_result($data_semestre, 0);
            
            pg_close();
        ?>
        <script>
            var numero_semestre = <?php echo $id_semestre ?>;
        </script>
    <script src="js/tabla.js" charset="utf-8"></script>
</body>
</html>