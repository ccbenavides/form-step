
<?php

include 'conexion.php';
session_start();

function quitar($mensaje)
{
 $nopermitidos = array("'",'\\','<','>',"\"");
 $mensaje = str_replace($nopermitidos, "", $mensaje);
 return $mensaje;
}


//verificar si los datos estan en los fields 
if( trim($_POST["dni"]) && 
    strlen(trim($_POST["password"]))>0     
  ){
    $result = pg_query('SELECT clave, dni,id_persona, usuario FROM persona WHERE dni=\''. trim($_POST["dni"]) .'\'');
    if($row =  pg_fetch_array($result)){
        
        if($row['dni'] == $row['clave']){
            header("location:changepass.php?dni=" . $row['clave']);                 
            
        }else{
            if( $row['clave'] === md5($_POST["password"]) ){
                $_SESSION["username"] = $row['usuario'];
                $_SESSION["clave"] = $row['id_persona'];
                $_SESSION["nombre_per"] = $row['nombre_per'];
                $_SESSION["apepat_per"] = $row['apepat_per'];
                $_SESSION["dni"] = $row['dni'];
                header("location:index.php?dato=" . $row["id_persona"]);   
                
            }else{
               header("location:main_login.php?check=3&&dni=".$_POST["dni"]);  
            }
        }
    }else {
       header("location:main_login.php?check=2&&dni=".$_POST["dni"]); 
        
    }
}else{
    header("location:main_login.php?check=1&&dni=".$_POST["dni"]); 
}


// esto si tiene el dni y el password iguales 


// esto si esta el passchange
if(isset($_POST["password_r"])){
    if(trim($_POST["password"]) == trim($_POST["password_r"]) && $_POST["password_r"] ) {
        $result_update = pg_query('UPDATE persona SET clave=\''. md5($_POST["password_r"]). '\' WHERE dni=\''. $_POST["dni"] .'\'  RETURNING *')  or die(pg_last_error());;
        if($row =  pg_fetch_array($result_update)){
            $_SESSION["username"] = $row['usuario'];
            $_SESSION["clave"] = $row['id_persona'];
            $_SESSION["nombre_per"] = $row['nombre_per'];
            $_SESSION["apepat_per"] = $row['apepat_per'];
            $_SESSION["dni"] = $row['dni'];
            header("location:index.php?dni=" . $row['dni']);                     
        } 
    }
    
}



pg_close();
?>