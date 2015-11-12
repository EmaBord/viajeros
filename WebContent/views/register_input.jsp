<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:base>
	<jsp:attribute name="register_activo">
		class='active'
	</jsp:attribute>


	<jsp:body>
        <form class="form-horizontal" method = 'post' action ='register' >
               <fieldset>
               <legend >Registrarse en Info Pool</legend>
               <div class="form-group text-center">
                 <label for="inputNombre" class="col-lg-2 control-label">Nombre</label>
                 <div class="col-xs-6">
                   <input type="text" name='nombre' class="form-control" id="inputNombre" placeholder="Ingrese su nombre" autofocus required>
                 </div>
               </div>
               
               <div class="form-group text-center">
                 <label for="inputApellido" class="col-lg-2 control-label">Apellido</label>
                 <div class="col-xs-6">
                   <input type="text" name='apellido' class="form-control" id="inputApellido" placeholder="Ingrese su apellido" autofocus required>
                 </div>
               </div>
               
               <div class="form-group text-center">
                 <label for="inputTel" class="col-lg-2 control-label">Telefono</label>
                 <div class="col-xs-6">
                   <input type="text" name='telefono' class="form-control" id="inputTel" placeholder="Ingrese su telefono" autofocus required>
                 </div>
               </div>
               
               <div class="form-group text-center">
                 <label for="inputEmail" class="col-lg-2 control-label">E-mail</label>
                 <div class="col-xs-6">
                   <input type="text" name='email' class="form-control" id="inputEmail" placeholder="Ingrese su E-mail" autofocus required>
                 </div>
               </div>
               
               <div class="form-group">
                 <label for="inputClave" class="col-lg-2 control-label">Clave</label>
                 <div class="col-xs-6">
                   <input type="password" class="form-control" id="inputClave" name='clave' placeholder='Ingrese su clave' required>        
                 </div>
               </div>
               
               <div class="form-group">
                 <label for="inputClave2" class="col-lg-2 control-label">Repita la clave</label>
                 <div class="col-xs-6">
                   <input type="password" class="form-control" id="inputClave2" name='clave2' placeholder='Vuelva a ingresarla' required>        
                 </div>
               </div>  
               
               <div class="form-group">
                 <label for="inputImagen" class="col-lg-2 control-label">Seleccione una foto de Perfil</label>
                 <div class="col-xs-6">
                   <input type="file" class="form-control" id="inputImagen" name='foto'  required>        
                 </div>
               </div>                  
               
               <div class="form-group">
                 <div class="col-xs-6 col-lg-offset-2">
                   
                   <button type="submit" class="btn btn-info btn-lg btn-block
                   ">Registrarme</button>
                 </div>
               </div>
               
               </fieldset>
               
           		<div class="alert alert-dismissable alert-danger">
             		<strong>El nombre de usuario ya existe, seleccione otro</strong> 
          		 </div>
          
      			
             </form>
	</jsp:body>	
	
</t:base>		