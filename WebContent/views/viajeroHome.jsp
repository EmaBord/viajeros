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

<jsp:body>	
       <section class="content-header">
          <h1>
            Viajes disponibles
            
          </h1>
          <ol class="breadcrumb">
            <li><a href="/viajeros/timeline_viajero"><i class="fa fa-dashboard"></i> Home</a></li>
            
            
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- row -->
          <div class="row">
            <div class="col-md-12">
              <!-- The time line -->
              <ul class="timeline">
                <!-- timeline time label -->
                
                
                <c:forEach items="${recorridosUnicos}" var="recorrido">
                	<li class="time-label">
                  		<span class="bg-teal-active" >
                    		${recorrido.desde}- ${recorrido.hasta}
                  		</span>
                	</li>
                	<!-- /.timeline-label -->
                	<!-- timeline item -->
                	<li>
                  		<i class="fa fa-car bg-olive"></i>
                  		<div class="timeline-item">                    		
                    		<h3 class="timeline-header"><a href="#">Viaje de un sólo día </a> del coductor ${recorrido.creador.nombre } ${recorrido.creador.apellido } </h3>
                    		<div class="timeline-body">
                    			<div class="row">
                    				<table class="table ">
                    					<tbody>
                    						<tr>
                    							<td class="text-red"><i class="material-icons">alarm</i> Sale: ${recorrido.salida }</td>
                    							<td class="text-light-blue"><i class="material-icons">alarm_on</i> Llega (aprox.): ${recorrido.llegada }</td>
                    						</tr>
                    						<tr>
                    							<td class="text-green">
                    								<i class="material-icons">airline_seat_recline_normal</i>
                    					 			Asientos dispobibles:
                    					 			<span class="badge bg-green">${recorrido.asientos }</span>
                    					  
                    							</td>
                    							<td class="text-navy">
                    								<i class="material-icons">thumb_down</i> No se permite:
                    					 			<c:forEach items="${recorrido.nopermitido}" var="no">
                    					 				<span class="badge bg-orange-active">${no }</span>
                    					 			</c:forEach>
                    					 			
                    			    			</td>
                    						</tr>
                    						<c:if test="${not empty recorrido.evento}">
                    						<tr>
                    							<td class=" text-purple"><i class="material-icons">event_available</i> Evento: ${recorrido.evento.nombre} (${recorrido.evento.lugar})</td>
                    						</tr>
                    						</c:if>
                    						<c:if test="${not empty recorrido.urlMaps}">
                    						<tr>
                    							<td  class="text-left" colspan="2">
			                    					
						                           <a data-toggle="collapse" data-parent="#accordion${recorrido.id }" href="#collapseOne${recorrido.id }">
						                            <i class="material-icons">room</i> Click para ver la Ruta en google maps
						                          </a>
						                        	
							                      <div id="collapseOne${recorrido.id }" class="panel-collapse collapse">
							                        <div class="embed-responsive embed-responsive-16by9">
							                          <iframe src="${recorrido.urlMaps}&key=AIzaSyDVllt_2i9RbXSzc8ckxRZpENKLHFcsIAA" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
							                        </div>
							                      </div>
			                    
                    							</td>
                    						
                    						</tr>
                    						</c:if>

                    					</tbody>
									</table>
								</div>
                    			<div class="timeline-footer">
                      				<a class="btn btn-app bg-blue-active pull-right">
	                    				<i class="material-icons">directions_run</i> Subir
	                  				</a>
								</div>
                    	 </div>
                  	 </div>
                 </li>
               </c:forEach>
               
               
               
<li class="time-label">
                  <span class="bg-teal-active">
                    1 y 50 La Plata - Concordia 1700 Cap Fed
                  </span>
                </li>
                <!-- /.timeline-label -->
                <!-- timeline item -->
                <li>
                  <i class="fa fa-car bg-olive"></i>
                  <div class="timeline-item">	
                    <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
                    <h3 class="timeline-header"><a href="#">Viaje de más de un día </a>del conductor Emanuel Borda </h3>
                    <div class="timeline-body">
                    	
                    	<table class="table ">
                    		<tbody>
                    			<tr>
                    				<td class=" text-red"><i class="material-icons">alarm</i> Sale: 27/03/2016 18:02</td>
                    				<td class=" text-light-blue"><i class="material-icons">alarm_on</i> Llega (aprox.): 27/03/2016 20:02</td>
                    			</tr>
                    			<tr>
                    				<td class=" text-green">
                    					<i class="material-icons">airline_seat_recline_normal</i>
                    					 Asientos dispobibles:
                    					 <span class="badge bg-green">4</span>
                    					  
                    				</td>
                    				<td class=" text-navy">
                    					<i class="material-icons">thumb_down</i> No se permite:
                    					 <span class="badge bg-orange-active">Comer</span>
                    					 <span class="badge bg-orange-active">Fumar</span>
                    			    </td>
                    			</tr>
                    			<tr>
                    				
                    				<td  >
                    					<i class="material-icons">event_note</i> Dias que se viaja:
                    					 <span class="badge bg-lime-active">Lunes</span>
                    					 <span class="badge bg-lime-active">Martes</span>
                    					 <span class="badge bg-lime-active">Viernes</span>
                    				</td>
                    				<td class=" text-info"><i class="material-icons">event_busy</i> Finaliza: 05/04/2016</td>
                    			</tr>
                    			<tr>
                    				<td class=" text-purple" colspan="2"><i class="material-icons">event_available</i> Evento: Ekoparty</td>
                    			</tr>
                    			<tr>
                    			<td  class="text-left" colspan="2">
                    					
			                           <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
			                            <i class="material-icons">room</i> Click para ver la Ruta en google maps
			                          </a>
			                        	
				                      <div id="collapseOne" class="panel-collapse collapse">
				                        <div class="embed-responsive embed-responsive-16by9">
				                          <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d419619.2069212472!2d-58.480579689885595!3d-34.748663480762325!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e0!4m5!1s0x95a2e7d4803c4d3f%3A0x329066a0dd30d73b!2sCalle+50%2C+La+Plata%2C+Buenos+Aires!3m2!1d-34.9192791!2d-57.954708!4m5!1s0x95bcb5ebd7cbfb9d%3A0xe8bf7bc922e5557b!2sCapital+Federal%2C+Tte.+Benjam%C3%ADn+Matienzo+3136%2C+Buenos+Aires!3m2!1d-34.5790682!2d-58.445735199999994!5e0!3m2!1ses-419!2sar!4v1459114786809" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
				                        </div>
				                      </div>
			                    
                    			</td>
                    			
                    			</tr>
                    	
                    		</tbody>
						</table>
						
						<div class="timeline-footer">
						  <a class="btn btn-app bg-blue-active pull-right">
                    		<i class="material-icons">directions_run</i> Subir
	                  	  </a>
						</div>			  
			                      
			                      
			        </div>
						
                  </div>
                </li>
               


								


           
                
                
                
              </ul>
            </div><!-- /.col -->
          </div><!-- /.row -->

</jsp:body>

</t:baseViajero>		
