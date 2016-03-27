<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import="model.evento.Evento"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:baseAdmin>
<jsp:attribute name="evento">
		active
	</jsp:attribute>
	<jsp:attribute name="eventos">
		class="active"
	</jsp:attribute>
<jsp:body>	 
		<script type="text/javascript" src="./datetimepicker-material/js/moment-with-locales.js"></script>
		<script type="text/javascript" src="./datetimepicker-material/js/bootstrap-material-datetimepicker.js"></script>
		<script>
  		
  			function format(string){
  				var data = string.split("/");
  				var fecha = data[2]+"/"+data[1]+"/"+data[0];
  				return fecha;			
  			
  			}
  		</script>         
     	<!-- Content Header (Page header) -->
    	<section class="content-header">
  			<h1>Eventos<small>activos</small></h1>  		
  			<ol class="breadcrumb">
	        	<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
	        	<li class="active">Lista de eventos</li>
     		 </ol>
  		</section>  		  
  	    <!-- Main content -->
  		<section class="content">
  			<c:if test="${not empty update_evento}">	
  				<div class="row">
  					
  					<div class="col-sm-6">
  						<div class="alert alert-success alert-dismissable">
                   			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    		<h4>	<i class="icon fa fa-check"></i> Todo ok!</h4>
                    		${update_evento}
                    	</div>
                  
  				</div>
  			</c:if>
  			<!-- row -->
    			<div class="row">
    				<div class="col-xs-12">
		    				<div class="box">
					              <div class="box-header">
					                <h3 class="box-title">Lista de eventos</h3>
					              </div><!-- /.box-header -->
					              <div class="box-body">
					                <table id="eventos" class="table table-bordered table-striped">
					                  <thead>
					                    <tr class="success">
					                      <th>Nombre</th>
					                      <th>Fecha y Hora</th>
					                      <th>Lugar</th>										                        
					                      <th>Sitio Web</th>
					                      <th>Operacion</th>
					                      
					                    </tr>
					                  </thead>
					                  <tbody>
					                  	<c:forEach items="${eventos}" var="evento">
					                  		<tr>
					                  			<td >${evento.nombre}</td>					                  														
					                  			<td >${evento.fecha} ${evento.hora}</td>
					                  			<td >${evento.lugar}</td>
					                  			<td >${evento.sitio_web}</td>
					                  			<td>
					                  				<div class="row">
					                  					<div class="col-sm-3">					                  						
					                  							<button type="button" 	 data-toggle="modal" data-target="#${evento.id}" class="btn btn-warning"><i class="fa fa-edit"></i></button>
					                  							<div class="modal fade" id="${evento.id}" role="dialog">
              														<div class="modal-dialog ">
                														<div class="modal-content">
                															
                  															<div class="modal-header">
                    															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    															<h4 class="modal-title">Modificar ${evento.nombre}</h4>
                  															</div>
                  															<div class="modal-body ">
                        														<div class="row">
                        														<form role="form" class="form-horizontal"method = 'post' action ='../updateEvento' id=form${evento.id}  data-toggle="validator">
                                                      										<fieldset>                                                                 								
                                                                 								<input type="hidden" name='clave' value="${evento.id }"/>  
                                                                 								<table class="col-md-offset-1">
                                                                 									<tbody>
                                                                 									<tr>
                                                                 										<td><label>Dia y hora del evento <div class="text-danger">(reconfirmar)</div> </label></td>
                                                                 										<td><input type="text" name='fecha'  class="form-control " id="datetimepicker${evento.id}" placeholder="${evento.fecha} ${evento.hora}" required /></td>
                                                                 									</tr>
                                                                 									<tr>
                                                                 										<td><label>Nombre del evento: <div class="help-block with-errors"></div></label></td>
                                                                 										<td><input type="text" name='nombre' id="nombreform${evento.id}" class="form-control" id="inputNombre" value="${evento.nombre}" autofocus required data-error="No puede quedar en blanco el nombre"/></td>
                                                                 									</tr>
                                                                 									<br>
                                                                 									<tr>
                                                                 										<td><label>Lugar/Dirección: <div class="help-block with-errors"></div></label></td>
                                                                 										<td><input type="text" class="form-control"  name='lugar'id="lugarform${evento.id}" value="${evento.lugar }" required data-error="No puede quedar en blanco el lugar"/></td>
                                                                 									</tr>
                                                                 									<br>
                                                                 									<tr>
                                                                 										<td><label>Sitio Web: <div class="help-block with-errors"></div></label></td>
                                                                 										<td><input type="text" class="form-control" id="inputSitio" name='sitioweb'value="${evento.sitio_web }"/></td>
                                                                 									</tr>
                                                                 									</tbody>
                                                                 								</table>
                                                                 								
                                                                 								
                                                                 								
                                                                 							    
                                                                 								
                                                                 								
                                                                 								
                                                                 								
    																							                                                        								
                                                                 	
                                                                							</fieldset>
                                                                						
                                                               							<script type="text/javascript">
                                                               								var dateString = "${evento.fecha} ${evento.hora}";
																							var reggie = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2})/;
																							var dateArray = reggie.exec(dateString); 
																							var date = new Date(
    																						(+dateArray[1]),
																						    (+dateArray[2])-1, // Careful, month starts at 0!
    																						(+dateArray[3]),
    																						(+dateArray[4]),
    																						(+dateArray[5]),
    																						(+dateArray[6])
																							);
                                                              								var id= "#datetimepicker"+"${evento.id}";
                                                              								$("#datetimepicker"+"${evento.id}").bootstrapMaterialDatePicker({
																									format : 'DD-MM-YYYY HH:mm',        	   
	        	   																					
	          	 																					lang:'es',
	          	 																			
                																					minDate:new Date(),
                																				
                                                                    						});
                                                    	          	 						
                                                    	          	 						
                                                    									</script>  
                                                    	 		
                                                           							
                                                       							</div><!-- /.row -->                  															
                  															</div>
                  															<div class="modal-footer">
                  															
                                                                 				
                    															<button type="button" class="btn btn-danger  pull-left" data-dismiss="modal">Cancelar</button>
                    															<button type="button" class="btn bg-olive " onclick="verificar('datetimepicker${evento.id}','form${evento.id}')">Guardar cambios</button>
                  															</div>
                  															
                  															</form>
                  															
                														</div><!-- /.modal-content -->
              														</div><!-- /.modal-dialog -->
            													</div><!-- /.modal -->
          													
					                  					</div>
					                  					<div class="col-sm-2">
					                  						<form method="post" action=../deleteEvento id='delete${evento.id}'>
					                  							<input type="hidden" name="clave" value="${evento.id}"/>
                  												<button type="button" class="btn btn-danger" onclick="eliminar('delete${evento.id}')"><i class="fa fa-remove"></i></button>
                  											</form>
                  										<div>
                  									<div>
					                  			</td>					                  		
					                  		</tr>
					                  		
					                  			
					                  		
					                  	</c:forEach>
					                    
					                  </tbody>
					                  <tfoot>
					                    <tr class="success">
					                      <th>Nombre</th>
					                      <th>Fecha Y Hora</th>
					                      <th>Lugar</th>										                        
					                      <th>Sitio Web</th>
					                      <th>Operacion</th>
					                    </tr>
					                  </tfoot>
					                </table>
					              </div><!-- /.box-body -->
		            		</div><!-- /.box -->
          			</div><!-- /.col -->
              </div><!-- /.row -->
  		</section><!-- /.content -->
  		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
      <script src="./js/validator.js"></script>
  		<script>
  		$(function () {
        
        $('#eventos').DataTable({
          "paging": true,
          "lengthChange": true,
          "searching": true,
          "ordering": true,
          "info": true,
          "autoWidth": false,
          "select": true,
          
          "language":{
        	    "decimal":        "",
        	    "emptyTable":     "Datos no encontrados",
        	    "info":           "Mostrando  _END_ de _TOTAL_ entradas",
        	    "infoEmpty":      "Mostrando 0 de 0 of 0 filas",
        	    "infoFiltered":   "(filtrado desde _MAX_ filas)",
        	    "infoPostFix":    "",
        	    "thousands":      ",",
        	    "lengthMenu":     "Mostrar _MENU_ filas",
        	    "lface"		:     "pepe",
        	    "faceoadingRecords": "Cargando...",
        	    "processing":     "Procesando...",
        	    "search":         "Buscar: ",
        	    "zeroRecords":    "0 resultados",
        	    "paginate": {
        	        "first":      "Primero",
        	        "last":       "Ultimo",
        	        "next":       "Siguiente",
        	        "previous":   "Anterior"
        	    },
        	    "aria": {
        	        "sortAscending":  ": activate to sort column ascending",
        	        "sortDescending": ": activate to sort column descending"
        	    }
        	}
          
          
        });
      });
      </script>
      
	  
	  <script>
		function verificar(iddp,idform){
	
			if (document.getElementById(iddp).value){
				if (document.getElementById("nombre"+idform).value){
					if (document.getElementById("lugar"+idform).value){
						document.getElementById(idform).submit();
					}else{
						alert("El campo lugar no puede estar vacío");
					}
				}else{
				     alert("El campo nombre no puede quedar vacío");
				     }
			}else{
				alert("Debe reconfirmar el dia y la hora para el evento");	
			}
					
		}

	</script>
     <script>
	function eliminar(idform){
		var r = confirm("Seguro desea eliminar el evento?");
		if (r == true) {
    		document.getElementById(idform).submit();
		}
		
	}

</script>
  	  
  	  			
</jsp:body>	
</t:baseAdmin>