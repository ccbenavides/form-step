
<?php
  session_start();
  if(isset($_SESSION['username'])){
    header("location:index.php");
  }
?>

<html>
<!DOCTYPE html>
  <head>
    <meta charset="utf-8">
    <title> step 2 </title>
    <link rel="stylesheet" href="css/css.css" media="screen" title="no title" charset="utf-8">
    <script src="js/jquery.min.js" charset="utf-8"></script>
    <script src="js/js.js" charset="utf-8"></script>
    <script src="js/main.js" charset="utf-8"></script>
    <style>
        .maestro_max{
            width:370px;
            margin:50px auto;
        }
        .next{
            float: none;
            margin-top: 30px;
            width: 100%;
        }
        .line{
            margin-bottom:10px;
        }
    </style>
  </head>
  
  <body>
    <div class="maestro_full">
      <div class="maestro_max ">
        <div  class="espacios">
            
            <h1> Bienvenido Docente </h1>
            <div class="line"></div>
            <form action="checklogin.php" method="POST" class="login">
                <legend>Login </legend>
                <label for="" >Dni :</label>
                <input type="text" name="dni" value="<?php echo $_GET["dni"] ?>">
                
                <label for="">Clave : </label>
                <input type="password" name="password" >
                <br>
                <br>
                <div>
                    <input type="submit"  class="next" value="ingresar" >
                    
                </div>
                <?php if($_GET["check"]) { ?>
                <div>
                    <?php if($_GET["check"] == '3') { ?>
                        <span class="error-message"> contraseña inválida ! </span> 
                    <?php } ?>
                    <?php if($_GET["check"] == '2' ){ ?>
                        <span class="error-message"> cuenta no registrada ! </span> 
                    <?php } ?>
                    
                    <?php if($_GET["check"] == '1' ){ ?>
                        <span class="error-message"> faltan datos ! </span> 
                    <?php } ?>
                    
                </div>
                <?php } ?>
                
            </form>
            
          </div>
      </div>
    </div>
   </body>
  </html> 