<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import="model.evento.Evento"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.i18n" />
<t:baseAdmin>
<jsp:attribute name="viajeros">
		class="active"
</jsp:attribute>
	
<jsp:body>	 
		
		        
     	<!-- Content Header (Page header) -->
    	<section class="content-header">
  			<h1><fmt:message key="viajeros" /></h1>  		
  			<ol class="breadcrumb">
	        	<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
	        	<li class="active"><fmt:message key="viajeros_lista" /></li>
     		 </ol>
  		</section>  		  
  	    <!-- Main content -->
  		<section class="content">
  			
  			<!-- row -->
    			<div class="row">
    				<div class="col-xs-12">
		    				<div class="box">
					              <div class="box-header">
					                <h3 class="box-title"><fmt:message key="viajeros_lista" /></h3>
					              </div><!-- /.box-header -->
					              <div class="box-body">
					              	<div class="table-responsive"> 
						                <table id="viajeros" class="table  table-responsive table-bordered table-striped ">
						                  <thead>
						                    <tr class="success">
						                      <th><fmt:message key="viajero_nombre" /></th>
						                      <th><fmt:message key="viajero_apellido" /></th>
						                      <th><fmt:message key="viajero_email" /></th>										                        
						                      <th><fmt:message key="viajero_telefono" /></th>
						                      <!--<th>Calificaciones Positivas</th>
						                      <th>Calificaciones Negativas</th>
						                      <th>Denuncias Recibidas</th>
						                      <th>Denuncias Hechas</th>-->
						                      <th><fmt:message key="bloquear" /></th>
						                      <th><fmt:message key="desbloquear" /></th>
						                      
						                    </tr>
						                  </thead>
						                  <tbody>
						                  
						                  	<c:forEach items="${viajeros}" var="viajero">
						                  		<tr <c:if test="${viajero.bloqueado}">class="text-danger" </c:if>>
						                  			<td class="text-center">${viajero.nombre} </td>					                  														
						                  			<td class="text-center">${viajero.apellido}</td>
						                  			<td class="text-center">${viajero.email}</td>
						                  			<td class="text-center">
						                  			<c:if test="${empty viajero.telefono}">
						                  			   ---	
						                  			</c:if>
						                  			<c:if test="${not empty viajero.telefono}">
						                  			   ${viajero.telefono}
						                  			</c:if>
						                  			
						                  			
						                  			</td>
						                  			<!--<td class="text-center">${positivas[viajero.id] }</td>
						                  			<td class="text-center">${negativas[viajero.id] }</td>
						                  			<td class="text-center">${d_recibidas[viajero.id] }</td>
						                  			<td class="text-center">${d_hechas[viajero.id] }</td>-->
						                  			<td class="text-center">
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
						                  			<td class="text-center">
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
						                      <th><fmt:message key="viajero_nombre" /></th>
						                      <th><fmt:message key="viajero_apellido" /></th>
						                      <th><fmt:message key="viajero_email" /></th>										                        
						                      <th><fmt:message key="viajero_telefono" /></th>
						                      <!--<th>Calificaciones</th>
						                      <th>Calificaciones </th>
						                      <th>Denuncias Rebidas</th>
						                      <th>Denuncias Hechas</th>-->
						                      <th><fmt:message key="bloquear" /></th>
						                      <th><fmt:message key="desbloquear" /></th>
						                      
						                    </tr>
						                  </tfoot>
						                </table>
						              </div><!-- /.responsive table -->
					              </div><!-- /.box-body -->
		            		</div><!-- /.box -->
          			</div><!-- /.col -->
              </div><!-- /.row -->
  		</section><!-- /.content -->
  		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
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
	function bloquear(idform){
		var r = confirm("<fmt:message key="viajero_pregunta_bloquear" />");
		if (r == true) {
    		document.getElementById(idform).submit();
		}
		
	}
	function desbloquear(idform){
		var r = confirm("<fmt:message key="viajero_pregunta_desbloquear" />");
		if (r == true) {
    		document.getElementById(idform).submit();
		}
		
	}

</script>
  	  
  	  			
</jsp:body>	
</t:baseAdmin>