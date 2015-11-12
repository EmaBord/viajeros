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
                  
                  <div class="form-group text-center">
                    <label for="inputUsuario" class="col-lg-2 control-label">E-mail</label>
                    <div class="col-lg-10">
                      <input type="email" name='email' class="form-control" id="inputUsuario" placeholder="Ingrese su correo electrónico" autofocus required>
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
		
				
		<!-- <form action="usuario" namespace="/" method="POST">
			
			<input name="nombre" label="Nombre de usuario"/>
			<s:password name="clave" label="Clave de acceso"/>
			<s:submit value="Acceder" align="center" cssClass='btn btn-primary'/>
		</form> -->
		
	</jsp:body>	
	
</t:base>	          
          
            