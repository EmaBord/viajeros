<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:baseAdmin>
<jsp:attribute name="evento">
		active
	</jsp:attribute>
<jsp:attribute name="evento_nuevo">
		class="active"
	</jsp:attribute>
<jsp:body>	 
	<section class="content-header">
         <h1>Evento nuevo</h1>
         <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Evento nuevo</li>
          </ol>
    </section>							
    <!-- Main content -->
    <section class="content">					      		 
 		<div class="row">
  			<div class="col-md-12">
				<form class="form-horizontal" method = 'post' action ='../evento' >
             	<fieldset>
             	<input type="hidden" class="form-control" id="inputSitio" name='hora' value="1"/>
             	<div class="form-group text-center">
               		<label for="inputFecha" class="col-lg-2 control-label" id="fecha">Día y hora del evento:</label>
               		<div class="col-xs-6">                   
                 		<input type="text" name='fecha'  class="form-control" id="datetimepicker" placeholder="dd/mm/YYYY HH:mm" required/>
               		</div>
             	</div>
             	<div class="form-group text-center">
               		<label for="inputNombre" class="col-lg-2 control-label">Nombre:</label>
               		<div class="col-xs-6">
                 		<input type="text" name='nombre' class="form-control" id="inputNombre" <c:if test="${not empty evento}">value="${evento.nombre}"</c:if>placeholder="Ingrese el nombre del evento" autofocus required/>
               		</div>
             	</div>
              	         
             	<div class="form-group">
               		<label for="inputSitio" class="col-lg-2 control-label">Sitio web:</label>
               		<div class="col-xs-6">
                 		<input type="text" class="form-control" id="inputSitio" name='sitioweb'<c:if test="${not empty evento}">value="${evento.sitio_web }"</c:if> placeholder='Ingrese el sitio del evento'/>        
               		</div>
             	</div>
             	<div class="form-group">
              		<label for="inputLugar" class="col-lg-2 control-label">Lugar</label>
            		<div class="col-xs-6">
                 		<input type="text" class="form-control" id="inputLugar" name='lugar' <c:if test="${not empty evento}">value="${evento.lugar }"</c:if>placeholder='Ingrese la dirección del evento, junto a su ciudad' required/>        
               		</div>
             	</div>
             	
             	<div class="form-group">
               		<div class="col-xs-6 col-lg-offset-2">
                 		<button type="submit" class="btn btn-info btn-lg btn-block ">Agregar Evento</button>
               		</div>
             	</div>
             	
            </fieldset>
            </form>
           <script type="text/javascript">
           		var nowDate = new Date();
           		var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(), 0, 0, 0, 0);
	           $('#datetimepicker').datetimepicker({
	        	   <c:if test="${not empty evento}">	        	   
	        	   	defaultDate:"${evento.fecha}",
	        	   	defaultTime:"${evento.hora}",
	        	   </c:if>
	        	   
	        	   	dayOfWeekStart : 1,
	          	 	lang:'es',
	          	 	inline: true,
                	sideBySide: true
                	
                
                
	          	 
	          	 });
	          	 $('#datetimepicker').datetimepicker({value:'',step:30,minDate:new Date()});
	
	          	 $('.some_class').datetimepicker();
	 		</script>  
	 		<div class="col-md-1"></div>
	 		<div class="col-md-8"> 
	 		<c:if test="${not empty mensaje}">
    		
	 			<div class="callout callout-success">
                    		<h4>${mensaje}</h4>
                </div>

			</c:if> 
	 		<c:if test="${not empty evento}">
    		
	 			<div class="callout callout-danger">
                    		<h4>${evento.nombre}-${evento.nombre}</h4>
                </div>

			</c:if>	 		
           </div>
       </div><!-- /.col (right) -->
   </div><!-- /.row -->

</section><!-- /.content -->
</jsp:body>	
</t:baseAdmin>