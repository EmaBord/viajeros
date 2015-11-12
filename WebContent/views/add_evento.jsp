<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

	<%if ((session.getAttribute("perfil") == null) || (session.getAttribute("perfil").equals("viajero")) ){ %>
			<div class="jumbotron">
  				<h1>Error!</h1>
  				<p>No tiene los permisos suficientes para acceder al recurso solicitado.</p>
  				<p><a class="btn btn-primary btn-lg" href="./">Volver</a></p>
			</div>
	<%}else {%>
<t:base>
	<jsp:attribute name="evento_activo">
		active
	</jsp:attribute>


	<jsp:body>
		
        <form class="form-horizontal" method = 'post' action ='eventoAction' >
               <fieldset>
               <legend >Creación de un evento nuevo</legend>
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
                   
                   <button type="submit" class="btn btn-info btn-lg btn-block
                   ">Agregar Evento Nuevo</button>
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
    		          
	</jsp:body>	
	
</t:base>	
<%} %>	