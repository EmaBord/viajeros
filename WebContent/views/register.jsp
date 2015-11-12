<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:base>
	<jsp:attribute name="register_activo">
		class='active'
	</jsp:attribute>


	<jsp:body>
        <form class="form-horizontal" method = 'post' action ='registerAction' data-toggle="validator" role="form" enctype="multipart/form-data" >
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
                   <input type="text" name='apellido' class="form-control" id="inputApellido" placeholder="Ingrese su apellido"  required>
                 </div>
               </div>
               
               <div class="form-group text-center">
                 <label for="inputTel" class="col-lg-2 control-label">Telefono</label>
                 <div class="col-xs-6">
                   <input type="tel" name='telefono' class="form-control" id="inputTel" placeholder="Ingrese su telefono"  required>
                 </div>
               </div>
               
               <div class="form-group text-center">
                 <label for="inputEmail" class="col-lg-2 control-label">E-mail</label>
                 <div class="col-xs-6">
                   <input type="email" name='email' class="form-control" id="inputEmail" placeholder="Ingrese su E-mail"  data-error="El correo es inválido" required>
                           
                   <div class="help-block with-errors"></div>  
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
                   <input type="password" class="form-control" id="inputClave2" name='clave2' placeholder='Vuelva a ingresarla' required data-match="#inputClave" data-match-error="Las claves no coinciden">
                   <div class="help-block with-errors"></div>          
                 </div>
               </div>  
               
               <div class="form-group">
                 <label for="inputImagen" class="col-lg-2 control-label">Seleccione una foto de Perfil</label>
                 <div class="col-xs-6">
                   <input type="file" class="form-control" id="inputImagen" name='foto'>        
                 </div>
               </div>                  
               
               <div class="form-group">
                 <div class="col-xs-6 col-lg-offset-2">
                   
                   <button type="submit" class="btn btn-warning btn-lg btn-block
                   ">Registrarme</button>
                 </div>
               </div>
               
               </fieldset>
               <!-- {% if mensaje%}
           		<div class="alert alert-dismissable alert-danger">
             		<strong>{{mensaje}}</strong> 
          		 </div>
          
      			 {% endif%} -->
             </form>
	</jsp:body>	
	
</t:base>		