
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
     <link href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald" rel="stylesheet">
    
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
       <?php include("./bloques/header.php") ?>
    <div class="maestro_full">
      <div class="maestro_max ">
        <div  class="espacios">
            
            <h1> Nesecita Cambiar de Clave 
            <span> por seguridad </span>
                
            </h1>
            <div class="line"></div>
            <form action="checklogin.php" method="POST" class="login">
                <label for="" >Clave :</label>
                <input class="pas_1" type="password" name="password">
                
                <label for="">Repetir Clave : </label>
                <input class="pas_2" type="password" name="password_r">
                <br>
                <div>
                    <input type="hidden" name="dni" value="<?php echo $_GET["dni"]?>">
                    <input type="submit"  class="next" value="ingresar" >
                    
                </div>
                <div>
                    <span></span>
                </div>
                
            </form>
            
          </div>
      </div>
    </div>
         <?php include("./bloques/footer.php") ?>
    <script>
           $(".next").click(function(event){
              if( $(".pas_1").val() != $(".pas_2").val() ){
                  alert("las contraseñas no coinciden ");
                  event.preventDefault();
              }
              if( $(".pas_1").val() == "" || $(".pas_2").val() == "" ){
                   alert(" algún campo esta vacio ");
                  event.preventDefault();
              }
           });
    </script>
    
   </body>
  </html> 