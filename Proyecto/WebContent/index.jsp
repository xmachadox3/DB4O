<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.conexion.BDOO"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.clases.CasaPlaya"%>
<%@page import="com.clases.Propietario"%>
<%@page import="com.clases.Paquete"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>

<% ObjectContainer db = BDOO.obtenerInstancia(); %>

<!DOCTYPE html>
<html lang="es">
	<head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<title>BDOO Jesus Machado</title>  
    	<link rel="stylesheet" href="source/css/bootstrap.min.css">		
		<script src="source/js/jquery.min.js"></script>
		<script src="source/js/bootstrap.min.js"></script>	
		<link id="bsdp-css" href="source/css/bootstrap-datepicker3.css" rel="stylesheet">
		 <script src="source/js/bootstrap-datepicker.js"></script>
		 <script src="source/js/bootstrap-datepicker.es.min.js" charset="UTF-8"></script>
  	</head>
  	<body>
    	<div class="container">
      		<div class="header clearfix">
        		<nav class="navbar navbar-inverse navbar-fixed-top">
      				<div class="container">
        				<div class="navbar-header">
          					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            					<span class="sr-only">Toggle navigation</span>
            					<span class="icon-bar"></span>
            					<span class="icon-bar"></span>
            					<span class="icon-bar"></span>
          					</button>
          					<a class="navbar-brand" href="index.jsp">Casa de Playas</a>
        				</div>
        				<div id="navbar" class="navbar-collapse collapse">
        					<ul class="nav navbar-nav">
        						<li>
        							<a href="registrarse.jsp">
        								Registrarse        								
        							</a>
        						</li>
        						<%if(session.getAttribute("session") == null ){%>      						
        						<li>
        						    <a href="registrarpago.jsp">Procesar Pago</a>
        						</li>
        						<%} %>
        						
        					</ul>
                   <%  boolean estado = false;	
                    		if(session.getAttribute("session") != null ){                     			
                    			String Usuario =  (String) session.getAttribute("session");
                    			estado = true;
                    		%>
                    		<ul class=" navbar-right">
        	        			<li style="color: #DDD; margin-top:5px; list-style-type: none;">
        							<div style="display: inline-block; font-weight: bold; margin-top: 10px;">
        							<%= Usuario %>
        							</div>
        							<div style="display: inline-block; margin-top: 5px; margin-left: 10px;">
        								<form method="post" action="DestruirSession">
        									<button type="submit" class="btn btn-sm btn-warning" name="cerrarSession" value="cerrarSession">
        										Cerrar Sesión
        									</button>
        								</form>
        							</div>
        							
        						</li>
        					</ul>
        				</div><!--/.navbar-collapse -->
      				</div>
    			</nav>
        	
      	</div>	
      	<div class="clearfix"></div>
      	<br>
      	<br>
      	<div class="container">
      	<div class="row">
      		<div class="col-lg-3">
      			<h2 class="text-center">Registrar Casas de Playa</h2>
      			<form method="post" action="RegistrarCasaPlaya" >
            		<div class="form-group">
              			<input type="text" placeholder="codigo" class="form-control" name ="codigo" required>
            		</div>	
            		<div class="form-group">
              			<input type="text" placeholder="poblacion" class="form-control" name= "poblacion" required>
            		</div>
            		<div class="form-group">
              			<input type="number" placeholder="Numeros de Baños" class="form-control" name= "nbanos" required>
            		</div>
            		<div class="form-group">
              			<input type="number" placeholder="Numeros de Cocinas" class="form-control" name= "ncocinas" required>
            		</div>
            		<div class="form-group">
              			<input type="number" placeholder="Numeros de Comedores" class="form-control" name= "ncomedores" required>
            		</div>
            		<div class="form-group">
              			<input type="number" placeholder="Numeros de Estacionamientos" class="form-control" name= "nestacionamientos" required>
            		</div>
            		<div class="form-group">
              			<input type="number" placeholder="Numeros de Habitaciones" class="form-control" name= "nhabitaciones" required>
            		</div>
            		<div class="form-group" style="display: none">
              			<input type="text"  class="form-control" name= "usuario" value="<%= Usuario%>" required>
            		</div>
            		<button type="submit" class="btn btn-success" name="registrarcasaplaya"  value="registrarcasaplaya">Guardar</button>
          		</form>
      			
      		</div>
      		<div class="col-lg-9">
      			<h2 class="text-center">Casas de Playa Registradas</h2> 
      			<table class="table table-hover">
      				<thead>
      					<th>Codigo</th>
      					<th>EstadoActual</th>
      					<th>#-Banos</th>
      					<th>#-Cocinas</th>
      					<th>#-Comedores</th>
      					<th>#-Estacionamientos</th>
      					<th>#-Habitaciones</th>
      					<th>#-Poblacion</th>
      					<th>#-Propietario</th>
      				</thead>
      				<%
      					try{
      					
      					ObjectSet<Propietario> resultPropietario = db.queryByExample(new Propietario(null,null,null,null,null,Usuario,null,null));
      					Propietario x = null;
      					boolean flagsPropietario = false;
      					while(resultPropietario.hasNext()){
      						x = resultPropietario.next();
      						if(x.getLogin().equals(Usuario)){
      							flagsPropietario = true;
      							break;
      						}				
      					}
      					if(!flagsPropietario){
      						x = null;
      					}
      					
      					ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(null,null,null,null,null,null,null,true,null,x));
      					
      					CasaPlaya t = null;
      				%>
      				<tbody>
      				<%while(resultCasaPlaya.hasNext()){ 
      					t = resultCasaPlaya.next();
      				%>
      					<tr>
      						<td><%= t.getCodigo() %></td>
      						<td><%= t.isEstadoactual() %></td>
      						<td><%= t.getNbanos() %></td>
      						<td><%= t.getNcocinas() %></td>
      						<td><%= t.getNcomedores() %></td>
      						<td><%= t.getNestacionamientos() %></td>
      						<td><%= t.getNhabitaciones() %></td>
      						<td><%= t.getPoblacion()  %></td>
      						<td><%= t.getPropietario().getNombre() %></td>
      					</tr>
      				<%
      					}
      					
      				}catch(Exception e){
      					%><%="Error" %><%
      				}
      				%>
      				</tbody>
  				</table>
      		</div>     	
      	</div>
      	<br>
      	
      	<div class="row">
      		<div class="col-lg-3">
      			<h2 class="text-center">Registrar Paquete Casa de Playa</h2>
      			<form method="post" action="RegistrarPaqueteCasaPlaya" >
            		<div class="form-group">
              			<input type="text" placeholder="Codigo de la Casa" class="form-control" name ="codigocasa" required>
            		</div>	
            		<div class="form-group">
              			<input type="text" placeholder="Codigo del Paquete" class="form-control" name= "codigopaquete" required>
            		</div>
            		<div class="form-group">
              			<input type="text" placeholder="Fecha Inicial" class="form-control" name= "finicial" required>
            		</div>
            		<div class="form-group">
              			<input type="text" placeholder="Fecha Final" class="form-control" name= "ffinal" required>
            		</div>
            		
            		<div class="form-group">
              			<input type="text" placeholder="Precio" class="form-control" name= "precio" required>
            		</div>            		
            		<div class="form-group" style="display: none">
              			<input type="text"  class="form-control" name= "usuario" value="<%= Usuario%>" required>
            		</div>
            		
            		<button type="submit" class="btn btn-success" name="registrarpaquetecasaplaya"  value="registrarcasaplaya">Guardar</button>
          		</form>
      		</div>
      		<div class="col-9">
      			<div class="col-lg-9">
      			<h2 class="text-center">Paquete de las Casas de Playa</h2> 
      			<table class="table table-hover">
      				<thead>
      					<th>Codigo Casa</th>
      					<th>Codigo Paquete</th>
      					<th>Fecha Inicial</th>
      					<th>Fecha Final</th>
      					<th>Precio</th>
      				
      					<th>#-Propietario</th>
      				</thead>
      				<%
      					try{
      					
      					ObjectSet<Propietario> resultPropietario = db.queryByExample(new Propietario(null,null,null,null,null,Usuario,null,null));
      					Propietario x = null;
      					boolean flagsPropietario = false;
      					while(resultPropietario.hasNext()){
      						x = resultPropietario.next();
      						if(x.getLogin().equals(Usuario)){
      							flagsPropietario = true;
      							break;
      						}				
      					}
      					if(!flagsPropietario){
      						x = null;
      					}
      					
      					ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(null,null,null,null,null,null,null,true,null,x));
      					
      					CasaPlaya t = null;
      					Paquete p = null;
      					
      				%>
      				<%SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); %>
      				<tbody>
      				<%while(resultCasaPlaya.hasNext()){ 
      					t = resultCasaPlaya.next();
      					ObjectSet<Paquete>   resultPaquete   = db.queryByExample(new Paquete(null,null,null, null, null,null, null, t));
      					while(resultPaquete.hasNext()){
      						p = resultPaquete.next();
      				%>
      					<tr>
      						<td><%= t.getCodigo() %></td>
      						<td><%= p.getCodigo() %></td>
      						<td><%= formatter.format(p.getFechainicio()) %></td>
      						<td><%= formatter.format(p.getFechafinal()) %></td>
      						<td><%= p.getPrecio() %></td>      						
      						<td><%= t.getPropietario().getNombre() %></td>
      					</tr>
      				<%
      				}
      					}
      					
      				}catch(Exception e){
      					%><%="Error" %><%
      				}
      				%>
      				</tbody>
  				</table>
      		</div>
      		</div>
      	</div>
      	
      	<div class="row">
      		<div class="col-lg-4">
      			<h4>Casas de Playas Reservadas</h4>
      			<table class="table table-hover">
      				<thead>
      					<th>C.Casa</th>
      					
      					<th>F.Inicial</th>
      					<th>F.Final</th>
      					<th>Precio</th>
      					
      					<th>C.Cliente</th>
      					<th>N.Cliente</th>
      				</thead>
      				<% 
      					ObjectSet<Propietario> resultPropietario = db.queryByExample(new Propietario(null,null,null,null,null,Usuario,null,null));
  						Propietario x = null;
  						boolean flagsPropietario = false;
  						while(resultPropietario.hasNext()){
  							x = resultPropietario.next();
  							if(x.getLogin().equals(Usuario)){
  								flagsPropietario = true;
  								break;
  							}				
  						}
  						ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(null,null,null,null,null,null,null,true,null,x));
  					  	CasaPlaya t = null;
  						Paquete p = null;      				
      				%>
      				<%SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); %>
      				<tbody>
      				<%while(resultCasaPlaya.hasNext()){ 
      					t = resultCasaPlaya.next();
      					ObjectSet<Paquete>   resultPaquete   = db.queryByExample(new Paquete(null,null,null, null, 2,null, null, t));
      					while(resultPaquete.hasNext()){
      						p = resultPaquete.next();
      				%>
      					<tr>
      						<td><%= t.getCodigo() %></td>
      						
      						<td><%= formatter.format(p.getFechainicio()) %></td>
      						<td><%= formatter.format(p.getFechafinal()) %></td>
      						<td><%= p.getPrecio() %></td>      		
      						
      						<td><%= p.getCliente().getCedula() %></td>
      						<td><%= p.getCliente().getNombre() %></td>			
      						
      					</tr>
      					<%}
      					} %>
      					
      				</tbody>
      			</table>
      		</div>
      		<div class="col-lg-offset-1 col-lg-7">
      			<h4>Casas de Playas Pagadas</h4>
      			<table class="table table-hover">
      				<thead>
      					<th>C.Casa</th>
      				
      					<th>F.Inicial</th>
      					<th>F. Final</th>
      					<th>Precio</th>
      					
      					<th>C.Cliente</th>
      					<th>N.Cliente</th>
      					<th>N.Deposito</th>
      					<th>Telefono</th>
      				</thead>
      				<%ObjectSet<CasaPlaya> resultCasaPlaya1 =  db.queryByExample(new CasaPlaya(null,null,null,null,null,null,null,true,null,x));
  					  	CasaPlaya t1 = null;
  						Paquete p1 = null;
      				%>
      				<tbody>
      				<%while(resultCasaPlaya1.hasNext()){ 
      					t1 = resultCasaPlaya1.next();
      					ObjectSet<Paquete>   resultPaquete   = db.queryByExample(new Paquete(null,null,null, null, 3,null, null, t1));
      					while(resultPaquete.hasNext()){
      						p1 = resultPaquete.next();
      				%>
      					<tr>
      						<td><%= t1.getCodigo() %></td>
      					
      						<td><%= formatter.format(p1.getFechainicio()) %></td>
      						<td><%= formatter.format(p1.getFechafinal()) %></td>
      						<td><%= p1.getPrecio() %></td>     		
      						
      						<td><%= p1.getCliente().getCedula() %></td>
      						<td><%= p1.getCliente().getNombre() %></td>			
      						<td><%= p1.getCliente().getNdeposito() %></td>
      						<td><%= p1.getCliente().getTelefono() %></td>
      						
      					</tr>
      					<%}
      					} %>
      					
      				</tbody>
      			</table>
      		</div>
      	
      	</div>
      	
      	
      	</div>
        					<%} else{ %>
        					<!--  
		 					<ul class=" navbar-right">
        	        			<li style="color: #DDD; margin-top:5px; list-style-type: none;">
        							<div style="display: inline-block; font-weight: bold; margin-top: 10px;">
        							</div>
        							<div style="display: inline-block; margin-top: 5px; margin-left: 10px;">
        								<form method="post" action="Dsession">
        									<button type="submit" class="btn btn-sm btn-warning" name="cerrarSession" value="cerrarSession">
        										Cerrar Sesión
        									</button>
        								</form>
        							</div>
        						</li>
        					</ul>   
        					-->	
        					
          					<form class="navbar-form navbar-right" method="post" action="Login" >
            					<div class="form-group">
              						<input type="text" placeholder="Login" class="form-control" name ="login">
            					</div>	
            					<div class="form-group">
              						<input type="password" placeholder="Clave" class="form-control" name= "password">
            					</div>
            					<button type="submit" class="btn btn-success" name="loginuser"  value="loginuser">Loguearse</button>
          					</form>
          				</div><!--/.navbar-collapse -->
      				</div>
    			</nav>       	
      	</div>
      	<br>
      	<br>
      	<br>
      	<br>
      	<div class="clearfix"></div>
      	<div class="container">
      	<div class="row">
      		<div class="col-lg-12">
      			<form class="form-inline" action="PasarIndex" method="post">
  					<div class="form-group">
    					<label for="exampleInputName2">Poblacion</label>
    					<%
      					try{
      					   	ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(null,null,null,null,null,null,null,true,null,null));
      					    CasaPlaya t = null;
      					%>
    					<select class="form-control" name="bpoblacion">
    						<option></option>
	    					<%while(resultCasaPlaya.hasNext()){ 
	      						t = resultCasaPlaya.next();
	      					%>
	  							<option><%= t.getPoblacion() %></option>
	  							
	  						<%
      						}      					
      					}catch(Exception e){
      					%><%="Error" %><%
      					}
      				%>
						</select>
  					</div>
  					<div class="form-group">
    					<label for="exampleInputEmail2">Codigo</label>
    					<input type="text" class="form-control" id="exampleInputEmail2" placeholder="" name="codigo">
  					</div>
  					<button type="submit" class="btn btn-default">Buscar</button>
				</form>
      		</div>
      	</div>
      		<div class="row">
      			<div class="col-lg-12">
      				 
      				<table class="table table-hover">
      					<thead>
      						<th>Codigo</th>
      						<th>#-Banos</th>
      						<th>#-Cocinas</th>
      						<th>#-Comedores</th>
      						<th>#-Estacionamientos</th>
      						<th>#-Habitaciones</th>
      						<th>#-Poblacion</th>
      						<th>#-Propietario</th>
      						<th> Opcion </th>
      					</thead>
      					<%
      						try{
      						
      						ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(null,null,null,null,null,null,null,true,null,null));
      					     	CasaPlaya t = null;
      					%>
      				<tbody>
      				<%while(resultCasaPlaya.hasNext()){ 
      					t = resultCasaPlaya.next();
      				%>
      				<%if(t.isEstadoactual()){%>
      				<form method="post" action="VerPaquete">
      					<tr>
      						
      						<input type="hidden" name="codigocasa" value = "<%=t.getCodigo() %>">
      						<td><%= t.getCodigo() %></td>
      						<input type="hidden" name="nbanos" value = "<%=t.getNbanos() %>">
      						<td><%= t.getNbanos() %></td>
      						<input type="hidden" name="ncocinas" value = "<%=t.getNcocinas() %>">
      						<td><%= t.getNcocinas() %></td>
      						<input type="hidden" name="ncomedores" value = "<%=t.getNcomedores() %>">
      						<td><%= t.getNcomedores() %></td>
      						<input type="hidden" name="nestacionamientos" value = "<%=t.getNestacionamientos() %>">
      						<td><%= t.getNestacionamientos() %></td>
      						<input type="hidden" name="nhabitaciones" value = "<%=t.getNhabitaciones() %>">
      						<td><%= t.getNhabitaciones() %></td>
      						<input type="hidden" name="poblacion" value = "<%=t.getPoblacion() %>">
      						<td><%= t.getPoblacion()  %></td>
      						<input type="hidden" name="propietario" value = "<%=t.getPropietario().getNombre() %>">
      						<td><%= t.getPropietario().getNombre() %></td>
      						<td><button type="submit" class="btn btn-info">Ver Paquetes</button></td>
      					</tr>
      				</form>
      				<%} %>
      				<%
      					}
      					
      				}catch(Exception e){
      					%><%="Error" %><%
      				}
      				%>
      				</tbody>
  				</table>
      		</div>	
      		</div>
          </div>
    		<%} %>
    </div> <!-- /container -->
    
</html>

