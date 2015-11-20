
<%@ tag import="model.usuario.Usuario"%>
<%@tag import="org.apache.struts2.components.ElseIf"%>
<%@tag description="Tag baseAdmin" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@attribute name="evento" fragment="true" %>
<%@attribute name="viajeros" fragment="true" %>
<%@attribute name="evento_nuevo" fragment="true" %>
<%@attribute name="eventos" fragment="true" %>
<%@attribute name="mailbox" fragment="true" %>

<!DOCTYPE html>
<html>
<tags:head/>
<% Usuario u = (Usuario) session.getAttribute("usuario"); 
if (u == null)response.sendError(HttpServletResponse.SC_NOT_FOUND);
else{ if (!u.getRol().getNombre().equals("admin"))response.sendError(HttpServletResponse.SC_NOT_FOUND);
		else {%>
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
						                            <img src="./dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
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
						                            <img src="./dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
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
						                            <img src="./dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
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
						                            <img src="./dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
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
						                            <img src="./dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
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
						                  <img src="./dist/img/avatar5.png" class="user-image" alt="User Image">
						                  <span class="hidden-xs">Emanuel Borda</span>
						                </a>
						                <ul class="dropdown-menu" >
						                  <!-- User image -->
						                  <li class="user-header" style="background-color:#60AAAF;">
						                    <img src="./dist/img/avatar5.png" class="img-circle" alt="User Image">
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
						                      <a href="../logout" class="btn bg-orange btn-flat">Salir</a>
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
						             <li class="treeview <jsp:invoke fragment="evento"/>">
							              <a href="#" >
							                <i class="fa  fa-calendar"></i> <span>Eventos</span> <i class="fa fa-angle-left pull-right"></i>
							              </a>
							              <ul class="treeview-menu">
							                <li <jsp:invoke fragment="evento_nuevo"/>><a href="/viajeros/evento" id="newEvent" ><i class="fa fa-calendar-plus-o"></i> Nuevo evento</a></li>
							                <li>
							                      
							                <li  <jsp:invoke fragment="eventos"/>><a href="/viajeros/listarEventos" id="listEvent"><i class="fa fa-th"></i> Activos</a></li>
							                
							              </ul>
						            </li>
						            
						            
						            <li  <jsp:invoke fragment="viajeros"/>>
						              <a href="#" id="journals">
						                <i class="fa fa-users"></i>
						                <span>Viajeros</span>
						                
						              </a>
						              
						            </li>      
						            
				            
						            <li  <jsp:invoke fragment="mailbox"/>>
						              <a href="#" id="mailbox">
						                <i class="fa fa-envelope"></i> <span>Mensajería</span>
						                <small class="label pull-right bg-yellow">12</small>
						              </a>
						            </li>
						         </ul>
						            
						        </section>
						        <!-- /.sidebar -->
						      </aside>
							 <div class="content-wrapper">
							<jsp:doBody/>
							</div><!-- /.content-wrapper -->
						      

						      <div class="control-sidebar-bg"></div>
						    </div><!-- ./wrapper -->
						    
						     <!-- jQuery 2.1.4 -->
						    <script src="./plugins/jQuery/jQuery-2.1.4.min.js"></script>

						    <!-- Bootstrap 3.3.5 -->
						    <script src="./bootstrap_lte/js/bootstrap.min.js"></script>
						    <script src="./dist/js/app.min.js"></script>
						    <script src="./plugins/datatables/jquery.dataTables.min.js"></script>
    					    <script src="./plugins/datatables/dataTables.bootstrap.min.js"></script>
    					    <script>
      
    </script>
</body>
	
</html>
<%}}%>