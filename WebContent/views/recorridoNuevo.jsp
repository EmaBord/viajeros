
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

<t:baseViajero>
<jsp:attribute name="recorrido_nuevo">
		class="active"
	</jsp:attribute>
<jsp:body>	 
	<section class="content-header">
         <h1><fmt:message key="nuevo_viaje" /></h1>
         <ol class="breadcrumb">
            <li><a href="/viajeros/timeline_viajero"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active"><fmt:message key="nuevo_viaje" /></li>
          </ol>
    </section>							
    <!-- Main content -->
    <section class="content">					      		 
 		<div class="row">
  			<div class="col-md-12">
				<form class="form-horizontal" id="recorrido" method = 'post' action ='../recorridoNuevo' data-toggle="validator">
             	<fieldset>
             	<div class="col-md-12">
	             	<div class="box box-info">
		                <div class="box-header with-border">
		                  <h3 class="box-title text-center"><fmt:message key="datos_viaje" /></h3>
		                </div>
		                <div class="box-body">
		                
		                  <div class="row">
				            <label for="inputNombre" class="col-md-2 control-label"><fmt:message key="salida_a" />:</label>
		               		<div class="col-md-2">
		                 		<input type="text" name='salida' id='date-start' class="form-control" required/>
		               			
		               		</div>
		               		
		               		<label for="inputNombre" class="col-md-2 control-label"><fmt:message key="viaje_desde" />:</label>
		               		<div class="col-md-6">
		                 		<input type="text" name='desde' class="form-control" placeholder="<fmt:message key="viaje_placeholder_desde" />" required/>
		               			
		               		</div>
		               		<br><br>
		               		<label for="inputNombre" class="col-md-2 control-label"><fmt:message key="viaje_llegada" />:</label>
		               		<div class="col-md-2">
		                 		<input type="text" name='llegada' id='date-stop' class="form-control" required/>
		                 	</div>	
		                 	<label for="inputNombre" class="col-md-2 control-label"><fmt:message key="viaje_en" />:</label>
		               		<div class="col-md-6">
		                 		<input type="text" name='hasta' class="form-control" placeholder="<fmt:message key="viaje_placeholder_llegada" />" required/>
		               			
		               		</div>
		               		<br><br>
		               		<label for="inputNombre" class="col-md-2 control-label"><fmt:message key="asientos_disponibles" />:</label>
		               		<div class="col-md-2">
		                 		<input type="number" step="1" min="1" name='asientos' class="form-control" required />
		               			
		               		</div>
		               		
		               		<label for="inputNombre" class="col-md-2 control-label"><fmt:message key="viaje_gmaps_url" />":</label>
		               		<div class="col-md-6">
		                 		<input type="text" name='ruta' class="form-control" placeholder="<fmt:message key="viaje_placeholder_url_gmaps" />" />
		               			
		               		</div>
						</div>	
		                    
		                  </div>
		                </div><!-- /.box-body -->
	              </div>  
             	<div class="col-md-6">
	             	<div class="box box-info">
		                <div class="box-header with-border">
		                  <h3 class="box-title text-center"><fmt:message key="viaje_periodicidad" /></h3>
		                </div>
		                <div class="box-body">
		                  <div class="row">
		                  	<div class="col-md-6">
		                  		<input type="radio" id="periodicidad1" name="periodicidad" value="0" checked>
								<label><fmt:message key="viaje_solo_por_dia" /></label>
							</div>
							<div class="col-md-6">
		                  		<input type="radio" id="periodicidad2" name="periodicidad" value="1">
								<label><fmt:message key="viaje_mas_de_un_dia" /></label>
							</div>
							
						</div>	
		                    
		                  </div>
		                </div><!-- /.box-body -->
	              </div>
	              <div class="col-md-6">
	             	<div class="box box-info">
		                <div class="box-header with-border">
		                  <h3 class="box-title text-center"><fmt:message key="viaje_evento" /></h3>
		                </div>
		                <div class="box-body">
		                  <div class="row">
		                  	<div class="col-md-12">
				                    <select name="evento" class="select2" style="width:100%;">
				                      <option value="0" selected="selected"><fmt:message key="viaje_evento_ninguno" /></option>
				                      <c:forEach items="${eventos}" var="evento">
				                      <option value="${evento.id}">${evento.nombre} - ${evento.lugar} - ${evento.fecha} </option>
				                      
				                      </c:forEach>
					                    
				                    </select>
                  			</div>
                  		</div>
                  	</div>
                  </div>
		        </div><!-- /.box-body -->
	            <div id="mas_de_una_vez" class="col-md-12">
	             	<div class="box box-info">
		                <div class="box-header with-border">
		                  <h3 class="box-title text-center"><fmt:message key="viaje_mas_de_un_dia" /></h3>
		                </div>
		                <div class="box-body">
		                  <div class="row">		
		                  	<div class="col-md-2">                 
		                    	<div class="col-md-12 ">
		                      		<input type="checkbox" name="dias" value="lunes" class="minimal-red" checked>
		                       		<label><fmt:message key="lunes" /></label>
		                    	</div>
		                    	<div class="col-md-12">
		                      		<input type="checkbox" name="dias" value="martes" class="minimal-red">
		                    		<label><fmt:message key="martes" /></label>
		                    	</div>
		                    	<div class="col-md-12">
		                      		<input type="checkbox" name="dias" value="miercoles" class="minimal-red" >
		                    		<label><fmt:message key="miercoles" /></label>
		                    	</div>
		                 	</div>
		                 	<div class="col-md-2">
		                    	<div class="col-md-12">
		                      		<input type="checkbox" name="dias" value="jueves" class="minimal-red" >
		                    		<label><fmt:message key="jueves" /></label>
		                    	</div>
		                        <div class="col-md-12">
		                      		<input type="checkbox" name="dias" value="viernes" class="minimal-red" >
		                    		<label><fmt:message key="viernes" /></label>
		                    	</div>
		                    	<div class="col-md-12">
		                      		<input type="checkbox" name="dias" value="sabado" class="minimal-red" >
		                    		<label><fmt:message key="sabado" /></label>
		                    	</div>
		                   </div>
		                   <div class="col-md-2">
		                    	<div class="col-md-12">
		                      		<input type="checkbox" name="dias" value="domingo" class="minimal-red" >
		                    		<label><fmt:message key="domingo" /></label>
		                    	</div>
 						   </div>	
							<div class="col-md-6">
								<label for="inputNombre"  class="col-md-4 control-label"><fmt:message key="viaje_finaliza_dia"/>:</label>
								<div class="col-md-4">
		                 			<input type="text" name="finaliza" id='date-end' class="form-control" />
		               			</div>
						   </div>		                    
		                </div>
		             </div><!-- /.box-body -->
	              </div>
	            </div>
			    <div class="col-md-12">
	             	<div class="box box-info">
		                <div class="box-header with-border">
		                  <h3 class="box-title text-center"><fmt:message key="viaje_no_permitido" /></h3>
		                </div>
		                <div class="box-body">
		                  <div class="row">
		                  	<div class="col-md-12">
				                    <select name="nopermitido" class="form-control select2" multiple="multiple"  >
				                      <option value="comer"> <fmt:message key="comer" /></option>
				                      <option value="beber"><fmt:message key="beber" /></option>
				                      <option value="fumar"><fmt:message key="fumar" /></option>
				                      <option value="mascotas"><fmt:message key="mascotas" /></option>
				                      <option value="musica"><fmt:message key="musica" /></option>				                      
                    				</select>
                  			</div>
                  		</div>
                  	</div>
                  </div>
		        </div><!-- /.box-body -->		
					
					
				
              	
             	
             	<div class="form-group">
               		<div class="col-xs-12 col-md-12 ">
                 		<button type="submit" class="btn bg-olive btn-lg btn-block "><fmt:message key="crear_viaje" /> </button>
               		</div>
             	</div>
             	
            </fieldset>
            </form>
 
	 		<div class="col-md-1"></div>
	 		<div class="col-md-8"> 
 		
           </div>
           
       </div><!-- /.col (right) -->
   </div><!-- /.row -->

