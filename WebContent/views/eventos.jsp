<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%if ((session.getAttribute("perfil") == null) || (session.getAttribute("perfil").equals("viajero")) ){ %>
			<div class="jumbotron">
  				<h1>Error!</h1>
  				<p>No tiene los permisos suficientes para acceder al recurso solicitado.</p>
  				<p><a class="btn btn-primary btn-lg" href="./">Volver</a></p>
			</div>
	<%}else {%>
<t:base>
	<jsp:attribute name="evento_activo">
		active
	</jsp:attribute>


	<jsp:body>
		<table class="table table-striped table-hover">
			<thead>
				<tr class='warning'>
					<td>Nombre del evento</td>
					<td>Fecha y hora</td>
					<td>Lugar</td>
					<td>Sitio web</td>
				</tr>
			</thead>
			<s:iterator value="eventos" status="eventoStatus">
			  
			  <tr class='info'>	
				<td><s:property value="nombre" /></td>
				<td><s:date name="fecha" format="dd/MM/yyyy"/></td>
				<td><s:property value="lugar" /></td>
				<td><s:property value="sitio_web" /></td>
			  </tr>		  
			</s:iterator>
		</table>	
	</jsp:body>
</t:base>
<%}%>