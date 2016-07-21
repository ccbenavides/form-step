
<?php
$host="127.0.0.1";
$port="5432";
$user="postgres";
/*$pass="acuario203972";*/
$dbname="prueba";

$connect = pg_connect("host=$host port=$port user=$user dbname=$dbname");


//consulta
    /*$result = pg_query($connect, "select * from persona;");
    while ($row = pg_fetch_row($result)) {
      echo "Author: $row[0] Email: $row[1]";
      echo "<br/>\n";
    };
    $bandera = pg_query($connect, "    INSERT INTO persona(
            nombre_per, apepat_per, apemat_per, email, id_asignatura, usuario,
            clave, dni)
    VALUES ('carlos', 'benavides', 'montenro', 'carn@gmail.com', 1, 'vimcemt',
            'acuario72', '71433272');");






    pg_close($connect);


    </body>
</html>
*/
/*
if(!$connect)
    echo "<p><i>No me conecte</i></p>";
else
    echo "<p><i>Me conecte</i></p>";*/
?>