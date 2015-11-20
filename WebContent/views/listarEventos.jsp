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
					                      <th>Fecha</th>
					                      <th>Hora</th>
					                      <th>Lugar</th>										                        
					                      <th>Sitio Web</th>
					                      <th>Operacion</th>
					                      
					                    </tr>
					                  </thead>
					                  <tbody>
					                  	<c:forEach items="${eventos}" var="evento">
					                  		<tr>
					                  			<td>${evento.nombre}</td>					                  														
					                  			<td>${evento.fecha}</td>
					                  			<td>${evento.hora}</td>
					                  			<td>${evento.lugar}</td>
					                  			<td>${evento.sitio_web}</td>
					                  			<td>Editar - Borrar</td>
					                  		
					                  		</tr>
					                  	</c:forEach>
					                    
					                  </tbody>
					                  <tfoot>
					                    <tr class="success">
					                      <th>Nombre</th>
					                      <th>Fecha</th>
					                      <th>Hora</th>
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
  		<script>
  		$(function () {
        
        $('#eventos').DataTable({
          "paging": true,
          "lengthChange": true,
          "searching": true,
          "ordering": true,
          "info": true,
          "autoWidth": true,
          "select": true,
          
          "language":{
        	    "decimal":        "",
        	    "emptyTable":     "Datos no encontrados",
        	    "info":           "Mostrando _START_ a _END_ de _TOTAL_ entradas",
        	    "infoEmpty":      "Mostrando 0 de 0 of 0 filas",
        	    "infoFiltered":   "(filtrado desde _MAX_ filas)",
        	    "infoPostFix":    "",
        	    "thousands":      ",",
        	    "lengthMenu":     "Mostrar _MENU_ filas",
        	    "loadingRecords": "Cargando...",
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
</jsp:body>	
</t:baseAdmin>