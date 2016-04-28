var mes = ['ene','feb','mar','abr','may','jun','jul','ago','sep','obc','nov','dic'];


$(document).ready(function() {
  //  ubigeo-peru
   $.getJSON("./ubigeo-peru.min.json", function(result) {
       var options = $("#departamento");

       $.each(result, function(item,data) {
          if( data["provincia"] == 0 && data["distrito"] == 0){
            options.append($("<option />").val(data["departamento"]).text(data["nombre"]));
          };
       });

       $("#departamento").click(function(){
            var options_provincia = $("#provincia");
            var num_departamento = $( "#departamento option:selected" ).val();

            options_provincia.html($("<option />").val("seleccione").text("seleccione"));
            $("#distrito").html($("<option />").val("seleccione").text("seleccione"));

            $.each(result, function(item,data) {
               if( data["departamento"] == num_departamento && data["provincia"] != 00 && data["distrito"] == 0){
                 options_provincia.append($("<option />").val(data["provincia"]).text(data["nombre"]));
               };
            });

       });

       $("#provincia").click(function(){
         var options_distrito = $("#distrito");
         var num_distrito = $("#provincia option:selected").val();
         var num_departamento = $( "#departamento option:selected" ).val();
         options_distrito.html($("<option />").val("seleccione").text("seleccione"));

         $.each(result,function(item,data){
           if( data["departamento"] == num_departamento && data["provincia"] == num_distrito && data["distrito"] != 00){
             options_distrito.append($("<option />").val(data["distrito"]).text(data["nombre"]));
           };
         });


       });
      //  $("#distrito").click(function(){ alert("asdasd"); });
   });

  // fechas
    for (var i = 1; i <= 31; i++) {   $(".fecha_dia").append($("<option />").val(i).text(i)); }
    for (var i = 1; i <= 12; i++) {   $(".fecha_mes").append($("<option />").val(i).text( mes[i-1]));}
    for (var i = 1915; i <= 2000; i++) {   $(".fecha_anio").append($("<option />").val(i).text(i));}

  //  abrir modales
    abrir_modal("btnmodal_formacion","modal_formacion");
    abrir_modal("btnmodal_doctorados","modal_doctorados");
    abrir_modal("btnmodal_experiencia","modal_experiencia");

    abrir_modal("btnmodal_idioma","modal_idiomas");
    abrir_modal("btnmodal_informatico","modal_informaticos");
    abrir_modal("btnmodal_capacitacion","modal_capacitaciones");
    abrir_modal("btnmodal_otros","modal_otros");


  // agregar a tables desde modales
  $(document).on('click','#agregar_formacion',function(event){

    event.preventDefault();

    var bandera = 0;

    var tipo = $(".tipo_modal").val();
    var grado = $(".grado_modal").val();
    var universidad = $(".universidad_modal").val();
    var fecha_inicio = $(".mes_modal_inicio").val() +"-"+ $(".anio_modal_inicio").val();
    var fecha_fin    = $(".mes_modal_fin").val() +"-"+ $(".anio_modal_fin").val();

    bandera += val_combo($(".tipo_modal"));
    bandera += val_text($(".grado_modal"));
    bandera += val_text($(".universidad_modal"));

    if(bandera == 0){

      fecha_inicio = fecha_inicio.replace(/option/g,"");
      fecha_fin = fecha_fin.replace(/option/g,"");

      $("#body_formacion .tr-faker").remove();

      $("#body_formacion").append("<tr>"+
      "<td> <input type='text' name='tipo_forma[]' value=\""+ tipo+"\"  /></td>"+
      "<td> <input type='text' name='grado_forma[]' value=\""+ grado +"\"  /> </td>"+
      "<td> <input type='text' name='fecha_inicio_forma[]' value=\""+ fecha_inicio+"\" /> </td>"+
      "<td> <input type='text' name='fecha_fin_forma[]' value=\""+ fecha_fin+"\" /></td>"+
      "<td> <input type='text' name='universidad_forma[]' value=\""+ universidad+"\" /> </td>"+
      "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
      "</tr>");
      cleaner_form();
    }

  });

  $("#agregar_doctorado").click(function(event){
    event.preventDefault();
    var bandera = 0;
    var tipo = $(".tipodoc_modal").val();
    var grado = $(".gradodoc_modal").val();
    var duracion = $(".duracion_modal").val();
    var universidad = $(".universidadoc_modal").val();

    bandera += val_combo($(".tipodoc_modal"));
    bandera += val_text($(".gradodoc_modal"));
    bandera += val_text($(".duracion_modal"));
    bandera += val_text($(".universidadoc_modal"));

    if( bandera == 0){
        $("#body_doctorado .tr-faker").remove();

        $("#body_doctorado").append("<tr>"+
        "<td> <input type='text' name='tipo_doc[]' value=\""+ tipo+"\" /></td>"+
        "<td> <input type='text' name='grado_doc[]' value=\""+ grado +"\" /> </td>"+
        "<td> <input type='text' name='duracion_doc[]' value=\""+ duracion+"\" /> </td>"+
        "<td> <input type='text' name='universidad_doc[]' value=\""+ universidad+"\" /></td>"+
        "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
        "</tr>");
        cleaner_form();

    }

  });

  $("#agregar_experiencia").click(function(event){
    event.preventDefault();

    var bandera = 0;

    var institucion  = $(".inst_modal").val();
    var asignatura   = $(".asig_modal").val();
    var fecha_inicio = $(".modal_experiencia .mes_modal_inicio").val() +"-"+ $(".modal_experiencia .anio_modal_inicio").val();
    var fecha_fin    = $(".modal_experiencia .mes_modal_fin").val() +"-"+ $(".modal_experiencia .anio_modal_fin").val();

    bandera += val_text($(".inst_modal"));
    bandera += val_text($(".asig_modal"));

    if(bandera == 0){

      fecha_inicio = fecha_inicio.replace(/option/g,"");
      fecha_fin = fecha_fin.replace(/option/g,"");

      $("#body_experiencia .tr-faker").remove();

      $("#body_experiencia").append("<tr>"+
      "<td> <input type='text' name='inst_exp[]' value=\""+ institucion +"\" /> </td>"+
      "<td> <input type='text' name='asig_exp[]' value=\""+ asignatura+"\" /> </td>"+
      "<td> <input type='text' name='fecha_inicio_exp[]' value=\""+ fecha_inicio+"\" /> </td>"+
      "<td> <input type='text' name='fecha_fin_exp[]' value=\""+ fecha_fin+"\" /></td>"+
      "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
      "</tr>");
      cleaner_form();
    }

  });

  $("#agregar_idioma").click(function(event){
      event.preventDefault();
      var bandera = 0;

      var idioma  = $(".idioma_modal").val();
      var nivel   = $(".nivel_modal").val();
      var fecha_inicio = $(".modal_idiomas .mes_modal_inicio").val() +"-"+ $(".modal_idiomas .anio_modal_inicio").val();
      var fecha_fin    = $(".modal_idiomas .mes_modal_fin").val() +"-"+ $(".modal_idiomas .anio_modal_fin").val();

      bandera += val_text($(".idioma_modal"));
      bandera += val_combo($(".nivel_modal"));

      if(bandera == 0){

        fecha_inicio = fecha_inicio.replace(/option/g,"");
        fecha_fin = fecha_fin.replace(/option/g,"");

        $("#body_idioma .tr-faker").remove();

        $("#body_idioma").append("<tr>"+
        "<td> <input type='text' name='name_idioma[]' value=\""+ idioma +"\" /> </td>"+
        "<td> <input type='text' name='nivel_idioma[]' value=\""+ nivel+"\" /> </td>"+
        "<td> <input type='text' name='fecha_inicio_idioma[]' value=\""+ fecha_inicio+"\" /> </td>"+
        "<td> <input type='text' name='fecha_fin_idioma[]' value=\""+ fecha_fin+"\" /></td>"+
        "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
        "</tr>");
        cleaner_form();
      }

  });

  $("#agregar_informatico").click(function(event){
    event.preventDefault();
    var bandera = 0;

    var tematica  = $(".tematica_modal").val();
    var nivel   = $(".niveli_modal").val();
    var fecha_inicio = $(".modal_informaticos .mes_modal_inicio").val() +"-"+ $(".modal_informaticos .anio_modal_inicio").val();
    var fecha_fin    = $(".modal_informaticos .mes_modal_fin").val() +"-"+ $(".modal_informaticos .anio_modal_fin").val();

    bandera += val_text($(".tematica_modal"));
    bandera += val_combo($(".niveli_modal"));

    if(bandera == 0){

      fecha_inicio = fecha_inicio.replace(/option/g,"");
      fecha_fin = fecha_fin.replace(/option/g,"");

      $("#body_informatico .tr-faker").remove();

      $("#body_informatico").append("<tr>"+
      "<td> <input type='text' name='name_info[]' value=\""+ tematica  +"\" /> </td>"+
      "<td> <input type='text' name='nivel_info[]' value=\""+ nivel+"\" /> </td>"+
      "<td> <input type='text' name='fecha_inicio_info[]' value=\""+ fecha_inicio+"\" /> </td>"+
      "<td> <input type='text' name='fecha_fin_info[]' value=\""+ fecha_fin+"\" /></td>"+
      "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
      "</tr>");
      cleaner_form();
    }
  });

  $("#agregar_capacitacion").click(function(event){
    event.preventDefault();
    var bandera = 0;

    var curso  = $(".namecurso_modal").val();
    var instuticion   = $(".nameins_modal").val();
    var fecha_inicio = $(".modal_capacitaciones .mes_modal_inicio").val() +"-"+ $(".modal_capacitaciones .anio_modal_inicio").val();
    var fecha_fin    = $(".modal_capacitaciones .mes_modal_fin").val() +"-"+ $(".modal_capacitaciones .anio_modal_fin").val();

    bandera += val_text($(".namecurso_modal"));
    bandera += val_text($(".nameins_modal"));

    if(bandera == 0){

      fecha_inicio = fecha_inicio.replace(/option/g,"");
      fecha_fin = fecha_fin.replace(/option/g,"");

      $("#body_capacitacion .tr-faker").remove();

      $("#body_capacitacion").append("<tr>"+
      "<td> <input type='text' name='name_capa[]' value=\""+ curso +"\" /> </td>"+
      "<td> <input type='text' name='inst_capa[]' value=\""+ instuticion+"\" /> </td>"+
      "<td> <input type='text' name='fecha_inicio_capa[]' value=\""+ fecha_inicio+"\" /> </td>"+
      "<td> <input type='text' name='fecha_fin_capa[]' value=\""+ fecha_fin+"\" /></td>"+
      "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
      "</tr>");
      cleaner_form();
    }
  });

  $("#agregar_otros").click(function(event){
    event.preventDefault();
    var bandera = 0;

    var otro  = $(".otro_modal").val();

    bandera += val_text($(".otro_modal"));

    if(bandera == 0){

      $("#body_otros .tr-faker").remove();

      $("#body_otros").append("<tr>"+
      "<td> <input type='text' name='name_otro[]' value=\""+ otro +"\" /> </td>"+
      "<td> <a href='#' class='delete-row'>Eliminar</a> </td>"+
      "</tr>");
      cleaner_form();
    }
  });
  // Clean modales
  $(".maestro_oscuro").click(function(){
    $(".modal_formacion").removeClass("on");
    $(".modal_experiencia").removeClass("on");
    $(".modal_doctorados ").removeClass("on");

    $(".modal_idiomas").removeClass("on");
    $(".modal_informaticos").removeClass("on");
    $(".modal_capacitaciones ").removeClass("on");
    $(".modal_otros ").removeClass("on");

    $(".maestro_oscuro").removeClass("on");
  });

    $(".close-all").click(function(){
      cleaner_form();
    });
   // eliminar fila
   $(".table").on("click",".delete-row",function(){
      $(this).closest("tr").remove();
   });

   /* $(".button_form").live('click',function() {
        $("#list").append(
            '<li style="height:20px;">' +
            // Removed repetitive ID and made prova an array
            '<input type="text" class="text" name="prova[]" value="prova"></li>'
        );
    });*/
    $('.post-form').on('click', function (e) {
        e.preventDefault();
        console.log($('#SignupForm').serialize());
    });
});



// ------------- afuera de jquery -----------------

function abrir_modal( boton , modal){
  $("#"+ boton +"").click(function(){
    $(".maestro_oscuro").addClass("on");
    $("."+ modal +"").addClass("on");
  });
}

function cleaner_form(){
  $(".modal_formacion").removeClass("on");
  $(".modal_experiencia").removeClass("on");
  $(".modal_doctorados ").removeClass("on");

  $(".modal_idiomas").removeClass("on");
  $(".modal_informaticos").removeClass("on");
  $(".modal_capacitaciones ").removeClass("on");
  $(".modal_otros ").removeClass("on");

  $(".maestro_oscuro").removeClass("on");
  $(".text-modal").val("");
  $('.select-modal option[value=option]').prop('selected', true);
}


function val_text(valor){
    if( valor.val() == "") {
      valor.css("border-color","red");
      return 1;
    }else return 0;

}

function val_combo(valor){
    if( valor.val() == "option"){
      valor.css("border-color","red");
      return 1;
    }else return 0;

}



