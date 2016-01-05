<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import="model.evento.Evento"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<t:baseAdmin>
<jsp:attribute name="viajeros">
		class="active"
</jsp:attribute>
	
<jsp:body>	 
		
		        
     	<!-- Content Header (Page header) -->
    	<section class="content-header">
  			<h1>Viajeros</h1>  		
  			<ol class="breadcrumb">
	        	<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
	        	<li class="active">Lista de viajeros</li>
     		 </ol>
  		</section>  		  
  	    <!-- Main content -->
  		<section class="content">
  			
  			<!-- row -->
    			<div class="row">
    				<div class="col-xs-12">
		    				<div class="box">
					              <div class="box-header">
					                <h3 class="box-title">Lista de viajeros</h3>
					              </div><!-- /.box-header -->
					              <div class="box-body">
						                <table id="viajeros" class="table  table-responsive table-bordered table-striped ">
						                  <thead>
						                    <tr class="success">
						                      <th>Nombre</th>
						                      <th>Apellido</th>
						                      <th>Email</th>										                        
						                      <th>Telefono</th>
						                      <th>Calificaciones</th>
						                      <th>Calificaciones </th>
						                      <th>Denuncias Rebidas</th>
						                      <th>Denuncias Hechas</th>
						                      <th>Bloquear</th>
						                      <th>Desbloquear</th>
						                      
						                    </tr>
						                  </thead>
						                  <tbody>
						                  
						                  	<c:forEach items="${viajeros}" var="viajero">
						                  		<tr <c:if test="${viajero.bloqueado}">class="text-danger" </c:if>>
						                  			<td >${viajero.nombre} </td>					                  														
						                  			<td >${viajero.apellido}</td>
						                  			<td >${viajero.email}</td>
						                  			<td >
						                  			<c:if test="${empty viajero.telefono}">
						                  			   ---	
						                  			</c:if>
						                  			<c:if test="${not empty viajero.telefono}">
						                  			   ${viajero.telefono}
						                  			</c:if>
						                  			
						                  			
						                  			</td>
						                  			<td >${positivas[viajero.id] }</td>
						                  			<td>${negativas[viajero.id] }</td>
						                  			<td>${d_recibidas[viajero.id] }</td>
						                  			<td>${d_hechas[viajero.id] }</td>
						                  			<td>
						                  			<c:if test="${not viajero.bloqueado}">	
						                  				<form method="post" action=../bloquearViajero id='block${viajero.id}'>
						                  							<input type="hidden" name="clave" value="${viajero.id}"/>
	                  												<button type="button" class="btn bg-orange" onclick="bloquear('block${viajero.id}')"><i class="fa fa-lock"></i></button>
	                  									</form>        	   
									        	   	
									        	   </c:if>          				
						                  			<c:if test="${viajero.bloqueado}">						                  				
	                  									<button type="button" class="btn bg-orange disabled" ><i class="fa fa-lock"></i></button>                  									        	   
									        	   	</c:if> 			
	                  									
						                  			</td>
						                  			<td>
						                  			<c:if test="${not viajero.bloqueado}">	
						                  				   <button type="button" class="btn bg-olive disabled" ><i class="fa  fa-unlock"></i></button>     	   
									        	   	
									        	   </c:if>          				
						                  			<c:if test="${viajero.bloqueado}">	
						                  				<form method="post" action=../desbloquearViajero id='unblock${viajero.id}'>
						                  							<input type="hidden" name="clave" value="${viajero.id}"/>
	                  												<button type="button" class="btn bg-olive" onclick="desbloquear('unblock${viajero.id}')"><i class="fa  fa-unlock"></i></button>
	                  									</form>					                  				
	                  									                  									        	   
									        	   	</c:if> 
						                  			
						                  			
						                  			</td>
						                  			
						                  								                  		
						                  		</tr>
						                  		
						                  			
						                  		
						                  	</c:forEach>
						                    
						                  </tbody>
						                  
						                <tfoot>
						                    <tr class="success">
						                      <th>Nombre</th>
						                      <th>Apellido</th>
						                      <th>Email</th>										                        
						                      <th>Telefono</th>
						                      <th>Calificaciones</th>
						                      <th>Calificaciones </th>
						                      <th>Denuncias Rebidas</th>
						                      <th>Denuncias Hechas</th>
						                      <th>Bloquear</th>
						                      <th>Desbloquear</th>
						                      
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
        
        $('#viajeros').DataTable({
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
      <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	 
     <script>
	function bloquear(idform){
		var r = confirm("Seguro desea bloquer al viajero?");
		if (r == true) {
    		document.getElementById(idform).submit();
		}
		
	}
	function desbloquear(idform){
		var r = confirm("Seguro desea desbloquer al viajero?");
		if (r == true) {
    		document.getElementById(idform).submit();
		}
		
	}

</script>
  	  
  	  			
</jsp:body>	
</t:baseAdmin>