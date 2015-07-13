<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        		<h3 class="text-muted">Alquiler de Casas</h3>
      	</div>
       
      <%String codigocasa 	= (String) request.getAttribute("codigocasa"); %>
      <%String finicial 		= (String) request.getAttribute("finicial"); %>
      <%String ffinal 		= (String) request.getAttribute("ffinal"); %>
      
      <!-- Nueva parte -->
      <div class="row">
     	<div class="col-lg-12">
     	<h4 class="text-center">Parametros de Busqueda</h4> 
     	<form class="form-inline text-center" action="VerPaquete" method="post">
  					<div class="form-group">
    					<label for="exampleInputEmail2">Codigo</label>
    					<input type="text" class="form-control" id="exampleInputEmail2" placeholder="" name="codigocasa" value="<%= request.getParameter("codigocasa")%>">
  					</div>
  					<div class="form-group">
    					<label for="exampleInputEmail2">Dia de Entrada</label>
    					<input type="text" class="form-control" id="exampleInputEmail2" placeholder="" name="finicial">
  					</div>
  					<div class="form-group">
    					<label for="exampleInputEmail2">Dia de Salida</label>
    					<input type="text" class="form-control" id="exampleInputEmail2" placeholder="" name="ffinal">
  					</div>
  					<button type="submit" class="btn btn-default">Buscar</button>
				</form>
			</div>
			<div class="row">
			<div class="col-lg-8">
      		<h4 class="text-center">Paquete de las Casas de Playa</h4> 
      		
      			<table class="table table-hover">
      				<thead>
      					<th>Codigo Casa</th>
      					<th>Codigo Paquete</th>
      					<th>Fecha Inicial</th>
      					<th>Fecha Final</th>
      					<th>Precio</th>      				
      					<th>#-Propietario</th>
      					<th>#-Cuenta</th>
      					<th> Reservar </th>
      				</thead>
      				<%
      					try{
      						ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(codigocasa,null,null,null,null,null,null,true,null,null));
      					    CasaPlaya t = null;
      						Paquete p = null;
   					%>
      				<%SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); %>
      				<tbody>
      				<%while(resultCasaPlaya.hasNext()){ 
      					t = resultCasaPlaya.next();
      					ObjectSet<Paquete>   resultPaquete   = db.queryByExample(new Paquete(null,null,null, null, 1,null, null, t));
      					if (!resultPaquete.hasNext()){ %>
  						<script> alert("No hay paquetes disponibles en este momento, para esta casa ")</script>
  					<%} 
      					while(resultPaquete.hasNext()){
      						p = resultPaquete.next();
      						%>
      							<form action="RegistrarReserva" method="post">
      								<input type="hidden" name="codigocasa"    value="<%= t.getCodigo() %>">
      								<input type="hidden" name="codigopaquete" value="<%= p.getCodigo() %>">
      								
      								
      							
      						<% 
      						if((finicial == null) && (ffinal == null)){
      				%>
      					<tr>
      						<td><%= t.getCodigo() %></td>
      						<td><%= p.getCodigo() %></td>
      						<td><%= formatter.format(p.getFechainicio()) %></td>
      						<td><%= formatter.format(p.getFechafinal()) %></td>
      						<td><%= p.getPrecio() %></td>      						
      						<td><%= t.getPropietario().getNombre() %></td>
      						<td><%= t.getPropietario().getNcuenta() %>
      						<td><button type="submit" class="btn btn-info">Reservar</button><td>
      					</tr>
      				<%
      						}
      						else if((finicial != null) && (ffinal != null)){ 
      							if(formatter.format(p.getFechainicio()).equals(finicial) && formatter.format(p.getFechafinal()).equals(ffinal)){
      						%>
      							
      							<tr>
      								<td><%= t.getCodigo() %></td>
      								<td><%= p.getCodigo() %></td>
      								<td><%= formatter.format(p.getFechainicio()) %></td>
      								<td><%= formatter.format(p.getFechafinal()) %></td>
      								<td><%= p.getPrecio() %></td>      						
      								<td><%= t.getPropietario().getNombre() %></td>
      								<td><%= t.getPropietario().getNcuenta() %>
      								<td><button type="submit" class="btn btn-info">Reservar</button><td>
      							</tr>
      						<%}
      						}
      						
      				}
      					}
      					
      				}catch(Exception e){
      					%><%="Error" %><%
      				}
      				%>
      				
      				</tbody>
  				</table>
      		</div>
      	
      		
      			<div class="col-lg-4">
        	<h4 class="text-center">Rellene estos datos para reservar</h4>
        	
        		<div class="form-group">
    				<label>Cedula</label>
    				<input type="text" class="form-control" placeholder="Cedula" name="cedula" required>
  				</div>
  				<div class="form-group">
    				<label>Nombre</label>
    				<input type="text" class="form-control" placeholder="Nombre" name="nombre" required>
  				</div>
  				<div class="form-group">
    				<label>Apellido</label>
    				<input type="text" class="form-control" placeholder="Apellido" name="apellido" required>
  				</div>
  				<div class="form-group">
    				<label>Login del Usuario</label>
    				<input type="text" class="form-control" placeholder="Login" name="login" required>
  				</div>
  				<div class="form-group">
    				<label>Clave del Usuario</label>
    				<input type="password" class="form-control" placeholder="Clave" name="clave" required>
  				</div>
  				
  				
			</form>
      		</div>
      		</form>
      	</div>
       


     

   

    </div> <!-- /container -->
</html>


