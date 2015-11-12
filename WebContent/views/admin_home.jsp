<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:base>
	<jsp:attribute name="home_activo">
			class='active'
	</jsp:attribute>
	<jsp:body>
		
         ${(sessionScope.perfil == "admin" ) ?
	  "<h2>Bienvenid@ admin</h2>" :
	  (sessionScope.perfil == "viajero" ) ?
	  "<h2>Bienvenid@ Viajer@ </h2>" :
	  "<h2>Bienvenid@ a Info Pool</h2>"
	  }
	</jsp:body>	
</t:base>	