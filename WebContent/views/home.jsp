<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.usuario.Usuario"%>
<%@ page import="model.evento.Evento"%>

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
			    <script src="./views/bootstrap/js/bootstrap.min.js"></script>
			    <script src="./views/js/validator.js"></script>
			    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
			
			  </body>
	<% }else{ 
		if (u.getRol().getNombre().equals("admin")){ %>
	
				 <body class="hold-transition skin-blue sidebar-mini" style="font-family: 'Comfortaa', cursive;">
						    <div class="wrapper">
						
						      <header class="main-header" >
						        <!-- Logo -->
						        <a href="profile.html" class="logo" style="background-color:#60AAAF;">
						          <!-- mini logo for sidebar mini 50x50 pixels -->
						          <span class="logo-mini"><b>I</b>P</span>
						          <!-- logo for regular state and mobile devices -->
						          <span class="logo-lg" style="background-color:#60AAAF;"><b>Info</b>Pool</span>
						        </a>
						        <!-- Header Navbar: style can be found in header.less -->
						        <nav class="navbar navbar-static-top" role="navigation" style="background-color:#60AAAF;">
						          <!-- Sidebar toggle button-->
						          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"  style="background-color:#60AAAF;" onmouseover="this.style.backgroundColor='#529093'" onmouseout="this.style.backgroundColor='#60AAAF'">
						            <span class="sr-only">Toggle navigation</span>
						            <span class="icon-bar"></span>
						            <span class="icon-bar"></span>
						            <span class="icon-bar"></span>
						          </a>
						          <div class="navbar-custom-menu" >
						            <ul class="nav navbar-nav">
						              <!-- Messages: style can be found in dropdown.less-->
						              <li class="dropdown messages-menu">
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <i class="fa fa-envelope-o"></i>
						                  <span class="label label-success">4</span>
						                </a>
						                <ul class="dropdown-menu">
						                  <li class="header">Tenés 4 mensajes</li>
						                  <li>
						                    <!-- inner menu: contains the actual data -->
						                    <ul class="menu">
						                      <li><!-- start message -->
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Support Team
						                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li><!-- end message -->
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            AdminLTE Design Team
						                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Developers
						                            <small><i class="fa fa-clock-o"></i> Today</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Sales Department
						                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Reviewers
						                            <small><i class="fa fa-clock-o"></i> 2 days</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                    </ul>
						                  </li>
						                  <li class="footer"><a href="#">Ver todos los mensajes</a></li>
						                </ul>
						              </li>
						              <!-- Notifications: style can be found in dropdown.less -->
						              <li class="dropdown notifications-menu">
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <i class="fa fa-bell-o"></i>
						                  <span class="label label-danger">10</span>
						                </a>
						                <ul class="dropdown-menu">
						                  <li class="header">Tenés 10 notificaciones</li>
						                  <li>
						                    <!-- inner menu: contains the actual data -->
						                    <ul class="menu">
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-users text-red"></i> 5 new members joined
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-shopping-cart text-green"></i> 25 sales made
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-user text-red"></i> You changed your username
						                        </a>
						                      </li>
						                    </ul>
						                  </li>
						                  <li class="footer"><a href="#">View all</a></li>
						                </ul>
						              </li>
						                            <!-- User Account: style can be found in dropdown.less -->
						              <li class="dropdown user user-menu" >
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <img src="./views/dist/img/avatar5.png" class="user-image" alt="User Image">
						                  <span class="hidden-xs">Emanuel Borda</span>
						                </a>
						                <ul class="dropdown-menu" >
						                  <!-- User image -->
						                  <li class="user-header" style="background-color:#60AAAF;">
						                    <img src="./views/dist/img/avatar5.png" class="img-circle" alt="User Image">
						                    <p>
						                      Emanuel Borda - Web Developer
						                      <small>Miembro desde Nov. 2012</small>
						                    </p>
						                  </li>
						                  <!-- Menu Body -->
						                  <li class="user-body">
						                    <div class="col-xs-4 text-center">
						                      <a href="#">Seguidores</a>
						                    </div>
						                    <div class="col-xs-4 text-center">
						                      <a href="#"></a>
						                    </div>
						                    <div class="col-xs-4 text-center">
						                      <a href="#">Amigos</a>
						                    </div>
						                  </li>
						                  <!-- Menu Footer-->
						                  <li class="user-footer">
						                    <div class="pull-left">
						                      <a href="#" class="btn bg-olive btn-flat">Mi perfil</a>
						                    </div>
						                    <div class="pull-right">
						                      <a href="logout" class="btn bg-orange btn-flat">Salir</a>
						                    </div>
						                  </li>
						                </ul>
						              </li>
						              
						            </ul>
						          </div>
						        </nav>
						      </header>
						      
						      
						      <!-- Left side column. contains the logo and sidebar -->
						      <aside class="main-sidebar">
						        <!-- sidebar: style can be found in sidebar.less -->
						        <section class="sidebar">
						          <!-- Sidebar user panel -->
						          <ul class="sidebar-menu">
						            <li class="header">Menú principal</li>
						             <li class="treeview">
							              <a href="#" >
							                <i class="fa  fa-calendar"></i> <span>Eventos</span> <i class="fa fa-angle-left pull-right"></i>
							              </a>
							              <ul class="treeview-menu">
							                <li><a href="#" id="newEvent" ><i class="fa fa-calendar-plus-o"></i> Nuevo evento</a></li>
							                <li>
							                      
							                <li><a href="#" id="listEvent"><i class="fa fa-th"></i> Activos</a></li>
							                
							              </ul>
						            </li>
						            
						            
						            <li class="treeview">
						              <a href="#" id="journals">
						                <i class="fa fa-users"></i>
						                <span>Viajeros</span>
						                
						              </a>
						              
						            </li>      
						            
				            
						            <li>
						              <a href="#" id="mailbox">
						                <i class="fa fa-envelope"></i> <span>Mensajería</span>
						                <small class="label pull-right bg-yellow">12</small>
						              </a>
						            </li>
						            
						        </section>
						        <!-- /.sidebar -->
						      </aside>
						
						      <!-- Content Wrapper. Contains page content -->
						      <div class="content-wrapper">
						      		<div  style="display:none;" class="journals">
						      		 journals
						      		</div> 
						      		
						      		<div  style="display:none;" class="newEvent">
						      		 <section class="content-header">
								          <h1>
								            Crear Evento
								            
								          </h1>
								          <ol class="breadcrumb">
								            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
								            <li class="active">Evento nuevo</li>
								          </ol>
								        </section>
								
								        <!-- Main content -->
								        <section class="content">					      		 
						      		 		<div class="row">
											  <div class="col-md-12">
         									     <form class="form-horizontal" method = 'post' action ='evento' >
									               <fieldset>
									               <div class="form-group text-center">
									                 <label for="inputNombre" class="col-lg-2 control-label">Nombre:</label>
									                 <div class="col-xs-6">
									                   <input type="text" name='nombre' class="form-control" id="inputNombre" placeholder="Ingrese el nombre del evento" autofocus required/>
									                 </div>
									               </div>
									                <div class="form-group text-center">
									                 <label for="inputFecha" class="col-lg-2 control-label" id="fecha">Día y hora del evento:</label>
									                 <div class="col-xs-6">                   
									                   <input type="text" name='fecha' value="" class="form-control" id="datetimepicker" placeholder="dd/mm/YYYY HH:mm"/>
									                 </div>
									               </div>         
									               <div class="form-group">
									                 <label for="inputSitio" class="col-lg-2 control-label">Sitio web:</label>
									                 <div class="col-xs-6">
									                   <input type="text" class="form-control" id="inputSitio" name='sitio_web' placeholder='Ingrese el sitio del evento'/>        
									                 </div>
									               </div>
									               <div class="form-group">
									                 <label for="inputLugar" class="col-lg-2 control-label">Lugar</label>
									                 <div class="col-xs-6">
									                   <input type="text" class="form-control" id="inputLugar" name='lugar' placeholder='Ingrese la dirección del evento, junto a su ciudad' required/>        
									                 </div>
									               </div>  
									               
									                                
									               
									               <div class="form-group">
									                 <div class="col-xs-6 col-lg-offset-2">
									                   
									                   <button type="submit" class="btn btn-info btn-lg btn-block ">Agregar Evento Nuevo</button>
									                 </div>
									               </div>
									               
									               </fieldset>
									               
									               
									              
									             </form>
									             <script type="text/javascript">
									             $('#datetimepicker').datetimepicker({
									            	 dayOfWeekStart : 1,
									            	 lang:'es',
									            	 
									            	 });
									            	 $('#datetimepicker').datetimepicker({value:'',step:10});
									
									            	 $('.some_class').datetimepicker();
												 </script>
												 
												 
												 
												 
												 
												 
												 
								      		 		
								              </div><!-- /.col (right) -->
          								   </div><!-- /.row -->

        								</section><!-- /.content -->
						      		</div> 
						      		
						      		<div style="display:none;" class="mailbox">
						      		 			<section class="content-header">
											          <h1>
											            Mensajería
											            <small>2 nuevos mensajes</small>
											          </h1>
											          <ol class="breadcrumb">
											            <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
											            <li class="active">Mensajería</li>
											          </ol>
											        </section>
											
											        <!-- Main content -->
											        <section class="content">
											          <div class="row">
											            <div class="col-md-3">
											              <a href="compose.html" class="btn btn-primary btn-block margin-bottom">Redactar</a>
											              <div class="box box-solid">
											                <div class="box-header with-border">
											                  <h3 class="box-title">Carpetas</h3>
											                  <div class="box-tools">
											                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
											                  </div>
											                </div>
											                <div class="box-body no-padding">
											                  <ul class="nav nav-pills nav-stacked">
											                    <li class="active"><a href="#"><i class="fa fa-inbox"></i> Bandeja de Entrada <span class="label label-primary pull-right">2</span></a></li>
											                    <li><a href="#"><i class="fa fa-envelope-o"></i> Enviados</a></li>
											                    <li><a href="#"><i class="fa fa-trash-o"></i> Papelera</a></li>
											                  </ul>
											                </div><!-- /.box-body -->
											              </div><!-- /. box -->
											              
											            </div><!-- /.col -->
											            <div class="col-md-9">
											              <div class="box box-primary">
											                <div class="box-header with-border">
											                  <h3 class="box-title">Bandeja de Entrada</h3>
											                  <div class="box-tools pull-right">
											                    <div class="has-feedback">
											                      <input type="text" class="form-control input-sm" placeholder="Buscar Correo">
											                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
											                    </div>
											                  </div><!-- /.box-tools -->
											                </div><!-- /.box-header -->
											                <div class="box-body no-padding">
											                  <div class="mailbox-controls">
											                    <!-- Check all button -->
											                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
											                    <div class="btn-group">
											                      <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
											                      <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
											                      <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
											                    </div><!-- /.btn-group -->
											                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
											                    <div class="pull-right">
											                      1-50/200
											                      <div class="btn-group">
											                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
											                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
											                      </div><!-- /.btn-group -->
											                    </div><!-- /.pull-right -->
											                  </div>
											                  <div class="table-responsive mailbox-messages">
											                    <table class="table table-hover table-striped">
											                      <tbody>
											                        <tr>
											                          <td><input type="checkbox"></td>
											                          <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
											                          <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
											                          <td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> - Trying to find a solution to this problem...</td>
											                          <td class="mailbox-attachment"></td>
											                          <td class="mailbox-date">5 mins ago</td>
											                        </tr>
											                        <tr>
											                          <td><input type="checkbox"></td>
											                          <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
											                          <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
											                          <td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> - Trying to find a solution to this problem...</td>
											                          <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
											                          <td class="mailbox-date">28 mins ago</td>
											                        </tr>
											                        
											                      </tbody>
											                    </table><!-- /.table -->
											                  </div><!-- /.mail-box-messages -->
											                </div><!-- /.box-body -->
											                <div class="box-footer no-padding">
											                  <div class="mailbox-controls">
											                    <!-- Check all button -->
											                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
											                    <div class="btn-group">
											                      <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
											                      <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
											                      <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
											                    </div><!-- /.btn-group -->
											                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
											                    <div class="pull-right">
											                      1-50/200
											                      <div class="btn-group">
											                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
											                        <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
											                      </div><!-- /.btn-group -->
											                    </div><!-- /.pull-right -->
											                  </div>
											                </div>
											              </div><!-- /. box -->
											            </div><!-- /.col -->
											          </div><!-- /.row -->
											        </section><!-- /.content -->
						      		 			
						      		</div> 
						      
						      
						      		
						      
						      	   	
						      
						      
						           <div style="display:none;" class="listEvent"> 
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
										                  <table id="example1" class="table table-bordered table-striped">
										                    <thead>
										                      <tr>
										                        <th>Nombre</th>
										                        <th>Fecha</th>
										                        <th>Lugar</th>										                        
										                        <th>Sitio Web</th>
										                        
										                      </tr>
										                    </thead>
										                    <tbody>
										                    	<s:iterator value="eventos" status="eventoStatus">
			  
																  <tr class='info'>	
																	<td><s:property value="nombre" /></td>
																	<td><s:date name="fecha" format="dd/MM/yyyy"/></td>
																	<td><s:property value="lugar" /></td>
																	<td><s:property value="sitio_web" /></td>
																  </tr>		  
																</s:iterator>
										                      
										                    </tbody>
										                    <tfoot>
										                      <tr>
										                        <th>Nombre</th>
										                        <th>Fecha</th>
										                        <th>Lugar</th>										                        
										                        <th>Sitio Web</th>
										                      </tr>
										                    </tfoot>
										                  </table>
										                </div><!-- /.box-body -->
										              </div><!-- /.box -->
										            </div><!-- /.col -->
						                    </div><!-- /.row -->
						
						        		</section><!-- /.content -->
						      		</div>
						      </div><!-- /.content-wrapper -->
						      

						      <div class="control-sidebar-bg"></div>
						    </div><!-- ./wrapper -->
							
						    <!-- jQuery 2.1.4 -->
						    <script src="./views/plugins/jQuery/jQuery-2.1.4.min.js"></script>

						    <!-- Bootstrap 3.3.5 -->
						    <script src="./views/bootstrap_lte/js/bootstrap.min.js"></script>
						    <script src="./views/dist/js/app.min.js"></script>
						    <script src="./views//plugins/datatables/jquery.dataTables.min.js"></script>
    					    <script src="./views/plugins/datatables/dataTables.bootstrap.min.js"></script>

    					  
			
						    <script>
						      $(function () {
						        $("#example1").DataTable();
						        $('#example2').DataTable({
						          "paging": true,
						          "lengthChange": false,
						          "searching": false,
						          "ordering": true,
						          "info": true,
						          "autoWidth": false
						        });
						      });
						    </script>
						  	<script>
						  		$(document).ready(function(){						  			
							  	    $("#newEvent").click(function() {
							  	   	
							  	    $( ".listEvent" ).fadeOut();
							  		$( ".mailbox" ).fadeOut();
							  		$( ".journals" ).fadeOut();
							  		$( ".newEvent" ).delay( 400 ).fadeIn( 400 );
							  		
							  		});
						  		});	
						  		$(document).ready(function(){						  			
							  	    $("#listEvent").click(function() {
							  	    	
							  	    $( ".newEvent" ).fadeOut();
							  		$( ".mailbox" ).fadeOut();
							  		$( ".journals" ).fadeOut();
							  		
							  		$( ".listEvent" ).delay( 400 ).fadeIn( 400 );
							  		
							  		});
						  		});	
						  		
						  		$(document).ready(function(){						  			
							  	    $("#journals").click(function() {
							  	    $( ".listEvent" ).fadeOut();
							  		$( ".mailbox" ).fadeOut();
							  		$( ".newEvent" ).fadeOut();
							  		$( ".journals" ).delay( 400 ).fadeIn( 400 );
							  		
							  		});
						  		});	
						  		$(document).ready(function(){						  			
							  	    $("#mailbox").click(function() {
							  	    $( ".listEvent" ).fadeOut();
							  		$( ".newEvent" ).fadeOut();
							  		$( ".journals" ).fadeOut();
							  		$( ".mailbox" ).delay( 400 ).fadeIn( 400 );
							  		
							  		});
						  		});	
						  	
						  	
						  	</script>
						  	


						  </body>
	
	
			<%}else{%>
				
				
					
					
					
					
					
					
					<body class="hold-transition skin-blue sidebar-mini" style="font-family: 'Comfortaa', cursive;">
						    <div class="wrapper">
						
						      <header class="main-header" >
						        <!-- Logo -->
						        <a href="profile.html" class="logo" style="background-color:#60AAAF;">
						          <!-- mini logo for sidebar mini 50x50 pixels -->
						          <span class="logo-mini"><b>I</b>P</span>
						          <!-- logo for regular state and mobile devices -->
						          <span class="logo-lg" style="background-color:#60AAAF;"><b>Info</b>Pool</span>
						        </a>
						        <!-- Header Navbar: style can be found in header.less -->
						        <nav class="navbar navbar-static-top" role="navigation" style="background-color:#60AAAF;">
						          <!-- Sidebar toggle button-->
						          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"  style="background-color:#60AAAF;" onmouseover="this.style.backgroundColor='#529093'" onmouseout="this.style.backgroundColor='#60AAAF'">
						            <span class="sr-only">Toggle navigation</span>
						            <span class="icon-bar"></span>
						            <span class="icon-bar"></span>
						            <span class="icon-bar"></span>
						          </a>
						          <div class="navbar-custom-menu" >
						            <ul class="nav navbar-nav">
						              <!-- Messages: style can be found in dropdown.less-->
						              <li class="dropdown messages-menu">
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <i class="fa fa-envelope-o"></i>
						                  <span class="label label-success">4</span>
						                </a>
						                <ul class="dropdown-menu">
						                  <li class="header">Tenés 4 mensajes</li>
						                  <li>
						                    <!-- inner menu: contains the actual data -->
						                    <ul class="menu">
						                      <li><!-- start message -->
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Support Team
						                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li><!-- end message -->
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            AdminLTE Design Team
						                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Developers
						                            <small><i class="fa fa-clock-o"></i> Today</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Sales Department
						                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <div class="pull-left">
						                            <img src="./views/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
						                          </div>
						                          <h4>
						                            Reviewers
						                            <small><i class="fa fa-clock-o"></i> 2 days</small>
						                          </h4>
						                          <p>Why not buy a new awesome theme?</p>
						                        </a>
						                      </li>
						                    </ul>
						                  </li>
						                  <li class="footer"><a href="#">Ver todos los mensajes</a></li>
						                </ul>
						              </li>
						              <!-- Notifications: style can be found in dropdown.less -->
						              <li class="dropdown notifications-menu">
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <i class="fa fa-bell-o"></i>
						                  <span class="label label-danger">10</span>
						                </a>
						                <ul class="dropdown-menu">
						                  <li class="header">Tenés 10 notificaciones</li>
						                  <li>
						                    <!-- inner menu: contains the actual data -->
						                    <ul class="menu">
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-users text-red"></i> 5 new members joined
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-shopping-cart text-green"></i> 25 sales made
						                        </a>
						                      </li>
						                      <li>
						                        <a href="#">
						                          <i class="fa fa-user text-red"></i> You changed your username
						                        </a>
						                      </li>
						                    </ul>
						                  </li>
						                  <li class="footer"><a href="#">View all</a></li>
						                </ul>
						              </li>
						                            <!-- User Account: style can be found in dropdown.less -->
						              <li class="dropdown user user-menu" >
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <img src="./views/dist/img/avatar5.png" class="user-image" alt="User Image">
						                  <span class="hidden-xs">Emanuel Borda</span>
						                </a>
						                <ul class="dropdown-menu" >
						                  <!-- User image -->
						                  <li class="user-header" style="background-color:#60AAAF;">
						                    <img src="./views/dist/img/avatar5.png" class="img-circle" alt="User Image">
						                    <p>
						                      Emanuel Borda - Web Developer
						                      <small>Miembro desde Nov. 2012</small>
						                    </p>
						                  </li>
						                  <!-- Menu Body -->
						                  <li class="user-body">
						                    <div class="col-xs-4 text-center">
						                      <a href="#">Seguidores</a>
						                    </div>
						                    <div class="col-xs-4 text-center">
						                      <a href="#"></a>
						                    </div>
						                    <div class="col-xs-4 text-center">
						                      <a href="#">Amigos</a>
						                    </div>
						                  </li>
						                  <!-- Menu Footer-->
						                  <li class="user-footer">
						                    <div class="pull-left">
						                      <a href="#" class="btn bg-olive btn-flat">Mi perfil</a>
						                    </div>
						                    <div class="pull-right">
						                      <a href="logout" class="btn bg-orange btn-flat">Salir</a>
						                    </div>
						                  </li>
						                </ul>
						              </li>
						              
						            </ul>
						          </div>
						        </nav>
						      </header>
						      
						      
						      <!-- Left side column. contains the logo and sidebar -->
						      <aside class="main-sidebar">
						        <!-- sidebar: style can be found in sidebar.less -->
						        <section class="sidebar">
						          <!-- Sidebar user panel -->
						          
						          <!-- search form -->
						          <form action="#" method="get" class="sidebar-form">
						            <div class="input-group">
						              <input type="text" name="q" class="form-control" placeholder="Buscar...">
						              <span class="input-group-btn">
						                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
						              </span>
						            </div>
						          </form>
						          <!-- /.search form -->
						          <!-- sidebar menu: : style can be found in sidebar.less -->
						          <ul class="sidebar-menu">
						            <li class="header">Menú principal</li>
						            
						            <li class="treeview">
						              <a href="viajeros.html">
						                <i class="fa fa-users"></i>
						                <span>Viajeros</span>
						                
						              </a>
						              
						            </li>
						            
						            
						            
						            <li>
						              <a href="eventos.html">
						                <i class="fa fa-calendar"></i> <span>Eventos</span>
						         
						              </a>
						            </li>
						            <li class="treeview">
						              <a href="#">
						                <i class="fa  fa-car"></i> <span>Recorridos</span> <i class="fa fa-angle-left pull-right"></i>
						              </a>
						              <ul class="treeview-menu">
						                <li><a href="#"><i class="fa fa-building-o"></i> Nuevo recorrido</a></li>
						                <li>
						                      <a href="#"><i class="fa  fa-star-o"></i> Propios <i class="fa fa-angle-left pull-right"></i></a>
						                      <ul class="treeview-menu">
						                        <li><a href="#"><i class="fa fa-hourglass-start"></i> Vigentes</a></li>
						                        <li><a href="#"><i class="fa fa-hourglass-end"></i> Concluidos</a></li>
						                      </ul>
						                    </li>
						                <li><a href=""><i class="fa fa-linux"></i> Abiertos</a></li>
						                
						              </ul>
						            </li>
						            
						            <li>
						              <a href="mailbox.html">
						                <i class="fa fa-envelope"></i> <span>Mensajería</span>
						                <small class="label pull-right bg-yellow">12</small>
						              </a>
						            </li>
						            
						        </section>
						        <!-- /.sidebar -->
						      </aside>
						
						      <!-- Content Wrapper. Contains page content -->
						      <div class="content-wrapper">
						         <!-- Content Header (Page header) -->
						        <section class="content-header">
						          <h1>
						            Viajes
						            <small>disponibles</small>
						          </h1>
						          
						        </section>
						
						        <!-- Main content -->
						        <section class="content">
						
						          <!-- row -->
						          <div class="row">
						            <div class="col-md-12">
						              <!-- The time line -->
						              <ul class="timeline">
						                <!-- timeline time label -->
						                <li class="time-label">
						                  <span class="bg-red">
						                    10 Oct. 2015
						                  </span>
						                </li>
						                <!-- /.timeline-label -->
						                <!-- timeline item -->
						                <li>
						                  <i class="fa fa-car bg-blue"></i>
						                  <div class="timeline-item">
						                    <span class="time"><i class="fa fa-clock-o"></i> 13:00</span>
						                    <h3 class="timeline-header"><a href="#">La Plata</a> Capital Federal</h3>
						                    <div class="timeline-body">
						                      Esto es un texto para probar el timeline...
						                    </div>
						                    <div class="timeline-footer">
						                      <a class="btn btn-primary btn-xs">Más</a>
						                      <a class="btn btn-danger btn-xs">Eliminar</a>
						                    </div>
						                  </div>
						                </li>
						                <!-- END timeline item -->
						                <!-- timeline item -->
						                <li>
						                  <i class="fa fa-user bg-aqua"></i>
						                  <div class="timeline-item">
						                    <span class="time"><i class="fa fa-clock-o"></i> Hace 5 minutos </span>
						                    <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
						                  </div>
						                </li>
						                <!-- END timeline item -->
						                <!-- timeline item -->
						                <li>
						                  <i class="fa fa-comments bg-yellow"></i>
						                  <div class="timeline-item">
						                    <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>
						                    <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
						                    <div class="timeline-body">
						                      Take me to your leader!
						                      Switzerland is small and neutral!
						                      We are more like Germany, ambitious and misunderstood!
						                    </div>
						                    <div class="timeline-footer">
						                      <a class="btn btn-warning btn-flat btn-xs">View comment</a>
						                    </div>
						                  </div>
						                </li>
						                <!-- END timeline item -->
						                <!-- timeline time label -->
						                <li class="time-label">
						                  <span class="bg-green">
						                    3 Jan. 2014
						                  </span>
						                </li>
						                <!-- /.timeline-label -->
						                <!-- timeline item -->
						                <li>
						                  <i class="fa fa-camera bg-purple"></i>
						                  <div class="timeline-item">
						                    <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>
						                    <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>
						                    <div class="timeline-body">
						                      <img src="http://placehold.it/150x100" alt="..." class="margin">
						                      <img src="http://placehold.it/150x100" alt="..." class="margin">
						                      <img src="http://placehold.it/150x100" alt="..." class="margin">
						                      <img src="http://placehold.it/150x100" alt="..." class="margin">
						                    </div>
						                  </div>
						                </li>
						       
										</pre>
						                </div><!-- /.box-body -->
						              </div><!-- /.box -->
						            </div><!-- /.col -->
						          </div><!-- /.row -->
						
						        </section><!-- /.content -->
						      
						      </div><!-- /.content-wrapper -->
						      
						      
						      
						      
						      <footer class="main-footer">
						        <!--<div class="pull-right hidden-xs">
						          <b>Version</b> 2.3.0
						        </div>
						        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved. -->
						      </footer>
						
						      <!-- Control Sidebar -->
						      <aside class="control-sidebar control-sidebar-dark">
						        <!-- Create the tabs -->
						        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
						          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
						          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
						        </ul>
						        <!-- Tab panes -->
						        <div class="tab-content">
						          <!-- Home tab content -->
						          <div class="tab-pane" id="control-sidebar-home-tab">
						            <h3 class="control-sidebar-heading">Recent Activity</h3>
						            <ul class="control-sidebar-menu">
						              <li>
						                <a href="javascript::;">
						                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
						                  <div class="menu-info">
						                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
						                    <p>Will be 23 on April 24th</p>
						                  </div>
						                </a>
						              </li>
						              <li>
						                <a href="javascript::;">
						                  <i class="menu-icon fa fa-user bg-yellow"></i>
						                  <div class="menu-info">
						                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
						                    <p>New phone +1(800)555-1234</p>
						                  </div>
						                </a>
						              </li>
						              <li>
						                <a href="javascript::;">
						                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
						                  <div class="menu-info">
						                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
						                    <p>nora@example.com</p>
						                  </div>
						                </a>
						              </li>
						              <li>
						                <a href="javascript::;">
						                  <i class="menu-icon fa fa-file-code-o bg-green"></i>
						                  <div class="menu-info">
						                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
						                    <p>Execution time 5 seconds</p>
						                  </div>
						                </a>
						              </li>
						            </ul><!-- /.control-sidebar-menu -->
						
						            <h3 class="control-sidebar-heading">Tasks Progress</h3>
						            <ul class="control-sidebar-menu">
						              <li>
						                <a href="javascript::;">
						                  <h4 class="control-sidebar-subheading">
						                    Custom Template Design
						                    <span class="label label-danger pull-right">70%</span>
						                  </h4>
						                  <div class="progress progress-xxs">
						                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
						                  </div>
						                </a>
						              </li>
						              <li>
						                <a href="javascript::;">
						                  <h4 class="control-sidebar-subheading">
						                    Update Resume
						                    <span class="label label-success pull-right">95%</span>
						                  </h4>
						                  <div class="progress progress-xxs">
						                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
						                  </div>
						                </a>
						              </li>
						              <li>
						                <a href="javascript::;">
						                  <h4 class="control-sidebar-subheading">
						                    Laravel Integration
						                    <span class="label label-warning pull-right">50%</span>
						                  </h4>
						                  <div class="progress progress-xxs">
						                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
						                  </div>
						                </a>
						              </li>
						              <li>
						                <a href="javascript::;">
						                  <h4 class="control-sidebar-subheading">
						                    Back End Framework
						                    <span class="label label-primary pull-right">68%</span>
						                  </h4>
						                  <div class="progress progress-xxs">
						                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
						                  </div>
						                </a>
						              </li>
						            </ul><!-- /.control-sidebar-menu -->
						
						          
						        </div>
						      </aside><!-- /.control-sidebar -->
						      <!-- Add the sidebar's background. This div must be placed
						           immediately after the control sidebar -->
						      <div class="control-sidebar-bg"></div>
						    </div><!-- ./wrapper -->
						
						    <!-- jQuery 2.1.4 -->
						    <script src="./views/plugins/jQuery/jQuery-2.1.4.min.js"></script>
						    <!-- Bootstrap 3.3.5 -->
						    <script src="./views/bootstrap_lte/js/bootstrap.min.js"></script>

						  </body>
	
					
					
					
					
					
								
				
				
				
				
				
			<%}} %>
			
			
			
			
</html>
