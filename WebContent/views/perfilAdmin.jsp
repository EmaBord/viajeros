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
						                  
<jsp:body>	
											<section class="content-header">
							         <h1><fmt:message key="actualizar_datos" /></h1>
							         <ol class="breadcrumb">
							            <li><a href="/viajeros/"><i class="fa fa-dashboard"></i> Home</a></li>
							            <li class="active"><fmt:message key="mis_datos" /></li>
							          </ol>
							    </section>							
							    <!-- Main content -->
							    <section class="content">					      		 
							 		<div class="row">
							 			<div class="col-md-6 col-md-offset-2">
							  				<c:if test="${not empty claves_no_coinciden}">
    		
	 											<div class="callout callout-danger">
                    								<h4>${claves_no_coinciden }</h4>
               								 	</div>

											</c:if>
										</div>	 
							  			<div class="col-md-12">
											<form class="form-horizontal"  method = 'post' action ='../actualizar_datos' data-toggle="validator">
							             	<fieldset>
							             	<div class="form-group text-center">
							               		<label for="inputEmail" class="col-lg-2 control-label"><fmt:message key="email" />:</label>
							               		<div class="col-lg-6">
							                 		<input type="text" class="form-control" id="inputEmail" name='email' value="${usuario.email }" disabled/>        
							               		</div>
							             	</div>
							             	<div class="form-group text-center">             		
							               		<label for="inputNombre" class="col-lg-2 control-label"><fmt:message key="nombre" />:</label>
							               		<div class="col-lg-6">
							                 		<input type="text" name='nombre' class="form-control" id="inputNombre"  value="${usuario.nombre }" required/>
							               			<div class="help-block with-errors"></div> 
							               		</div>
							               	</div>
							              	         
							             	
							             	<div class="form-group text-center">
							             		
							              		<label for="inputApellido" class="col-lg-2 control-label"><fmt:message key="apellido" /></label>
							            		<div class="col-lg-6">
							                 		<input type="text" class="form-control" id="inputApellido" name='apellido' value="${usuario.apellido }" required/>
							                 		<div class="help-block with-errors"></div>         
							               		</div>
							             	</div>
							             	<div class="form-group text-center">
							               		<label for="inputTelefono" class="col-lg-2 control-label"><fmt:message key="viajero_telefono" />:</label>
							               		<div class="col-lg-6">
							                 		<input type="text" class="form-control" id="inputTelefono" name='telefono' value="${usuario.telefono }"/>        
							               		</div>
							             	</div>
							             		<div class="form-group text-center">
							               		<label for="inputProfesion" class="col-lg-2 control-label"><fmt:message key="profesion" />:</label>
							               		<div class="col-lg-6">
							                 		<input type="text" class="form-control" id="inputProfesion" name='profesion' value="${usuario.profesion }"/>        
							               		</div>
							             	</div>
							             	<div class="form-group text-center">
							               		<label for="inputPass" class="col-lg-2 control-label"><fmt:message key="clave" />:</label>
							               		<div class="col-lg-6">
							                 		<input type="password" class="form-control" id="inputPass" name='clave' required/>        
							               		</div>
							               		<div class="help-block with-errors"></div> 
							             	</div>
							             	
							             	<div class="form-group text-center">
							               		<label for="inputPass2" class="col-lg-2 control-label"><fmt:message key="clave2" />:</label>
							               		<div class="col-lg-6">
							                 		<input type="password" class="form-control" id="inputPass2" name='clave2' required data-match="#inputPass" data-match-error="<fmt:message key="claves_no_coinciden" />"/>        
							               		</div>
							               		<div class="help-block with-errors"></div> 
							             	</div>
							             	
							             	<div class="form-group">
							               		<div class="col-xs-12 col-lg-6 col-lg-offset-2">
							                 		<button type="submit" class="btn bg-olive btn-flat btn-lg btn-block " ><fmt:message key="actualizar_datos" /></button>
							               		</div>
							             	</div>
							             	
							            </fieldset>
							           </form>
							         </div>
							        </div>
							      </section>
									<c:if test="${not empty claves_no_coinciden}">
    		
	 			<div class="callout callout-danger">
                    		<h4>${claves_no_coinciden }</h4>
                </div>

			</c:if>
		
	<script src="./js/validator.js"></script>
	</jsp:body>
	</t:baseAdmin>
							









					
		

