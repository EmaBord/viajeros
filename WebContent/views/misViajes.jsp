<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.i18n" />
<t:baseViajero>
<jsp:attribute name="mis_viajes">
		class="active"
	</jsp:attribute>
<jsp:body>	
<!-- Content Header (Page header) -->
  		<script type="text/javascript" src="./datetimepicker-material/js/moment-with-locales.js"></script>
		<script type="text/javascript" src="./datetimepicker-material/js/bootstrap-material-datetimepicker.js"></script>	
<section class="content-header">
	<h1><fmt:message key="mis_viajes" /></h1>  		
	<ol class="breadcrumb">
    	<li><a href="/viajeros/"><i class="fa fa-dashboard"></i> Home</a></li>
    	<li class="active"><fmt:message key="mis_viajes" /></li>
	</ol>
</section>
<section class="content">
  			<c:if test="${not empty update_viaje}">	
  				<div class="row">
  					
  					<div class="col-sm-6">
  						<div class="alert alert-success alert-dismissable">
                   			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    		<h4>	<i class="icon fa fa-check"></i> <fmt:message key="todo_ok" /></h4>
							<fmt:message key="update_viaje" />
                    	</div>
                  
  				</div>
  			</c:if>
  			<!-- row -->
    			<div class="row">
    				<div class="col-xs-12">
		    				<div class="box">
					              <div class="box-header">
					                <h3 class="box-title"><fmt:message key="mis_viajes_listado_unico" /></h3>
					              </div><!-- /.box-header -->
					              <div class="box-body table-responsive">
					                <table id="viajes" class="table table-bordered table-striped">
					                  <thead>
					                    <tr class="success">
					                      <th><fmt:message key="viaje_sale" /></th>
					                      <th><fmt:message key="viaje_desde" /></th>
					                      <th><fmt:message key="viaje_hasta" /></th>										                        
					                      <th><fmt:message key="viaje_llega" /></th>
					                      <th><fmt:message key="evento" /></th>
					                      <th><fmt:message key="asientos_disponibles" /></th>
					                      <th><fmt:message key="viajan" /></th>
					                      <th><fmt:message key="ruta_gmaps" /></th>
					                      <th><fmt:message key="operacion" /></th>
					                      
					                      
					                    </tr>
					                  </thead>
					                  <tbody>
					                  	<c:forEach items="${recorridosUnicos}" var="viaje">
					                  		<tr>
					                  			<td >${viaje.salida}</td>					                  														
					                  			<td >${viaje.desde}</td>
					                  			<td >${viaje.hasta}</td>
					                  			<td >${viaje.llegada}</td>
					                  			<td >${viaje.evento.nombre}</td>
					                  			<td >${viaje.asientos}</td>
					                  			
					                  			<td>
					                  				<c:if test="${not empty viaje.viajeros}">
					                  					<c:forEach items="${viaje.viajeros}" var="viajero">
					                  						${viajero.nombre },
					                  					</c:forEach>
					                  				</c:if>
					                  				<c:if test="${empty viaje.viajeros}">
					                  					0
					                  				</c:if>
					                  			</td>
					                  			<td>
					                  				<c:if test="${not empty viaje.urlMaps}">
					                  					<a class="btn  margin" data-toggle="modal" data-target="#${viaje.id}ruta" ><i class="material-icons">navigation</i></a>
					                  					<div class="modal fade" id="${viaje.id}ruta" role="dialog">
              														<div class="modal-dialog ">
                														<div class="modal-content">
                															
                  															<div class="modal-header">
                    															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    															<h4 class="modal-title"><fmt:message key="url_maps" /> 
                    																<small class="label label-info">
                    																
                    																	${viaje.desde } - ${viaje.hasta }
                    																</small>
                    															</h4>
                  															</div>
                  															<div class="modal-body ">
                  																<div class="embed-responsive embed-responsive-16by9">
                  																	<iframe src="${viaje.urlMaps}"  frameborder="0" style="border:0" allowfullscreen></iframe>
                  																</div>
                  															</div>
                  														</div>
                  													</div>
                  										</div>
                        								
					                  				</c:if>
					                  			</td>
					                  			
					                  			<td>
					                  				<div class="row">
					                  					<div class="col-sm-4">	
					                  							<button class="btn  bg-purple margin" data-toggle="modal" data-target="#${viaje.id}update" ><i class="material-icons">edit</i></button>				                  						
					                  							<div class="modal  fade " id="${viaje.id}update" role="dialog">
					                  							
              														<div class="modal-dialog  ">
                														<div class="modal-content ">
                															
                  															<div class="modal-header">
                    															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    															<h4 class="modal-title"><fmt:message key="modificar" />
                    																<small class="label label-info">
                    																
                    																	${viaje.desde } - ${viaje.hasta }
                    																</small>
                    															</h4>
                  															</div>
                  															<div class="modal-body ">
                        														<div class="row">
                        														<form role="form" class="form-horizontal"method = 'post' action ='../actualizar_viaje' id=form${viaje.id}  data-toggle="validator">
                                                      										<fieldset>                                                                 								
                                                                 								<input type="hidden" name='clave' value="${viaje.id }"/>  
                                                                 								
                                                                 								<table class="col-md-offset-1">
                                                                 									<tbody>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="salida_a" /> </label></td>
                                                                 										<td><input type="text" name='salida'  class="form-control " id="datetimepicker${viaje.id}start" placeholder="${viaje.salida}"/></td>
                                                                 									</tr>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="viaje_llegada" />   </label></td>
                                                                 										<td><input type="text" name='llegada'  class="form-control " id="datetimepicker${viaje.id}stop" placeholder="${viaje.llegada}"  /></td>
                                                                 									</tr>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="viaje_desde" />: </label></td>
                                                                 										<td><input type="text" name='desde' class="form-control"  id="desdeform${viaje.id}" value="${viaje.desde }"/></td>
                                                                 									</tr>
                                                                 									<br>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="viaje_en" />: </label></td>
                                                                 										<td><input type="text" name='hasta' id="hastaform${viaje.id}" class="form-control" value="${viaje.hasta}"/></td>
                                                                 									</tr>
                                                                 									<br>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="asientos_disponibles" />: </label></td>
                                                                 										<td><input type="number" step="1" min="1" id="asientosform${viaje.id}" name='asientos' class="form-control" value="${viaje.asientos}" /></td>
                                                                 									</tr>
					                                                                                  <br>
					                                                                                  <tr>
					                                                                                    <td><label><fmt:message key="viaje_gmaps_url" />: </label></td>
					                                                                                    <td><input type="text" name='ruta' class="form-control" value="${viaje.urlMapsPura}" /></td>
					                                                                                  </tr>
                                                                 									</tbody>
                                                                 								</table>
                                                                 								
                                                                 								
                                                                 								
                                                                 							    
                                                                 								
                                                                 								
                                                                 								
                                                                 								
    																							                                                        								
                                                                 	
                                                                							</fieldset>
                                                                						
	                                                               							<script type="text/javascript">
	                                                               							
	                                                              								$("#datetimepicker${viaje.id}start").bootstrapMaterialDatePicker({
																										format : 'DD-MM-YYYY HH:mm',        	   
		        	   																					lang:'${language}',
		          	 																					minDate:new Date(),
	                																				
	                                                                    						});
	                                                              								$("#datetimepicker${viaje.id}stop").bootstrapMaterialDatePicker({
																									format : 'DD-MM-YYYY HH:mm',        	   
	        	   																					lang:'${language}',
	          	 																					minDate:new Date(),
                																				
                                                                    						});
	                                                    	          	 						
	                                                    	          	 						
	                                                    									</script>  
                                                    	 		
                                                           							
                                                       							</div>                  															
                  															</div>
                  															<div class="modal-footer">
                  															
                                                                 				
                    															<button type="button" class="btn btn-danger  pull-left" data-dismiss="modal"><fmt:message key="cancelar" /></button>
                    															<button type="button" class="btn bg-olive " onclick="verificar('form${viaje.id}')"><fmt:message key="guardar" /></button>
                  															</div>
                  															
                  															</form>
                  															
                														</div>
              														</div>
            													</div>
          													
					                  					</div>
					                  					<div class="col-sm-4">
					                  						<form method="post" action=../eliminar_viaje id='delete${viaje.id}'>
					                  							<input type="hidden" name="clave" value="${viaje.id}"/>
                  												<button type="button" class="btn bg-orange margin" onclick="eliminar('delete${viaje.id}')"><i class="material-icons">remove_circle_outline</i></button>
                  											</form>
                  										<div>
                  									<div>
					                  			</td>				                  		
					                  		</tr>
					                  		
					                  			
					                  		
					                  	</c:forEach>
					                  	
					                  	
					                  	<c:forEach items="${recorridosMasUnDia}" var="viaje">
					                  		<tr>
					                  			<td >${viaje.salida}</td>					                  														
					                  			<td >${viaje.desde}</td>
					                  			<td >${viaje.hasta}</td>
					                  			<td >${viaje.llegada}</td>
					                  			<td >${viaje.evento.nombre}</td>
					                  			<td >${viaje.asientos}</td>
					                  			
					                  			<td>
					                  				<c:if test="${not empty viaje.viajeros}">
					                  					<c:forEach items="${viaje.viajeros}" var="viajero">
					                  						${viajero.nombre },
					                  					</c:forEach>
					                  				</c:if>
					                  				<c:if test="${empty viaje.viajeros}">
					                  					0
					                  				</c:if>
					                  			</td>
					                  			<td>
					                  				<c:if test="${not empty viaje.urlMaps}">
					                  					<a class="btn  margin" data-toggle="modal" data-target="#${viaje.id}ruta" ><i class="material-icons">navigation</i></a>
					                  					<div class="modal fade" id="${viaje.id}ruta" role="dialog">
              														<div class="modal-dialog ">
                														<div class="modal-content">
                															
                  															<div class="modal-header">
                    															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    															<h4 class="modal-title"><fmt:message key="url_maps" /> 
                    																<small class="label label-info">
                    																
                    																	${viaje.desde } - ${viaje.hasta }
                    																</small>
                    															</h4>
                  															</div>
                  															<div class="modal-body ">
                  																<div class="embed-responsive embed-responsive-16by9">
                  																	<iframe src="${viaje.urlMaps}"  frameborder="0" style="border:0" allowfullscreen></iframe>
                  																</div>
                  															</div>
                  														</div>
                  													</div>
                  										</div>
                        								
					                  				</c:if>
					                  			</td>
					                  			
					                  			<td>
					                  				<div class="row">
					                  					<div class="col-sm-4">	
					                  							<button class="btn  bg-purple margin" data-toggle="modal" data-target="#${viaje.id}update" ><i class="material-icons">edit</i></button>				                  						
					                  							<div class="modal fade" id="${viaje.id}update" role="dialog">
					                  							
              														<div class="modal-dialog ">
                														<div class="modal-content">
                															
                  															<div class="modal-header">
                    															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    															<h4 class="modal-title"><fmt:message key="modificar" />
                    																<small class="label label-info">
                    																
                    																	${viaje.desde } - ${viaje.hasta }
                    																</small>
                    															</h4>
                  															</div>
                  															<div class="modal-body ">
                        														<div class="row">
                        														<form role="form" class="form-horizontal"method = 'post' action ='../actualizar_viaje' id=form${viaje.id}  data-toggle="validator">
                                                      										<fieldset>                                                                 								
                                                                 								<input type="hidden" name='clave' value="${viaje.id }"/>  
                                                                 								
                                                                 								<table class="col-md-offset-1">
                                                                 									<tbody>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="salida_a" /> </label></td>
                                                                 										<td><input type="text" name='salida'  class="form-control " id="datetimepicker${viaje.id}start" placeholder="${viaje.salida}"/></td>
                                                                 									</tr>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="viaje_llegada" />   </label></td>
                                                                 										<td><input type="text" name='llegada'  class="form-control " id="datetimepicker${viaje.id}stop" placeholder="${viaje.llegada}"  /></td>
                                                                 									</tr>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="viaje_desde" />: </label></td>
                                                                 										<td><input type="text" name='desde' class="form-control"  id="desdeform${viaje.id}" value="${viaje.desde }"/></td>
                                                                 									</tr>
                                                                 									<br>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="viaje_en" />: </label></td>
                                                                 										<td><input type="text" name='hasta' id="hastaform${viaje.id}" class="form-control" value="${viaje.hasta}"/></td>
                                                                 									</tr>
                                                                 									<br>
                                                                 									<tr>
                                                                 										<td><label><fmt:message key="asientos_disponibles" />: </label></td>
                                                                 										<td><input type="number" step="1" min="1" id="asientosform${viaje.id}" name='asientos' class="form-control" value="${viaje.asientos}" /></td>
                                                                 									</tr>
					                                                                                  <br>
					                                                                                  <tr>
					                                                                                    <td><label><fmt:message key="viaje_gmaps_url" />: </label></td>
					                                                                                    <td><input type="text" name='ruta' class="form-control" value="${viaje.urlMapsPura}" /></td>
					                                                                                  </tr>
					                                                                                  <br>
					                                                                                  <tr>
					                                                                                    <td><label><fmt:message key="viaje_finaliza_dia"/>: </label></td>
					                                                                                    <td><input type="text" name="finaliza" id='date-end${viaje.id }' class="form-control" value="${viaje.finaliza }" /></td>
					                                                                                  </tr>
                                                                 									</tbody>
                                                                 								</table>
                                                                 								
                                                                 								
                                                                 							    
                                                                 								
                                                                 								
                                                                 								
                                                                 								
    																							                                                        								
                                                                 	
                                                                							</fieldset>
                                                                						
	                                                               							<script type="text/javascript">
	                                                               							
	                                                              								$("#datetimepicker${viaje.id}start").bootstrapMaterialDatePicker({
																										format : 'DD-MM-YYYY HH:mm',        	   
		        	   																					lang:'${language}',
		          	 																					minDate:new Date(),
	                																				
	                                                                    						});
	                                                              								$("#datetimepicker${viaje.id}stop").bootstrapMaterialDatePicker({
																									format : 'DD-MM-YYYY HH:mm',        	   
	        	   																					lang:'${language}',
	          	 																					minDate:new Date(),
                																				
                                                                    						});
	                                                              								$("#date-end${viaje.id}").bootstrapMaterialDatePicker({
																									format : 'DD-MM-YYYY HH:mm',        	   
	        	   																					lang:'${language}',
	          	 																					minDate:new Date(),
                																				
                                                                    						});
	                                                    	          	 						
	                                                    	          	 						
	                                                    									</script>  
                                                    	 		
                                                           							
                                                       							</div>                  															
                  															</div>
                  															<div class="modal-footer">
                  															
                                                                 				
                    															<button type="button" class="btn btn-danger  pull-left" data-dismiss="modal"><fmt:message key="cancelar" /></button>
                    															<button type="button" class="btn bg-olive " onclick="verificar('form${viaje.id}')"><fmt:message key="guardar" /></button>
                  															</div>
                  															
                  															</form>
                  															
                														</div>
              														</div>
            													</div>
          													
					                  					</div>
					                  					<div class="col-sm-4">
					                  						<form method="post" action=../eliminar_viaje id='delete${viaje.id}'>
					                  							<input type="hidden" name="clave" value="${viaje.id}"/>
                  												<button type="button" class="btn bg-orange margin" onclick="eliminar('delete${viaje.id}')"><i class="material-icons">remove_circle_outline</i></button>
                  											</form>
                  										<div>
                  									<div>
					                  			</td>				                  		
					                  		</tr>
					                  		
					                  			
					                  		
					                  	</c:forEach>
					                    
					                  </tbody>
					                  <tfoot>
					                    <tr class="success">
					                      <th><fmt:message key="viaje_sale" /></th>
					                      <th><fmt:message key="viaje_desde" /></th>
					                      <th><fmt:message key="viaje_hasta" /></th>										                        
					                      <th><fmt:message key="viaje_llega" /></th>
					                      <th><fmt:message key="evento" /></th>
					                      <th><fmt:message key="asientos_disponibles" /></th>
					                      <th><fmt:message key="viajan" /></th>
					                      <th><fmt:message key="url_maps" /></th>
					                      <th><fmt:message key="operacion" /></th>
					                    </tr>
					                  </tfoot>
					                </table>
					              </div><!-- /.box-body -->
		            		</div><!-- /.box -->
          			</div><!-- /.col -->
              </div><!-- /.row -->
  		</section><!-- /.content -->
  		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>

  		

  		<script>
  		$(function () {
        
        $('#viajes').DataTable({
          "paging": true,
          "lengthChange": true,
          "searching": true,
          "ordering": true,
          "info": true,
          "autoWidth": false,
          "select": true,
          
          "language":{
        	    "decimal":        "",
        	    "emptyTable":     "<fmt:message key="datos_no_encontrados" />",
        	    "info":           "<fmt:message key="mostrando" />  _END_ de _TOTAL_ <fmt:message key="entradas" />",
        	    "infoEmpty":      "<fmt:message key="mostrando" /> 0 <fmt:message key="de" /> 0 <fmt:message key="filas" />",
        	    "infoFiltered":   "(<fmt:message key="filtrado" /> <fmt:message key="desde" /> _MAX_ <fmt:message key="filas" />)",
        	    "infoPostFix":    "",
        	    "thousands":      ",",
        	    "lengthMenu":     "<fmt:message key="mostrando" /> _MENU_ <fmt:message key="filas" />",
        	    "faceoadingRecords": "<fmt:message key="cargando" />...",
        	    "processing":     "<fmt:message key="procesando" />...",
        	    "search":         "<fmt:message key="buscar" />: ",
        	    "zeroRecords":    "0 <fmt:message key="resultados" />",
        	    "paginate": {
        	        "first":      "<fmt:message key="primero" />",
        	        "last":       "<fmt:message key="ultimo" />",
        	        "next":       "<fmt:message key="siguiente" />",
        	        "previous":   "<fmt:message key="anterior" />"
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

		function verificar(idform){
	
		
				if (document.getElementById("desde"+idform).value){
					if (document.getElementById("hasta"+idform).value){
						if (document.getElementById("asientos"+idform).value){
							document.getElementById(idform).submit();
						}else{
							alert('<fmt:message key="viaje_asientos_error" />');
						}
					}else{
						alert('<fmt:message key="viaje_hasta_error" />');
					}
				}else{
				     alert('<fmt:message key="viaje_desde_error" />');
				     }
			
					
		}

	</script>
     <script>
	function eliminar(idform){
		var r = confirm('<fmt:message key="viaje_pregunta_eliminar" />');
		if (r == true) {
    		document.getElementById(idform).submit();
		}
		
	}

</script>

</jsp:body>
</t:baseViajero>