<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.usuario.Usuario"%>
<%@ page import="model.evento.Evento"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>InfoPool| Bienvenid@!</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="./views/bootstrap_lte/css/bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Comfortaa:400,700,300' rel='stylesheet' type='text/css'>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="./views/dist/css/infopool.min.css">

    <link rel="stylesheet" href="./views/dist/css/skins/_all-skins.min.css">
     <link rel="stylesheet" href='./views/datetimepicker/jquery.datetimepicker.css'>
     <script src="./views/datetimepicker/jquery.js"></script>
	<script src="./views/datetimepicker/jquery.datetimepicker.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    

  </head>
  <% Usuario u = (Usuario) session.getAttribute("usuario");
   if (u == null){ %>
			  <body class="hold-transition register-page" style="font-family: 'Comfortaa', cursive;">
			    <div class="wrapper">
					<nav class="navbar navbar-default" style="background-color:#60AAAF;">
						  <div class="container-fluid">
							<div class="navbar-header">
							  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							  </button>
							  <a class="navbar-brand" href="#" style="color:white;">InfoPool</a>
							</div>
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							  <ul class="nav navbar-nav navbar-right">
									<form class="navbar-form navbar-left form-inline" role="search" method="post" action='login' >
										<div class="form-group">
										   <label for="mail" style="color:white;">E-mail</label>
										  <input type="email"  name='email'  class="form-control" id="mail" placeholder="coloque su e-mail">
										</div>
										<div class="form-group">
											<label for="mail" style="color:white;">Clave</label>
											<input type="password" class="form-control" id="pass"  name='clave' placeholder="ingrese su clave">
										</div>
										<button type="submit" class="btn btn-success btn-flat" style="background-color:#84CACE;">iniciar sesión</button>
									</form>
							  </ul>
							</div>
						  </div>
					</nav>	
					<div>
							<div class="col-md-8">
							  <h2 class="featurette-heading">Bienvenid@ a InfoPool! <span class="text-muted">La red social de viajes comunitarios para informátic@s.</span></h2>
							  <p class="lead">Registrese en infopool y podrá viajar a congresos o incluso a su trabajo.</p>
							  <img src="./views/dist/img/auto.jpg" alt="tutu" class="img-thumbnail">
							</div>
							</div>
							<div class="col-md-4">
								<div class="register-box">
									<div class="register-logo">
										<a href=""><b></a>
									</div>
								<div class="register-box-body">
									<p class="login-box-msg">Registro de un nuevo viajero</p>
									<form method = 'post' action ='registerAction' data-toggle="validator" role="form">
										  <div class="form-group has-feedback">
											<input type="text"  name='nombre' class="form-control" placeholder="Nombre" required>
											<span class="glyphicon glyphicon-user form-control-feedback"></span>
										  </div>
										  <div class="form-group has-feedback">
											<input type="text"  name='apellido' class="form-control" placeholder="Apellido" required>
											<span class="glyphicon glyphicon-user form-control-feedback"></span>
										  </div>
										  <div class="form-group has-feedback">
											<input type="email" name='email' class="form-control" id="inputEmail" placeholder="Email" required data-error="El correo es invÃ¡lido">
											<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
										  </div>
										  <div class="form-group has-feedback">
											<input type="password" class="form-control" name='clave' id="clave"placeholder="Contraseña" required>
											<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										  </div>
										  <div class="form-group has-feedback">
											<input type="password" class="form-control" name='clave2' placeholder="Repetir contraseña" required required data-match="#clave" data-match-error="Las claves no coinciden">
											<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
											  <div class="help-block with-errors"></div> 
										  </div>
										  <div class="row">
											<div class="col-xs-2"></div>  
											<div class="col-xs-10">
											  <div class="checkbox icheck">
												<label>
												  <input type="checkbox" required> Acepto los <a href="#">términos y condiciones</a>
												</label>
											  </div>
											</div><!-- /.col -->
											<div class="col-xs-12	">
											  <button type="submit" class="btn btn-success btn-block btn-flat">Registrarme</button>
											</div><!-- /.col -->
										  </div>
									</form>
			
									<div class="social-auth-links text-center">
									  <p> Sino</p>
									  <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Registrate con Facebook</a>
									  <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Registrate con Google+</a>
									</div>
			
									
								</div><!-- /.form-box -->
								</div><!-- /.register-box -->
							
							</div>
						</div>
			    <!-- jQuery 2.1.4 -->
			    
			    <script src="./views/plugins/jQuery/jQuery-2.1.4.min.js"></script>
			    <!-- Bootstrap 3.3.5 -->
			    <script src="./views/bootstrap_lte/js/bootstrap.min.js"></script>
			    <script src="./views/js/validator.js"></script>
			    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
			
			  </body>
			  </html>
	<% }else{ 
		if (u.getRol().getNombre().equals("admin")){ response.sendRedirect("/adminHome.jsp");%>
				
				 
	
	
		<%}else				
			response.sendRedirect("/viajeroHome.jsp"); %>
			
		<%} %>
			
			
			

