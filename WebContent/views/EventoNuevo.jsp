<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="i18n.i18n" />

<t:baseAdmin>
<jsp:attribute name="evento">
		active
	</jsp:attribute>
<jsp:attribute name="evento_nuevo">
		class="active"
	</jsp:attribute>
<jsp:body>	 
	<section class="content-header">
         <h1><fmt:message key="evento_nuevo" /></h1>
         <ol class="breadcrumb">
            <li><a href="/viajeros/"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active"><fmt:message key="evento_nuevo" /></li>
          </ol>
    </section>							
    <!-- Main content -->
    <section class="content">					      		 
 		<div class="row">
  			<div class="col-md-12">
				<form class="form-horizontal" id="evento" method = 'post' action ='../evento' data-toggle="validator">
             	<fieldset>
             	<input type="hidden" class="form-control" id="inputSitio" name='hora' value="1"/>
             	<div class="form-group text-center">
             		
               		<label for="inputFecha" class="col-lg-2 control-label" id="fecha"><fmt:message key="evento_dia_hora" />:</label>
               		<div class="col-lg-6">                   
                 		<input type="text" name='fecha'  <c:if test="${not empty evento_existe}">placeholder="${evento_existe.fecha} ${evento_existe.hora}"</c:if> class="form-control" id="evento-dia" required data-error="<fmt:message key="evento_dia_hora_error" />"/>
                 		<div class="help-block with-errors"></div>
                 	</div>
                 	
               		
             	</div>
             	<div class="form-group text-center">
             		
               		<label for="inputNombre" class="col-lg-2 control-label"><fmt:message key="evento_nombre" />:</label>
               		<div class="col-lg-6">
                 		<input type="text" name='nombre' class="form-control" id="inputNombre" <c:if test="${not empty evento_existe}">value="${evento_existe.nombre}"</c:if> autofocus required data-error="<fmt:message key="evento_nombre_error" />"/>
               			<div class="help-block with-errors"></div> 
               		</div>
               		
               		
               		
             	</div>
              	         
             	
             	<div class="form-group text-center">
             		
              		<label for="inputLugar" class="col-lg-2 control-label"><fmt:message key="evento_lugar" /></label>
            		<div class="col-lg-6">
                 		<input type="text" class="form-control" id="inputLugar" name='lugar' <c:if test="${not empty evento_existe}">value="${evento_existe.lugar }"</c:if>placeholder='<fmt:message key="evento_lugar_placeholder" />' required data-error="<fmt:message key="evento_lugar_error" />"/>
                 		<div class="help-block with-errors"></div>         
               		</div>
             	</div>
             	<div class="form-group text-center">
               		<label for="inputSitio" class="col-lg-2 control-label"><fmt:message key="evento_sitioweb" />:</label>
               		<div class="col-lg-6">
                 		<input type="text" class="form-control" id="inputSitio" name='sitioweb'<c:if test="${not empty evento_existe}">value="${evento_existe.sitio_web }"</c:if> />        
               		</div>
             	</div>
             	<div class="form-group">
               		<div class="col-xs-6 col-lg-offset-2">
                 		<button type="submit" class="btn bg-olive btn-flat btn-lg btn-block " ><fmt:message key="evento_agregar" /></button>
               		</div>
             	</div>
             	
            </fieldset>
            </form>
            <script type="text/javascript" src="./datetimepicker-material/js/moment-with-locales.js"></script>
		<script type="text/javascript" src="./datetimepicker-material/js/bootstrap-material-datetimepicker.js"></script>	

           <script type="text/javascript">
           $('#evento-dia').bootstrapMaterialDatePicker({ 
        	   format : 'DD-MM-YYYY HH:mm', 
	        	   <c:if test="${not empty evento}">	        	   
	        	   	defaultDate:"${evento.fecha}",
	        	   	defaultTime:"${evento.hora}",
	        	   </c:if>
	        	   	<c:if test="${empty evento}">	        	   
	        	   	defaultDate:new Date(),
	        	   	defaultTime:new Date(),
	        	   </c:if>
	        	   
	        	   	dayOfWeekStart : 1,
	          	 	lang:'${language}',
	          	 	inline: true,
                	sideBySide: true,
                	minDate:new Date()
                	
                
                
	          	 
	          	 });
	          	
	
	          	
	 		</script>  
	 		<div class="col-md-1"></div>
	 		<div class="col-md-8"> 
	 		<c:if test="${not empty mensaje_nuevo_evento}">
    		
	 			<div class="callout callout-success">
                    		<h4>${mensaje_nuevo_evento}</h4>
                </div>

			</c:if> 
			
	 		<c:if test="${not empty evento_existe}">
    		
	 			<div class="callout callout-danger">
                    		<h4><fmt:message key="evento_existe" /></h4>
                </div>

			</c:if>	 
			<c:if test="${not empty mensaje_nuevo_evento_error}">
    		
	 			<div class="callout callout-danger">
                    		<h4>${mensaje_nuevo_evento_error }</h4>
                </div>

			</c:if>	 		
           </div>
           
       </div><!-- /.col (right) -->
   </div><!-- /.row -->

</section><!-- /.content -->

<script src="./js/validator.js"></script>

</jsp:body>	
</t:baseAdmin>