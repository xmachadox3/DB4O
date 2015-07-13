<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.conexion.BDOO"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.clases.CasaPlaya"%>
<%@page import="com.clases.Propietario"%>
<%@page import="com.clases.Paquete"%>
<% ObjectContainer db = BDOO.obtenerInstancia(); %>
<!DOCTYPE html>
<html lang="es">
	<head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<title>BDOO Jesus Machado</title>  
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>	
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
                   <%boolean estado = false;	
                    		if(session.getAttribute("session") != null ){                     			
                    			String Usuario = (String) session.getAttribute("session");
                    			estado = true;
;                    		%>
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
          					
                  
    		<%} %>
    			</div><!--/.navbar-collapse -->
      				</div>
    			</nav>
        		
      	</div>
      		<div class="container">
     <br><br><br>
      	<div class="row">
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
      						    String codigo 		= (String) request.getAttribute("codigo"); 
      						  	String poblacion 	= (String) request.getAttribute("Poblacion"); 
      					       
     							ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(codigo,poblacion,null,null,null,null,null,true,null,null));
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
      	

     

   

    </div> <!-- /container -->
</html>