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
<jsp:attribute name="participaciones">
		class="active"
	</jsp:attribute>
<jsp:body>	
<!-- Content Header (Page header) -->
	
<section class="content-header">
	<h1><fmt:message key="mis_participaciones" /></h1>  		
	<ol class="breadcrumb">
    	<li><a href="/viajeros/"><i class="fa fa-dashboard"></i> Home</a></li>
    	<li class="active"><fmt:message key="mis_participaciones" /></li>
	</ol>
</section>
<section class="content">
  			<c:if test="${not empty existe}">	
  				<div class="row">
  					
  					<div class="col-sm-6">
  						<div class="alert alert-success alert-dismissable">
                   			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    		<h4>	<i class="icon fa fa-check"></i> ${existe }</h4>
							
                    	</div>
                  
  				</div>
  				</div>
  				</c:if>
  			<!-- row -->
    			<div class="row">
    				<div class="col-xs-12">
		    				<div class="box">
					              <div class="box-header">
					                
					              </div><!-- /.box-header -->
					              <div class="box-body table-responsive">
					                <table id="partic" class="table table-bordered table-striped">
					                  <thead>
					                    <tr class="success">
					                      
					                      <th><fmt:message key="viaje_sale" /></th>
					                      <th><fmt:message key="viaje_desde" /></th>
					                      <th><fmt:message key="viaje_hasta" /></th>										                        
					                      <th><fmt:message key="viaje_llega" /></th>
					                      <th><fmt:message key="evento" /></th>
					                      <th><fmt:message key="asientos_disponibles" /></th>
					                      <th><fmt:message key="estado" /></th>
					                      <th><fmt:message key="calificar" /></th>
					                      <th><fmt:message key="denunciar" /></th>
					                      
					                      
					                    </tr>
					                  </thead>
					                  <tbody>
					                  	<c:forEach items="${pendientes}" var="pendiente">
					                  		<tr>
					                  				
					                  			<td >${pendiente.recorrido.salida}</td>					                  														
					                  			<td >${pendiente.recorrido.desde}</td>
					                  			<td >${pendiente.recorrido.hasta}</td>
					                  			<td >${pendiente.recorrido.llegada}</td>
					                  			<td >${pendiente.recorrido.evento.nombre}</td>
					                  			<td >${pendiente.recorrido.asientos}</td>
					                 			
					                  			<td >
					                  				<button class="btn btn-xs btn-warning"><i class="material-icons">flag</i></button>
					                  				 
					                  			</td>
					                  			<td></td>
					                  			<td></td>
					                  			
					                  		</tr>
					                  			
					                  		
					                  	</c:forEach>
					                  	
					                  	
					                  	<c:forEach items="${viajeros}" var="viajero">
					                  		<tr>
					                  			
					                  			<td >${viajero.recorrido.salida}</td>					                  														
					                  			<td >${viajero.recorrido.desde}</td>
					                  			<td >${viajero.recorrido.hasta}</td>
					                  			<td >${viajero.recorrido.llegada}</td>
					                  			<td >${viajero.recorrido.evento.nombre}</td>
					                  			<td >${viajero.recorrido.asientos}</td>
					                  			
					                  			<td class="text-success">
					                  				<button class="btn btn-xs btn-success"><i class="material-icons">flag</i></button>
					                  				
					                  			</td>
					                  			<td>
					                  				<div class="col-sm-4">
					                  				<form method="post" action="../calificar_mal">
					                  					<button class="btn btn-default btn-xs btn-danger"><i class="material-icons">sentiment_dissatisfied</i></button>
					                  					<input name="viajero" value="${viajero.id }" type="hidden">
					                  				</form>
					                  				</div>
					                  				<div class="col-sm-4">
					                  				<form method="post" action="../calificar_reg">
					                  					<button class="btn btn-default btn-xs btn-warning"><i class="material-icons">sentiment_neutral</i></button>
					                  					<input name="viajero" value="${viajero.id }" type="hidden">
					                  				</form>
					                  				</div>
					                  				<div class="col-sm-4">
					                  				<form method="post" action="../calificar_ok">
					                  					<input name="viajero" value="${viajero.id }" type="hidden">
					                  					<button class="btn btn-default btn-xs btn-success"><i class="material-icons">sentiment_satisfied</i></button>
					                  				</form>
					                  				</div>
					                  			</td>
					                  			<td>
					                  				<button data-toggle="modal" data-target="#${viajero.id}" class="btn btn-default btn-xs btn-danger"><i class="material-icons">pan_tool</i></button>
					                  				<div class="modal fade" id="${viajero.id}" role="dialog">
              														<div class="modal-dialog ">
                														<div class="modal-content">                															
                  															<div class="modal-header">
                    															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    															<h4 class="modal-title"><fmt:message key="realizar_denuncia" /> 
                    																
                    															</h4>
                  															</div>
                  															<div class="modal-body ">
                  																<form method="post" action="../denuncia">
                  																	<input type="hidden" value="${ viajero.id}" name="viajero">
                  																	<div class="form-group"> 
	                  																	<label>Denuncia</label>
	                  																	<textarea class="form-control" name="texto" rows="7"   style="width:100%;" required></textarea>
                  																	</div>
                  																              															
                  															</div>
                  															<div class="modal-footer">
                  															
                                                                 				
                    															<button type="button" class="btn btn-danger  pull-left" data-dismiss="modal"><fmt:message key="cancelar" /></button>
                    															<button type="submit" class="btn bg-olive " ><fmt:message key="denunciar" /></button>
                  															</div>
                  															</form>  
                  															
                  													</div>
                  										</div>
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
					                      <th><fmt:message key="estado" /></th>
					                      <th><fmt:message key="calificar" /></th>
					                      <th><fmt:message key="denunciar" /></th>
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
        
        $('#partic').DataTable({
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
      
	  
	  
</jsp:body>
</t:baseViajero>