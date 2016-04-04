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
<jsp:attribute name="crear_admin">
		class="active"
	</jsp:attribute>
<jsp:body>	 
	<section class="content-header">
         <h1><fmt:message key="usuario_admin_nuevo" /></h1>
         <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active"><fmt:message key="crear_admin" /></li>
          </ol>
    </section>							
    <!-- Main content -->
    <section class="content">					      		 
 		<div class="row">
  			<div class="col-md-12">
				<form class="form-horizontal"  method = 'post' action ='../admin_nuevo' data-toggle="validator">
             	<fieldset>
             	<div class="form-group text-center">
             		
               		<label for="inputNombre" class="col-lg-2 control-label" ><fmt:message key="nombre" />:</label>
               		<div class="col-lg-6">                   
                 		<input type="text"  class="form-control" id="inputNombre" name='nombre'   required />

                 	</div>
                 	
               		
             	</div>
             	<div class="form-group text-center">
             		
               		<label for="inputApellido" class="col-lg-2 control-label" ><fmt:message key="apellido" />:</label>
               		<div class="col-lg-6">                   
                 		<input type="text" class="form-control" name='apellido' id="inputApellido"  required />

                 	</div>
                 	
               		
             	</div>
             	<div class="form-group text-center">
             		
               		<label for="inputEmail" class="col-lg-2 control-label"><fmt:message key="email" />:</label>
               		<div class="col-lg-6">                   
                 		<input type="text" class="form-control" name='email' id="inputEmail"  required />
                 	</div>                	
               		
             	</div>
             	
             	<div class="form-group" >
             		<label for="clave" class="col-lg-2 control-label" ><fmt:message key="clave" />:</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" name='clave' id="clave"  required>
					
					</div>
			    </div>
			  	<div class="form-group" >
			  		<label for="clave2" class="col-lg-2 control-label" ><fmt:message key="clave2" />:</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" name='clave2'  required  data-match="#clave" data-match-error="<fmt:message key="claves_no_coinciden"/>">
					</div>
					<div class="help-block with-errors"></div> 
			  	</div>
             	
             	
             	
             	<div class="form-group">
               		<div class="col-xs-6 col-lg-offset-2">
                 		<button type="submit" class="btn bg-olive btn-flat btn-lg btn-block " ><fmt:message key="agregar_usuario" /></button>
               		</div>
             	</div>
             	
            </fieldset>
            </form>
            
           
	 		
	 		<div class="col-md-8"> 
	 		<c:if test="${not empty exito}">
    		
	 			<div class="callout callout-success">
                    		<h4>${exito}</h4>
                </div>

			</c:if> 
			
	 		<c:if test="${not empty existe}">
    		
	 			<div class="callout callout-danger">
                    		<h4>${existe }</h4>
                </div>

			</c:if>	 
			           </div>
           
       </div><!-- /.col (right) -->
   </div><!-- /.row -->

</section><!-- /.content -->

<script src="./js/validator.js"></script>

</jsp:body>	
</t:baseAdmin>