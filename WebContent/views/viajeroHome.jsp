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
<jsp:attribute name="viajes_activos">
		class="active"
	</jsp:attribute>
<jsp:body>	
       <section class="content-header">
          <h1>
            <fmt:message key="viajes_activos" />
            
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
                    		<h3 class="timeline-header"><a href="#"><fmt:message key="viaje_solo_por_dia" /> </a> <fmt:message key="del_conductor" />  ${recorrido.creador.nombre } ${recorrido.creador.apellido } </h3>
                    		<div class="timeline-body">
                    			<div class="row">
                    				<table class="table ">
                    					<tbody>
                    						<tr>
                    							<td class="text-red"><i class="material-icons">alarm</i> <fmt:message key="viaje_sale" />: ${recorrido.salida }</td>
                    							<td class="text-light-blue"><i class="material-icons">alarm_on</i> <fmt:message key="viaje_llega" />: ${recorrido.llegada }</td>
                    						</tr>
                    						<tr>
                    							<td class="text-green">
                    								<i class="material-icons">airline_seat_recline_normal</i>
                    					 			<fmt:message key="asientos_disponibles" />:
                    					 			<span class="badge bg-green">${recorrido.asientos }</span>
                    					  
                    							</td>
                    							<td class="text-navy">
                    								<c:if test="${not empty recorrido.nopermitido}">
	                    								<i class="material-icons">thumb_down</i><fmt:message key="no_se_permite" /> :
	                    					 			<c:forEach items="${recorrido.nopermitido}" var="no">
	                    					 				<span class="badge bg-orange-active">${no }</span>
	                    					 			</c:forEach>
                    					 			</c:if>
                    					 			
                    			    			</td>
                    						</tr>
                    						<c:if test="${not empty recorrido.evento}">
                    							<c:if test="${not recorrido.evento.eliminado}">
		                    						<tr>
		                    							<td class=" text-purple"><i class="material-icons">event_available</i> <fmt:message key="evento" />: ${recorrido.evento.nombre} (${recorrido.evento.lugar})</td>
		                    						</tr>
		                    					</c:if>
                    						</c:if>
                    						<c:if test="${not empty recorrido.urlMaps}">
                    						<tr>
                    							<td  class="text-left" colspan="2">
			                    					
						                           <a data-toggle="collapse" data-parent="#accordion${recorrido.id }" href="#collapseOne${recorrido.id }">
						                            <i class="material-icons">room</i> <fmt:message key="click_gmaps" />
						                          </a>
						                        	
							                      <div id="collapseOne${recorrido.id }" class="panel-collapse collapse">
							                        <div class="embed-responsive embed-responsive-16by9">
							                          <iframe src="${recorrido.urlMaps}" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
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
	                    				<i class="material-icons">directions_run</i><fmt:message key="subir" /> 
	                  				</a>
								</div>
                    	 </div>
                  	 </div>
                 </li>
               </c:forEach>
               
               
               <c:forEach items="${recorridos}" var="recorrido">
				<li class="time-label">
                  <span class="bg-teal-active">
                    ${recorrido.desde}- ${recorrido.hasta}
                  </span>
                </li>
                <!-- /.timeline-label -->
                <!-- timeline item -->
                <li>
                  <i class="fa fa-car bg-olive"></i>
                  <div class="timeline-item">	
                    <h3 class="timeline-header"><a href="#"><fmt:message key="viaje_mas_de_un_dia" />  </a><fmt:message key="del_conductor" /> ${recorrido.creador.nombre} ${recorrido.creador.apellido}  </h3>
                    <div class="timeline-body">
                    	
                    	<table class="table ">
                    		<tbody>
                    			<tr>
                    				<td class=" text-red"><i class="material-icons">alarm</i> <fmt:message key="viaje_sale" />:${recorrido.salida}</td>
                    				<td class=" text-light-blue"><i class="material-icons">alarm_on</i> <fmt:message key="viaje_llega" />: ${recorrido.llegada}</td>
                    			</tr>
                    			<tr>
                    				<td class=" text-green">
                    					<i class="material-icons">airline_seat_recline_normal</i>
                    					 <fmt:message key="asientos_disponibles" />:
                    					 <span class="badge bg-green">${recorrido.asientos}</span>
                    					  
                    				</td>
                    				<td class=" text-navy">
                    					<c:if test="${not empty recorrido.nopermitido}">
                    					
              								<i class="material-icons">thumb_down</i> <fmt:message key="no_se_permite" />:
              					 			<c:forEach items="${recorrido.nopermitido}" var="no">
              					 				<span class="badge bg-orange-active">${no }</span>
              					 			</c:forEach>
            					 		</c:if>
                    			    </td>
                    			</tr>
                    			<tr>
                    				
                    				<td  >
                    					<i class="material-icons">event_note</i> <fmt:message key="dias_que_se_viaja" />:
                    					<c:forEach items="${recorrido.dias}" var="dia">
                    					 <span class="badge bg-lime-active">${dia}</span>
                    					</c:forEach>
                    				</td>
                    				<td class=" text-info"><i class="material-icons">event_busy</i> <fmt:message key="finaliza" />: ${recorrido.finaliza}</td>
                    			</tr>
                    			<c:if test="${not empty recorrido.evento}">
                    				<c:if test="${not recorrido.evento.eliminado}">
		                    			<tr>
		                    				<td class=" text-purple" colspan="2"><i class="material-icons">event_available</i> <fmt:message key="evento" />: ${recorrido.evento.nombre}</td>
		                    			</tr>
		                    		</c:if>
	                    		</c:if>
                    			<c:if test="${not empty recorrido.urlMaps}">
               						<tr>
               							<td  class="text-left" colspan="2">
                    					
			                           <a data-toggle="collapse" data-parent="#accordion${recorrido.id }" href="#collapseOne${recorrido.id }">
			                            <i class="material-icons">room</i> <fmt:message key="click_gmaps" />
			                          </a>
			                        	
				                      <div id="collapseOne${recorrido.id }" class="panel-collapse collapse">
				                        <div class="embed-responsive embed-responsive-16by9">
				                          <iframe src="${recorrido.urlMaps}" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
				                        </div>
				                      </div>
                    
           							  </td>
                 						
             					    </tr>
                 				</c:if>
                    	
                    		</tbody>
						</table>
						
						<div class="timeline-footer">
						  <a class="btn btn-app bg-blue-active pull-right">
                    		<i class="material-icons">directions_run</i> <fmt:message key="subir" />
	                  	  </a>
						</div>			  
			                      
			                      
			        </div>
						
                  </div>
                </li>
                </c:forEach>
               


								


           
                
                
                
              </ul>
            </div><!-- /.col -->
          </div><!-- /.row -->

</jsp:body>

</t:baseViajero>		
