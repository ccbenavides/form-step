  <?php 
      include 'conexion.php'; 
    session_start();
  //PUT THIS HEADER ON TOP OF EACH UNIQUE PAGE
    if(!isset($_SESSION['username'])){
      header("location:main_login.php");
    }
      $es_persona_sql = "select nombre_per,p.id_persona,apepat_per,apemat_per,email,id_asignatura,p.dni ,o.dni as tipo_docente 
from persona as p 
left join 
profesoresunprg as o 
on p.dni=o.dni where 
p.id_persona=".$_SESSION["clave"];
      $es_persona_row =  pg_query($connect ,$es_persona_sql );
      if($row =  pg_fetch_array($es_persona_row)){
        $nombre_per = $row['nombre_per'];
        $apepat_per = $row['apepat_per'];
        $apemat_per = $row['apemat_per'];
        $email = $row['email'];
        $id_asignatura = $row['id_asignatura'];
        $dni = $row['dni'];
        $tipo_docente = $row['tipo_docente'];
                   
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
    <script src="js/val.js" charset="utf-8"></script>
    <script src="js/main.js" charset="utf-8"></script>
  </head>

  <body>
    <div class="maestro_full">
      <div class="maestro_max ">
        <div  class="espacios">
          <ul class="breadcump">
                <li> <a href="index.php">incio</a> </li>
                / <li>formulario </li>
            </ul>
          <form id="SignupForm" METHOD="POST" action="recibidos.php">

              <input type="hidden" value="<?php echo $tipo_docente ?>" name="tipo_docente">
            <fieldset>
              <legend> Datos personales  </legend>
              <div class="col-mitad">
                <label for="nombres">Nombres</label>
                <input id="nombres" name="nombres" type="text" value="<?php echo $nombre_per ?>" disabled />

                <label for="apellido_materno">Apellido Materno</label>
                <input id="apellido_materno" name="apellido_materno" type="text" value="<?php echo $apemat_per ?>" disabled />

                <label for="ruc">Ruc</label>
                <input id="ruc" name="ruc" type="text"/>

                <label for="email">Email</label>
                <input id="email" name="email" type="text" value="<?php echo $email ?>"  disabled/>
      
                <label for="asignatura">Asignatura</label>
                <select class="" name="" id="asignatura" value="<?php echo $id_asignatura ?>" disabled >
                    <?php include 'conexion.php'; 
                        $string_sql = "select descripcion_asig, id_asignatura from asignatura";
                        $data_semestre =  pg_query($connect ,$string_sql );
                        while ($row= pg_fetch_assoc($data_semestre)) 
                        { 
                          //<?php if("val1" == $_POST['mybox']){ echo "selected"; } 
                           $selected ='';
                          if($row['id_asignatura']==$id_asignatura){
                            $selected = "selected";
                          }
                          echo "<option value=".$row['id_asignatura']." ". $selected .">".$row['descripcion_asig']."</option>"; 
                        } 
                        pg_close();
            ?>
                  
                </select>

                <label for="telefono">Telefono</label>
                <input id="telefono" name="telefono" type="text"/>

              </div><div class="col-mitad">
                <label for="apellido_paterno" >Apellido Paterno</label>
                <input id="apellido_paterno" name="apellido_paterno" type="text" value="<?php echo $apepat_per ?>" disabled />

                <label for="dni">Dni</label>
                <input id="dni" name="dni" type="text" value="<?php echo $dni ?>" disabled />

                <label for="direccion">Dirección</label>
                <input id="direccion" name="direccion" type="text"/>

                <div class="col-50">
                  <label for="departamento">Departamento</label>
                  <select class="" name="departamento" id="departamento">
                    <option value="option">Seleccione</option>
                  </select>
                  <!-- <input id="departamento" name="departamento" type="text"/> -->

                </div><div class="col-50">
                  <label for="provincia">Provincia</label>
                  <select class="" name="provincia"  id="provincia">
                    <option value="option">Seleccione</option>

                  </select>
                  <!-- <input id="provincia" name="provincia" type="text"/> -->

                </div>

                <label for="distrito">Distrito</label>
                <select class="" name="distrito" id="distrito">
                  <option value="option">Seleccione</option>

                </select>
                <!-- <input id="distrito" name="distrito" type="text"/> -->

                <label for="distrito">Fecha De Nacimiento </label>
                <div class="col-30">
                  <select class="fecha_dia" name="fecha_dia_nac" id="fecha_dia">
                    <option value="option">Día</option>

                  </select><select class="fecha_mes" name="fecha_mes_nac" id="fecha_mes">
                    <option value="option">Mes</option>

                  </select><select class="fecha_anio" name="fecha_anio_nac" id="fecha_anio">
                    <option value="option">Año </option>
                  </select>

                </div>



              </div>
            </fieldset>

            <fieldset>
              <legend> Formación académica </legend>
                <span class="span_normal">ordenada de más reciente a más antigua </span>
                <button type="button" name="button" class="btn-right" id="btnmodal_formacion"> Agregar </button>
                <table class="table tabla_formacion_academica">
                  <thead>
                    <th class="width-60">Tipo</th>
                    <th> Bachiller / Titulo </th>
                    <th class="width-60">F. Inicio </th>
                    <th class="width-60">F. Fin </th>
                    <th>Universidad / Centro </th>
                    <th class="width-90">Acción </th>
                  </thead>
                  <tbody id="body_formacion">
                    <tr class="tr-faker">
                      <td> - </td>
                      <td><input type="text" name="tipo_forma"></td>
                      <td>  </td>
                      <td> </td>
                      <td>  </td>
                      <td> </td>
                    </tr>
                  </tbody>
                </table>

              <legend> Maestrias - Doctorados   </legend>
                  <span class="span_normal">ordenada de más reciente a más antigua </span>
                  <button type="button" name="button" class="btn-right" id="btnmodal_doctorados"> Agregar </button>
                  <table class="table tabla_maestria_doctorados">
                    <thead>
                      <th class="width-60"> Tipo</th>
                      <th> Grado y Mencion </th>
                      <th class="width-60"> Duración </th>
                      <th> Universidad </th>
                      <th class="width-90">Acción </th>

                    </thead>
                    <tbody id="body_doctorado">
                      <tr class="tr-faker">
                        <td> - </td>
                        <td> </td>
                        <td>  </td>
                        <td> </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>

              <legend> Experiencia docente </legend>
                  <span class="span_normal">ordenada de más reciente a más antigua </span>
                  <button type="button" name="button" class="btn-right" id="btnmodal_experiencia"> Agregar </button>
                  <table class="table tabla_exp_docente" >
                    <thead>
                      <th> Instituto </th>
                      <th> Asignatura </th>
                      <th class="width-60">F. Inicio </th>
                      <th class="width-60">F. Fin </th>
                      <th class="width-90">Acción </th>
                    </thead>
                    <tbody id="body_experiencia">
                      <tr class="tr-faker">
                        <td> - </td>
                        <td>  </td>
                        <td> </td>
                        <td>  </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>

            </fieldset>
            <fieldset>
              <legend> Conocimientos de idiomas </legend>
                  <span class="span_normal">ordenada de más reciente a más antigua </span>
                  <button type="button" name="button" class="btn-right" id="btnmodal_idioma"> Agregar </button>
                  <table class="table tabla_conocimientos_idiomas">
                    <thead>
                      <th> Idioma </th>
                      <th class="width-90" > Nivel </th>
                      <th class="width-60">F. Inicio </th>
                      <th class="width-60">F. Fin </th>
                      <th class="width-90">Acción </th>
                    </thead>
                    <tbody id="body_idioma">
                      <tr class="tr-faker">
                        <td> - </td>
                        <td>  </td>
                        <td> </td>
                        <td>  </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>

              <legend> Conocimientos informáticos </legend>
                      <span class="span_normal">ordenada de más reciente a más antigua </span>
                      <button type="button" name="button" class="btn-right" id="btnmodal_informatico"> Agregar </button>
                      <table class="table tabla_conocimientos_info">
                        <thead>
                          <th> Curso / Tematica </th>
                          <th class="width-90"> Nivel </th>
                          <th class="width-60">F. Inicio </th>
                          <th class="width-60">F. Fin </th>
                          <th class="width-90">Acción </th>
                        </thead>
                        <tbody id="body_informatico">
                          <tr class="tr-faker">
                            <td> - </td>
                            <td>  </td>
                            <td> </td>
                            <td>  </td>
                            <td> </td>
                          </tr>
                        </tbody>
                      </table>
              <legend> Capacitaciones </legend>
                          <span class="span_normal">ordenada de más reciente a más antigua </span>
                          <button type="button" name="button" class="btn-right" id="btnmodal_capacitacion"> Agregar </button>
                          <table class="table tabla_capacitaciones">
                            <thead>
                              <th> Curso / Seminario / Taller </th>
                              <th> Institución </th>
                              <th class="width-60">F. Inicio </th>
                              <th class="width-60">F. Fin </th>
                              <th class="width-90">Acción </th>
                            </thead>
                            <tbody id="body_capacitacion">
                              <tr class="tr-faker">
                                <td> - </td>
                                <td>  </td>
                                <td> </td>
                                <td>  </td>
                                <td> </td>
                              </tr>
                            </tbody>
                          </table>
                <legend> Otros datos de interes  </legend>
                              <button type="button" name="button" class="btn-right" id="btnmodal_otros"> Agregar </button>
                              <table class="table tabla_otros_datos">
                                <thead>
                                  <th> Otros </th>
                                  <th class="width-90"> Acción </th>
                                </thead>
                                <tbody id="body_otros">
                                  <tr class="tr-faker">
                                    <td> - </td>
                                    <td> - </td>
                                  </tr>
                                </tbody>
                              </table>

            </fieldset>
            <fieldset>
              <p class="">
                <span class="span_normal"> Revise si esta todo conforme y click para enviar los datos y guardar.</span>
                <br/><br/>
              <input id="SaveAccount" type="submit" class="post-form" value="REGISTRAR DOCENTE" />
            </p>
              <legend> Verificar Datos   </legend>
              <hr/>
              <div class="bloque_verificar">
                <h2>Datos Personales</h2>
                <div class="col-mitad">
                  <ul id="bloque_uno_datos">                 
            
                  </ul>
                </div><div class="col-mitad">
                   <ul id="bloque_dos_datos">
                     
                   </ul>
                </div>
                
              </div>
              <hr />
              <div>
                <h2>Formación académica</h2>
                <div id="add_table_fa"></div>
              </div>
              <hr />
              <div>
                <h2>Maestrias - Doctorados</h2>
                <div id="add_table_md"></div>
              </div>
              <hr />
              <div>
                <h2>Experiencia docente</h2>
                <div id="add_table_ex"></div>
              </div>
              <hr />
              <div>
                <h2>Conocimientos de idiomas</h2>
                <div id="add_table_coi"></div>
              </div>
              <hr />
              <div>
                <h2>Conocimientos informáticos</h2>
                <div id="add_table_ci"></div>
              </div>
              <hr />
              <div>
                <h2>Capacitaciones</h2>
                <div id="add_table_cap"></div>
              </div>
               <hr />
              <div>
                <h2>Otros datos de interes</h2>
                <div id="add_table_odi"></div>
              </div>
            </fieldset>
            
          </form>

        </div>
      </div>
    </div>

<!-- SOMBRA OSCURA PARA MODALES   -->
<div class="maestro_oscuro">
</div>


<!-- MODAL FORMACION ACADEMICA   -->
<div class="modal_formacion">
      <legend> Formación académica </legend>
      <label for=""> Tipo Grado de bachiller / Titulo profesional </label>
      <select class="tipo_modal select-modal" name="tipo_grado" >
        <option value="option">Seleccione</option>
        <option value="bachiller">Bachiller</option>
        <option value="titulo">Titulo</option>
      </select>

      <label for=""> Nombre de  Grado de bachiller / Titulo profesional </label>
      <input type="text" class="text-modal grado_modal" name="gradotitulo" value="">

      <label for=""> Universidad / Centro  </label>
      <input type="text" class="text-modal universidad_modal" name="universidad_modal" value="">
      <div class="col-45">
          <div class="col-40">
          <label for=""> Fecha Inicio </label>
          <select class="fecha_mes select-modal mes_modal_inicio" name="" id="fecha_mes">
            <option value="option">Mes</option>
          </select><select class="fecha_anio select-modal anio_modal_inicio" name="" id="fecha_anio">
            <option value="option">Año </option>
          </select>

        </div><div class="col-40">
            <label for=""> Fecha Fin  </label>
          </select><select class="fecha_mes select-modal mes_modal_fin" name="" id="fecha_mes">
            <option value="option">Mes</option>
          </select><select class="fecha_anio select-modal anio_modal_fin" name="" id="fecha_anio">
            <option value="option">Año </option>
          </select>

        </div>

      </div>

      <div class="top-50">
        <a href="#" class="next validate_formacion" id="agregar_formacion" > Agregar ! </a>
        <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

      </div>
    </div>


<!-- MODAL MAESTRIA Y DOCTORADOS   -->
<div class="modal_doctorados">
  <legend> Maestrias - Doctorados  </legend>

  <label for=""> Tipo Grado de Magister / Doctor </label>
  <select class="tipodoc_modal select-modal" name="" >
    <option value="option">Seleccione</option>
    <option value="Magister">Magister</option>
    <option value="Doctor">Doctor</option>
  </select>

  <label for=""> Grado y Mención </label>
  <input type="text" class="text-modal gradodoc_modal" name="name" value="">

  <label for=""> Duración </label>
  <input type="text" class="text-modal duracion_modal" name="name" value="">

  <label for=""> Universidad </label>
  <input type="text" class="text-modal universidadoc_modal" name="name" value="">

  <div class="top-50">
    <a href="#" class="next validate_formacion" id="agregar_doctorado" > Agregar ! </a>
    <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

  </div>
</div>


<!-- MODAL EXPERIENCIA DOCENTE  -->
<div class="modal_experiencia">
    <legend> Experiencia Docente </legend>

    <label for=""> Institución </label>
    <input type="text" class="text-modal inst_modal" name="name" value="">

    <label for=""> Asignatura </label>
    <input type="text" class="text-modal asig_modal" name="name" value="">

    <div class="col-45">
        <div class="col-40">
        <label for=""> Fecha Inicio </label>
        <select class="fecha_mes select-modal mes_modal_inicio" name="" id="fecha_mes">
          <option value="option">Mes</option>
        </select><select class="fecha_anio select-modal anio_modal_inicio" name="" id="fecha_anio">
          <option value="option">Año </option>
        </select>

      </div><div class="col-40">
          <label for=""> Fecha Fin  </label>
        </select><select class="fecha_mes select-modal mes_modal_fin" name="" id="fecha_mes">
          <option value="option">Mes</option>
        </select><select class="fecha_anio select-modal anio_modal_fin" name="" id="fecha_anio">
          <option value="option">Año </option>
        </select>

      </div>

    </div>

    <div class="top-50">
      <a href="#" class="next validate_formacion" id="agregar_experiencia" > Agregar ! </a>
      <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

    </div>

</div>

<!-- MODAL CONOCIMIENTOS DE IDIOMAS -->
<div class="modal_idiomas">
  <legend> Conocimientos de Idiomas </legend>

  <label for=""> Idioma </label>
  <input type="text" class="text-modal idioma_modal" name="name" value="">

  <label for=""> Nivel </label>
  <select class="nivel_modal select-modal" name="" >
    <option value="C">Basico</option>
    <option value="B">Intermedio</option>
    <option value="A">Avanzado</option>
  </select>

  <div class="col-45">
      <div class="col-40">
      <label for=""> Fecha Inicio </label>
      <select class="fecha_mes select-modal mes_modal_inicio" name="" id="fecha_mes">
        <option value="option">Mes</option>
      </select><select class="fecha_anio select-modal anio_modal_inicio" name="" id="fecha_anio">
        <option value="option">Año </option>
      </select>

    </div><div class="col-40">
        <label for=""> Fecha Fin  </label>
      </select><select class="fecha_mes select-modal mes_modal_fin" name="" id="fecha_mes">
        <option value="option">Mes</option>
      </select><select class="fecha_anio select-modal anio_modal_fin" name="" id="fecha_anio">
        <option value="option">Año </option>
      </select>

    </div>

  </div>

  <div class="top-50">
    <a href="#" class="next validate_formacion" id="agregar_idioma" > Agregar ! </a>
    <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

  </div>

</div>


<!-- MODAL CONOCIMIENTOS INFORMATICOS  -->
<div class="modal_informaticos">
  <legend> Conocimientos informáticos </legend>

  <label for=""> Curso / Tematica </label>
  <input type="text" class="text-modal tematica_modal" name="name" value="">

  <label for=""> Nivel </label>
  <select class="niveli_modal select-modal" name="" >
    <option value="basico">Basico</option>
    <option value="intermedio">Intermedio</option>
    <option value="avanzado">Avanzado</option>
  </select>

  <div class="col-45">
      <div class="col-40">
      <label for=""> Fecha Inicio </label>
      <select class="fecha_mes select-modal mes_modal_inicio" name="" id="fecha_mes">
        <option value="option">Mes</option>
      </select><select class="fecha_anio select-modal anio_modal_inicio" name="" id="fecha_anio">
        <option value="option">Año </option>
      </select>

    </div><div class="col-40">
        <label for=""> Fecha Fin  </label>
      </select><select class="fecha_mes select-modal mes_modal_fin" name="" id="fecha_mes">
        <option value="option">Mes</option>
      </select><select class="fecha_anio select-modal anio_modal_fin" name="" id="fecha_anio">
        <option value="option">Año </option>
      </select>

    </div>

  </div>

  <div class="top-50">
    <a href="#" class="next validate_formacion" id="agregar_informatico" > Agregar ! </a>
    <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

  </div>

</div>

<!-- MODAL CAPACITACIONES -->
<div class="modal_capacitaciones">
  <legend> Capacitaciones </legend>
  <label for=""> Nombre de Curso - Seminario - Taller </label>
  <input type="text" class="text-modal namecurso_modal" name="name" value="">

  <label for=""> Institución </label>
  <input type="text" class="text-modal nameins_modal" name="name" value="">

  <div class="col-45">
      <div class="col-40">
      <label for=""> Fecha Inicio </label>
      <select class="fecha_mes select-modal mes_modal_inicio" name="" id="fecha_mes">
        <option value="option">Mes</option>
      </select><select class="fecha_anio select-modal anio_modal_inicio" name="" id="fecha_anio">
        <option value="option">Año </option>
      </select>

    </div><div class="col-40">
        <label for=""> Fecha Fin  </label>
      </select><select class="fecha_mes select-modal mes_modal_fin" name="" id="fecha_mes">
        <option value="option">Mes</option>
      </select><select class="fecha_anio select-modal anio_modal_fin" name="" id="fecha_anio">
        <option value="option">Año </option>
      </select>

    </div>

  </div>

  <div class="top-50">
    <a href="#" class="next validate_formacion" id="agregar_capacitacion" > Agregar ! </a>
    <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

  </div>
</div>

<!-- MODAL OTROS DATOS DE INTERES  -->
<div class="modal_otros">
  <legend> Otros datos de interes profesional o académico </legend>

  <label for=""> Otro  </label>
  <input type="text" class="text-modal otro_modal" name="name" value="">

  <div class="top-50">
    <a href="#" class="next validate_formacion" id="agregar_otros" > Agregar ! </a>
    <a href="#" class="next espacio-30 close-all"> Cancelar ! </a>

  </div>

</div>

  </body>
</html>
