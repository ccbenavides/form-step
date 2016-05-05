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
   
   $("#enviar_disponibilidad").click(function(event){
      event.preventDefault();
      alert("asdasd"); 
      
   });
   
 });
