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
<jsp:attribute name="pendiente">
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
					                      
					                      <th><fmt:message key="viaje" /></th>
					                      <th><fmt:message key="usuario" /></th>
					                      <th><fmt:message key="asientos_disponibles" /></th>
					                      <th><fmt:message key="operacion" /></th>
					                      
					                      
					                      
					                    </tr>
					                  </thead>
					                  <tbody>
					                  	<c:forEach items="${pendientes}" var="pendiente">
					                  		
					                  			<tr>
						                  			<td >${pendiente.recorrido.desde } - ${pendiente.recorrido.hasta }</td>	
						                  			<td >${pendiente.usuario.nombre} ${pendiente.usuario.apellido} </td>					                  														
						                  			<td >${pendiente.recorrido.asientos }</td>
						                  			<td>
						                  			<div class="col-md-2">
						                  			<form method ="post" action="../aceptar">
						                  				<input type="hidden" name="clave" value="${pendiente.id}">
						                  				<button  class="btn bg-olive"><i class="fa fa-thumbs-o-up "></i></button>
						                  			
						                  			</form>
						                  			</div>
						                  			<div class="col-md-2">
						                  			<form method ="post" action="../rechazar">
						                  				<input type="hidden" name="clave" value="${pendiente.id}">
						                  				<button  class="btn bg-navy"><i class="fa fa-thumbs-o-down "></i></button>
						                  			
						                  			</form>
						                  			</div>
						                  			</td>
						                  			
					                  			</tr>
					                  		
					                  		
					                  	</c:forEach>
					                  	
					             	  </tbody>
					             	  <tfoot>
					                    <tr class="success">
					                      <th><fmt:message key="viaje" /></th>
					                      <th><fmt:message key="usuario" /></th>
					                      <th><fmt:message key="asientos_disponibles" /></th>
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
      
	  
	 

</jsp:body>
</t:baseViajero>