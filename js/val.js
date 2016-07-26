
var data = "";

$(document).ready(function() {
    
    $("#step0Next").click(function(e){
        var nombres = $("#nombres").val().toUpperCase();;
        var apellidos = $("#apellido_paterno").val().toUpperCase(); + " " + $("#apellido_materno").val().toUpperCase();;
        var dni = $("#dni").val().toUpperCase();;
        var ruc = $("#ruc").val().toUpperCase();;
        var email = $("#email").val().toUpperCase();;
        var lugar_nacimiento = $("#departamento option:selected" ).text().toUpperCase() + "-" + $("#provincia option:selected" ).text().toUpperCase() + "-" +  $("#distrito option:selected" ).text().toUpperCase() ;
        var direccion = $("#direccion").val().toUpperCase();;
        var fecha_nacimiento  = $("#fecha_dia").val().toUpperCase() + "-" + $("#fecha_mes").val().toUpperCase() + "-" + $("#fecha_anio").val().toUpperCase();
        var telefono = $("#telefono").val().toUpperCase();
        var asignatura = $("#asignatura option:selected" ).text().toUpperCase();

        /*validar_data("direccion");
        validar_data("ruc");
        validar_data("telefono");
    
        validar_seleccion("departamento");
        validar_seleccion("provincia");
        validar_seleccion("distrito");
        
        validar_fecha_sel("fecha_dia");
        validar_fecha_sel("fecha_mes");
        validar_fecha_sel("fecha_anio");*/
        
                
        
        $("#bloque_uno_datos").html(`<li> <strong> nombres :</strong> ${ nombres }</li> 
                    <li><strong>apellidos :</strong>  ${apellidos}</li> 
                    <li><strong>dni :</strong>  ${dni}</li> 
                    <li><strong>ruc :</strong>  ${ruc}</li> 
                    <li><strong>email :</strong>  ${email}</li>`);
                    
       $("#bloque_dos_datos").html(`<li> <strong>lugar nacimiento :</strong> ${ lugar_nacimiento }</li> 
                    <li><strong>direccion :</strong>  ${direccion}</li> 
                    <li><strong>fecha de nacimiento :</strong>  ${fecha_nacimiento}</li> 
                    <li><strong>telefono :</strong>  ${telefono}</li> 
                    <li><strong>asignatura :</strong>  ${asignatura}</li>`);                
                    
        
    });
    
    $("#step1Next").click(function(e){

       copia_pega("tabla_formacion_academica","add_table_fa");
        copia_pega("tabla_maestria_doctorados","add_table_md");
         copia_pega("tabla_exp_docente","add_table_ex");

       
    });
    
    $("#step2Next").click(function(e){
        copia_pega("tabla_conocimientos_idiomas","add_table_coi");
        copia_pega("tabla_conocimientos_info","add_table_ci");
        copia_pega("tabla_capacitaciones","add_table_cap");
        copia_pega("tabla_otros_datos","add_table_odi");
        

    });
    
    
    
    $("#step2Prev").click(function(){
        $("#add_table_fa .tabla_formacion_academica").remove();
        $("#add_table_md .tabla_maestria_doctorados").remove();
        $("#add_table_ex .tabla_exp_docente").remove();
    });
    
     $("#step3Prev").click(function(){
        $("#add_table_coi .tabla_conocimientos_idiomas").remove();
        $("#add_table_ci .tabla_conocimientos_info").remove();
        $("#add_table_cap .tabla_capacitaciones").remove();
        $("#add_table_odi .tabla_otros_datos").remove();
    });
});


function validar_data(id){
       if( $("#"+ id).val() == ""){ 
            $("#step1Prev").click(); 
            $("#" + id).addClass("color_de_error"); 
        }else {
            $("#" + id).removeClass("color_de_error"); 
            
        }
}

function validar_seleccion(id){
    if($("#" + id + " option:selected" ).text().toUpperCase() == "SELECCIONE"){ 
            $("#step1Prev").click(); 
            $("#" + id).addClass("color_de_error"); 
        }else {
            $("#" + id).removeClass("color_de_error"); 
            
        }
}

function validar_fecha_sel(id){
       if($("#" + id + " option:selected" ).val() == "option"){ 
            $("#step1Prev").click(); 
            $("#" + id).addClass("color_de_error"); 
        }else {
            $("#" + id).removeClass("color_de_error"); 
            
        }
}

function copia_pega(id1, id2){
        data = $('.' + id1 ).clone();
        if(data.find("td").html() == " - "){
            $('#' + id2 ).parent().prev().hide();
            $('#' + id2 ).parent().hide();
        }else{
            $('#' + id2 ).parent().prev().show();
            $('#' + id2 ).parent().show();
            data.find('tr th:last-child, tr td:last-child').remove();
            data.find('input[type=text]').removeAttr('name');
            data.appendTo('#' + id2 );
            
        }
}