</section><!-- /.content -->

<script type="text/javascript" src="./datetimepicker-material/js/moment-with-locales.js"></script>
<script type="text/javascript" src="./datetimepicker-material/js/bootstrap-material-datetimepicker.js"></script>	
<script>
$("#mas_de_una_vez").css("display","none");
$(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
	});
$('#date-start').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm',  lang : "${language}" ,minDate : new Date() })
$('#date-stop').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm',  lang : "${language}" ,minDate : new Date() })
$('#date-end').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY',  lang : "${language}" ,minDate : new Date(),time:false })



$(document).ready(function(){
  $('input').each(function(){
    var self = $(this),
      label = self.next(),
      label_text = label.text();

    label.remove();
    self.iCheck({
      checkboxClass: 'icheckbox_line-green',
      radioClass: 'iradio_line-green',
      insert: '<div class="icheck_line-icon"></div>' + label_text
    });
   
  });
});
$(document).ready(
	    function(){
	    	 $('#periodicidad2').on('ifChecked', function(event){
	    		 $("#mas_de_una_vez").show("slow");
	    		 $('#date-end').prop('required', true);
	       	});
	        

	    });
$(document).ready(
	    function(){
	        $("#periodicidad1").on('ifChecked', function(event){
	            $("#mas_de_una_vez").hide("slow");
	            $('#date-end').prop('required', false);
	        });

	    });
</script>
</jsp:body>	
</t:baseViajero>