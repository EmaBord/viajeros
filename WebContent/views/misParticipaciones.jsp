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