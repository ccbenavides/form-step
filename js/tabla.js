 $(document).ready(function() {
   var dias = ["lunes","martes","miercoles","jueves","viernes","sabado"];
   var horas = ["7:30","8:20","9:10","10:00","10:50","11:10","12:00","12:50"];
   
   $(".tabla_1 td:nth-child(n+2)").click(function(){
       var column_num = parseInt( $(this).index() ) + 1;
       var row_num = parseInt( $(this).parent().index() )+1;
       
     //  $(this).not(  $( ".col-off td" ) ).toggleClass("td-on");
     //  $("tr td:nth-child(" +  column_num + ")").not(  $( ".col-off td" ) )  .toggleClass("td-on");
 //   
   
       switch (horas[ row_num -1 ]){
           
           case "7:30":
                 var elemento_bandera = $(this).parent().next().next().next().next().next().find("td:nth-child(" +  column_num + ")"); 
                 $(this).toggleClass("td-on");
                // $("tr td:nth-child(" +  column_num + ")").not(  $( ".col-off td" ) )  .toggleClass("td-on");
               if(!elemento_bandera.hasClass("td-on")){
                    $(this).parent().next().next().find("td:nth-child(" +  column_num + ")").toggleClass("td-on");
                 elemento_bandera.parent().parent().prev().find("tr").find("th:nth-child(" +  column_num + ")").find("button").text("llenar");
                    
               }else{
                 //  $(this).text("limpiar");
                 elemento_bandera.parent().parent().prev().find("tr").find("th:nth-child(" +  column_num + ")").find("button").text("limpiar");
               }
                break;
           case "9:10":
            var elemento_inicio = $(this).parent().prev().prev().find("td:nth-child(" +  column_num + ")");
            if(elemento_inicio.hasClass("td-on")){
                    elemento_inicio.removeClass("td-on");
                    elemento_inicio.parent().parent().prev().find("tr").find("th:nth-child(" +  column_num + ")").find("button").text("llenar");
                    $(this).parent().next().next().next().find("td:nth-child(" +  column_num + ")").addClass("td-on");
            }else{
            var elemento_bandera = $(this).parent().next().next().next().next().next().next().find("td:nth-child(" +  column_num + ")");
                $(this).toggleClass("td-on");
                if(!elemento_bandera.hasClass("td-on")){
                    $(this).parent().next().next().next().find("td:nth-child(" +  column_num + ")").toggleClass("td-on");
                    elemento_inicio.parent().parent().prev().find("tr").find("th:nth-child(" +  column_num + ")").find("button").text("llenar");
                    
               }else{
                   
               }
                
            }
                break;
           case "11:10":
            var elemento_bandera = $(this).parent().prev().prev().prev().prev().prev().find("td:nth-child(" +  column_num + ")");
               $(this).toggleClass("td-on");
               if(!elemento_bandera.hasClass("td-on")){
                $(this).parent().prev().prev().prev().find("td:nth-child(" +  column_num + ")").toggleClass("td-on");
                   elemento_bandera.parent().parent().prev().find("tr").find("th:nth-child(" +  column_num + ")").find("button").text("llenar");
                   
               }else{
                   elemento_bandera.parent().parent().prev().find("tr").find("th:nth-child(" +  column_num + ")").find("button").text("limpiar");
               }
                break;
           
       }
      // $(this).parent().toggleClass("td-on");
      //  alert( dias[column_num - 2] +"-" + horas[ row_num -1 ] );   
   });
   
   $(".tabla_1 button").click(function(){
         var column_num = parseInt( $(this).parent().index() ) + 1;
         //$(this).parent().parent().find("th").css("background","red");
        // alert( $(this).text() == "marcar" );
         if($(this).text() == "llenar"){
            $(this).parent().parent().parent().parent().find("td:nth-child(" +  column_num + ")").not(  $( ".col-off td" ) ).addClass("td-on");
            $(this).text("limpiar");
            
         }else{
            $(this).parent().parent().parent().parent().find("td:nth-child(" +  column_num + ")").not(  $( ".col-off td" ) ).removeClass("td-on");
            $(this).text("llenar");
             
         }
          
       //alert(column_num); 
   });
   
   //turno mañana 
   var lunes_m = "";
   var martes_m = "";
   var miercoles_m = "";
   var jueves_m = "";
   var viernes_m = "";
   var sabado_m = "";
   
   // turno tarde 
   var lunes_t = "";
   var martes_t = "";
   var miercoles_t = "";
   var jueves_t = "";
   var viernes_t = "";

   var array_col_m = [];
   /// llegan de base 
   var numero_docente = 1;
//   var numero_semestre = 1;
   function Disponibilidad(dia , id_docente , id_semestre, horas,  turno ){
       this.dia = dia;
       this.id_docente = id_docente;
       this.id_semestre = id_semestre;
       this.horas = horas;
       this.turno = turno;
   }
   $("#enviar_disponibilidad").click(function(event){

      event.preventDefault();
      
      
      // bucle mañana 
      $(".tabla_manania .row-use").each(function(value){
          $(this).find("td[rowspan=2]").each(function(values){
                  switch(value){
                     case 0 :
                        if($(this).hasClass("td-on")){
                            ( values === 0 )? lunes_m = "7:30 - 10:50":0;
                            ( values === 1 )? martes_m = "7:30 - 10:50":0;
                            ( values === 2 )? miercoles_m = "7:30 - 10:50":0;
                            ( values === 3 )? jueves_m = "7:30 - 10:50":0;
                            ( values === 4 )? viernes_m = "7:30 - 10:50":0;
                            ( values === 5 )? sabado_m = "7:30 - 10:50":0;
                        } 
                         
                     break;
                     
                     case 2 : 
                        if($(this).hasClass("td-on")){
                            
                            if( values === 0 && lunes_m.length > 0){ lunes_m = "7:30 - 12:50" } 
                            else if(values === 0){ lunes_m = "10:50 - 12:50 " }  

                            if( values === 1 && martes_m.length > 0){ martes_m = "7:30 - 12:50" }   
                            else if(values === 1){ martes_m = "10:50 - 12:50 " }  

                            if( values === 2 && miercoles_m.length > 0){ miercoles_m = "7:30 - 12:50" }   
                            else if(values === 2){ miercoles_m = "10:50 - 12:50 " }  

                            if( values === 3 && jueves_m.length > 0){ jueves_m = "7:30 - 12:50" }   
                            else if(values === 3){ jueves_m = "10:50 - 12:50 " }  

                            if( values === 4 && viernes_m.length > 0){viernes_m = "7:30 - 12:50" }   
                            else if(values === 4){ viernes_m = "10:50 - 12:50 " }  

                            if( values === 5 && sabado_m.length > 0){ sabado_m = "7:30 - 12:50" }   
                            else if(values === 5){ sabado_m = "10:50 - 12:50 " }  
                            
                        }
                        
                     break;
                     
                  
                     
                 } // fin de switch 

          });
      });
      
      // bucle tarde 
        $(".tabla_tarde .row-use").each(function(value){
          $(this).find("td[rowspan=2]").each(function(values){
                  switch(value){
                     case 0 :
                        if($(this).hasClass("td-on")){
                            ( values === 0 )? lunes_t = "7:30 - 10:50":0;
                            ( values === 1 )? martes_t = "7:30 - 10:50":0;
                            ( values === 2 )? miercoles_t = "7:30 - 10:50":0;
                            ( values === 3 )? jueves_t = "7:30 - 10:50":0;
                            ( values === 4 )? viernes_t = "7:30 - 10:50":0;
                        } 
                         
                     break;
                     
                     case 2 : 
                        if($(this).hasClass("td-on")){
                            
                            if( values === 0 && lunes_t.length > 0){ lunes_t = "7:30 - 12:50" } 
                            else if(values === 0){ lunes_t = "10:50 - 12:50 " }  

                            if( values === 1 && martes_t.length > 0){ martes_t = "7:30 - 12:50" }   
                            else if(values === 1){ martes_t = "10:50 - 12:50 " }  

                            if( values === 2 && miercoles_t.length > 0){ miercoles_t = "7:30 - 12:50" }   
                            else if(values === 2){ miercoles_t = "10:50 - 12:50 " }  

                            if( values === 3 && jueves_t.length > 0){ jueves_t = "7:30 - 12:50" }   
                            else if(values === 3){ jueves_t = "10:50 - 12:50 " }  

                            if( values === 4 && viernes_t.length > 0){viernes_t = "7:30 - 12:50" }   
                            else if(values === 4){ viernes_t = "10:50 - 12:50 " }  
                            
                        }
                        
                     break;
                     
                  
                     
                 } // fin de switch 

          });
      });
      
        (lunes_m.length) ? array_col_m.push(new Disponibilidad("lunes",numero_docente,numero_semestre,lunes_m,"M")): 0; 
        (martes_m.length) ? array_col_m.push(new Disponibilidad("martes",numero_docente,numero_semestre,martes_m,"M")): 0;
        (miercoles_m.length) ? array_col_m.push(new Disponibilidad("miercoles",numero_docente,numero_semestre,miercoles_m,"M")):0;
        (jueves_m.length)?array_col_m.push(new Disponibilidad("jueves",numero_docente,numero_semestre,jueves_m,"M")):0;
        (viernes_m.length)?array_col_m.push(new Disponibilidad("viernes",numero_docente,numero_semestre,viernes_m,"M")):0;
        (sabado_m.length)?array_col_m.push(new Disponibilidad("sabado",numero_docente,numero_semestre,sabado_m,"M")):0;
        
        (lunes_t.length) ? array_col_m.push(new Disponibilidad("lunes",numero_docente,numero_semestre,lunes_t,"T")): 0; 
        (martes_t.length) ? array_col_m.push(new Disponibilidad("martes",numero_docente,numero_semestre,martes_t,"T")): 0;
        (miercoles_t.length) ? array_col_m.push(new Disponibilidad("miercoles",numero_docente,numero_semestre,miercoles_t,"T")):0;
        (jueves_t.length)?array_col_m.push(new Disponibilidad("jueves",numero_docente,numero_semestre,jueves_t,"T")):0;
        (viernes_t.length)?array_col_m.push(new Disponibilidad("viernes",numero_docente,numero_semestre,viernes_t,"T")):0;
      var myJSONText = JSON.stringify(array_col_m);
      if(array_col_m.length == 0){
          alert("seleccione disponibilidad");
      }
      else{
      var prompo = confirm(" Mensaje de confirmación! ")
        if(prompo){
                $.ajax({
                    type: "POST",
                    url: "disponibilidad.php",
                    dataType: "json",
                    
                    data: {
                        'myJSONText': myJSONText
                    },
                    success: function(response){
                        $(".espacios").html("<h1>Registro de disponibilidad con exito</h1><h5>Semestre II</h5>");
                    },
                    error : function(){
                        $(".espacios").html("<h1>Registro de disponibilidad con exito</h1><h5>Semestre II</h5>");
                    }

                });
            
            }
      }
     

         
   });
   
 });
