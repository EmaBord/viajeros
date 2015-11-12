<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:base>
	<jsp:attribute name="login_activo">
		class='active'
	</jsp:attribute>
	<jsp:body>
		<div class="row">
              <div class="col-md-6 col-md-offset-3">
                <div class="well">                
                <form class="form-horizontal" method = 'post' action ='loginAction' >
                  <fieldset>
                  <legend class='text-center'>Iniciar Sesión</legend>
                  <div class="alert alert-dismissable alert-danger">
       				<button type="button" class="close" data-dismiss="alert">×</button>
         			<strong>usuario y/o clave incorrecta</strong> 
              	  </div>
                  <div class="form-group text-center">
                    <label for="inputUsuario" class="col-lg-2 control-label">Usuario</label>
                    <div class="col-lg-10">
                      <input type="text" name='nombre' class="form-control" id="inputUsuario" placeholder="Ingrese su nombre de usuario" autofocus required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputClave" class="col-lg-2 control-label">Clave</label>
                    <div class="col-lg-10">
                      <input type="password" class="form-control" id="inputClave" name='clave' placeholder='Ingrese su clave de acceso' required>        
                    </div>
                  </div>                  
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      
                      <button type="submit" class="btn btn-success btn-lg btn-block
                      ">Acceder</button>
                    </div>
                  </div>
                  </fieldset>
                 
                 
              			
              		
             
          
                </form>
              </div>
            </div>
          </div>
		
				
		
		
	</jsp:body>	
	
</t:base>	          
          
            