<%@tag import="model.usuario.Usuario"%>
<%@tag import="org.apache.struts2.components.ElseIf"%>
<%@tag description="Tag base" pageEncoding="UTF-8"%>

<%@attribute name="home_activo" fragment="true" %>
<%@attribute name="register_activo" fragment="true" %>
<%@attribute name="login_activo" fragment="true" %>
<%@attribute name="recorrido_activo" fragment="true" %>
<%@attribute name="invitaciones_activo" fragment="true" %>
<%@attribute name="solicitudes_activo" fragment="true" %>
<%@attribute name="evento_activo" fragment="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <title>Info Pool</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <%Usuario u = (Usuario) session.getAttribute("usuario");
	 if (u != null){ %>
    	<!-- esto de abajo es lo que estaba -->
	    <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
	     <!-- lo de arriba es lo que estaba -->
	     <link rel="stylesheet" href='./datetimepicker/jquery.datetimepicker.css'>
	     <script src="./datetimepicker/jquery.js"></script>
		<script src="./datetimepicker/jquery.datetimepicker.js"></script>
	<%}else{ %>
		 <link rel="stylesheet" href="./views/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" href="./views/bootstrap/css/bootstrap.min.css">


	
	<%} %>
	
     
	
	   
     
     
           
     
     <style type="text/css">

.custom-date-style {
	background-color: red !important;
}

</style>
     
     


  
</head>
<body>
<div class="navbar-wrapper">
	<div class="container">
		<div class="navbar navbar-inverse">
		  <div class="navbar-header">
		    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		      <span class="icon-bar"></span>
		    </button>
		    <a class="navbar-brand" href="#">Info Pool</a>
		  </div>
		  <div class="navbar-collapse collapse navbar-responsive-collapse">
		    <ul class="nav navbar-nav">
		    	  <li <jsp:invoke fragment="home_activo"/> ><a href="homeAction">Home</a></li>
		    	  <!-- debe aparecer el de abajo si no está logueado -->
		      	  <% String perfil = (String) session.getAttribute("perfil");
		      	  		
		      	 
		      	  if (perfil == null){ 
		      	  %>	      	  
		      	  		<li <jsp:invoke fragment="register_activo"/> ><a href="registerAction">Registrarse</a></li>
		      	  	<%}else{ 
		      		  	if(perfil.equals("viajero")) {%>
		      	  
					      	  <!-- debe aparecer lo de abajo si está logueado y es viajero -->
					      	  
					      	  <li <jsp:invoke fragment="recorrido_activo"/> ><a href="recorrido.jsp">Crear Recorrido</a></li>
					      	  <li <jsp:invoke fragment="invitaciones_activo"/> ><a href="invitaciones.jsp">Invitaciones</a></li>
					      	  <li <jsp:invoke fragment="solicitudes_activo"/> ><a href="solicitudes.jsp">Solicitudes</a></li>
					      	  <!-- lo de abajo se verá si el usuario está logueado y es admin -->
		      	  	  	<% }else{ 
		      		  		if(perfil.equals("admin")){ %>
		      	  
						      	  <li class="<jsp:invoke fragment="evento_activo"/> dropdown">
							        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Eventos<b class="caret"></b></a>
							        <ul class="dropdown-menu">
							          <li><a href="eventoAction">Evento nuevo</a></li>
							          <li><a href="listarEventosAction">Ver eventos</a></li>
							          
							        </ul>
							      </li>
							<%}
		      	  	  	}
		      	  	} %>
				
			    </ul>  
			    <!-- debe aparecer lo de abajo si no está loguedo ningún usuario -->
			    <ul class="nav navbar-nav navbar-right">
			    <%String nombre = (String) session.getAttribute("nombre");
			    
			    if (nombre == null){%>
			    			
			      		<li <jsp:invoke fragment="login_activo"/> ><a href="loginInitAction">Iniciar Sesión</a></li>
			     <%}else{
			    	 Usuario usuario = (Usuario) session.getAttribute("usuario");
			    	 if (usuario != null){
			     %>
			     		 
					      <li class="dropdown">
					      		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					      		<img src="http://placehold.it/30x30<%
					      		/*response.setContentType("image/jpeg");
					      		response.setContentLength(usuario.getImagen().length);
					      		response.getOutputStream().write(usuario.getImagen());*/
					      						      		%>" class="profile-image img-circle"> <% out.print(nombre);%><b class="caret"></b></a>
						        <ul class="dropdown-menu">
						          <li><a href="#">Mis Datos</a></li>
						          <li><a href="logoutAction">Cerrar Sesión</a></li>
						        
						        </ul>
						      </li>
				   <%}
			    	 }%>  
			    </ul>
		    
		   	
		  </div>
		</div>
	
		<div class="jumbotron">
			<jsp:doBody/>
		</div>
		
		
	</div>
</div>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<% Usuario user = (Usuario) session.getAttribute("usuario");
	 if (user != null){ %>
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script src="./bootstrap/js/bootswatch.js"></script>
<script src="./js/validator.js"></script>
<% }else{ %>
<script src="./views/bootstrap/js/bootstrap.min.js"></script>
<script src="./views/bootstrap/js/bootswatch.js"></script>
<%} %>

</body>
</html>