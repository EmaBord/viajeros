
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.i18n" />
<%@ tag import="model.usuario.Usuario"%>
<%@tag import="org.apache.struts2.components.ElseIf"%>
<%@tag description="Tag baseAdmin" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@attribute name="evento" fragment="true" %>
<%@attribute name="viajeros" fragment="true" %>
<%@attribute name="evento_nuevo" fragment="true" %>
<%@attribute name="eventos" fragment="true" %>
<%@attribute name="mailbox" fragment="true" %>
<%@attribute name="crear_admin" fragment="true" %>

<!DOCTYPE html>
<html>
<tags:head/>
<% Usuario u = (Usuario) session.getAttribute("usuario"); 
if (u == null)response.sendRedirect("/viajeros/");
else{ if (!u.getRol().getNombre().equals("admin"))response.sendError(HttpServletResponse.SC_NOT_FOUND);
		else {%>
<body class="hold-transition skin-blue sidebar-mini fixed " style="font-family: 'Comfortaa', cursive;">
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
						             
						              <!-- User Account: style can be found in dropdown.less -->
						              <li class="dropdown user user-menu" >
						                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						                  <img src="http://www.gravatar.com/avatar/${gravatar }" class="user-image" alt="User Image">
						                  <span class="hidden-xs">${usuario.nombre } ${usuario.apellido }</span>
						                </a>
						                <ul class="dropdown-menu" >
						                  <!-- User image -->
						                  <li class="user-header" style="background-color:#60AAAF;">
						                    <img src="http://www.gravatar.com/avatar/${gravatar }" class="img-circle" alt="User Image">
						                    <p>
						                      ${usuario.nombre } ${usuario.apellido }-  ${usuario.profesion }
						                      <small><fmt:message key="miembro_desde" /> ${usuario.ingreso }</small>
						                    </p>
						                  </li>
						                  
						                  <!-- Menu Footer-->
						                  <li class="user-footer">
						                    <div class="pull-left">
						                      <a href="../perfil" class="btn bg-olive btn-flat">Mi perfil</a>
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
						            <li class="header"><fmt:message key="menu_principal" /></li>
						             <li class="treeview <jsp:invoke fragment="evento"/>">
							              <a href="#" >
							                <i class="fa  fa-calendar"></i> <span><fmt:message key="eventos" /></span> <i class="fa fa-angle-left pull-right"></i>
							              </a>
							              <ul class="treeview-menu">
							              	 <li <jsp:invoke fragment="evento_nuevo"/>><a href="/viajeros/evento" id="newEvent" ><i class="fa fa-calendar-plus-o"></i> <fmt:message key="evento_nuevo" /></a></a></li>
							                <li>
							              
			
							                <li>
							                      
							                <li  <jsp:invoke fragment="eventos"/>><a href="/viajeros/listarEventos" id="listEvent"><i class="fa fa-th"></i> <fmt:message key="eventos_activos" /></a></li>
							                
							              </ul>
						          
						            
						            
						            <li  <jsp:invoke fragment="viajeros"/>>
						              <a href="/viajeros/listarViajeros" id="journals">
						                <i class="fa fa-users"></i>
						                <span><fmt:message key="viajeros" /></span>
						                
						              </a>
						              
						            </li>  
						            
						            <li  <jsp:invoke fragment="crear_admin"/>>
						              <a href="/viajeros/crear_admin" id="journals">
						                <i class="fa fa-user-plus"></i>
						                <span><fmt:message key="crear_admin" /></span>
						                
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
    <!-- DataTables -->
    <script src="./plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="./plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="./plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="./plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="./dist/js/app.min.js"></script>
						    
	   </body>
	
</html>
<%}}%>