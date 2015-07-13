package com.registrar;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clases.CasaPlaya;
import com.clases.Propietario;
import com.conexion.BDOO;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

/**
 * Servlet implementation class RegistrarCasaPlaya
 */
public class RegistrarCasaPlaya extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ObjectContainer db = BDOO.obtenerInstancia();
   
    public RegistrarCasaPlaya() {
        super();      
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 
			
			String 	codigo 		= request.getParameter("codigo");
			String 	poblacion 	= request.getParameter("poblacion");
			Integer nbanos		= Integer.parseInt(request.getParameter("nbanos"));
			Integer ncocinas	= Integer.parseInt(request.getParameter("ncocinas"));
			Integer ncomedores	= Integer.parseInt(request.getParameter("ncomedores"));
			Integer nestacionamientos = Integer.parseInt(request.getParameter("nestacionamientos"));
			Integer	nhabitaciones	= Integer.parseInt(request.getParameter("nhabitaciones"));
			String  login = request.getParameter("usuario");
			System.out.println(login);
			ObjectSet<Propietario> resultPropietario = db.queryByExample(new Propietario(null,null,null,null,null,login,null,null));
			Propietario x = null;
			boolean flagsPropietario = false;
			while(resultPropietario.hasNext()){
				x = resultPropietario.next();
				if(x.getLogin().equals(login)){
					flagsPropietario = true;
					break;
				}				
			}
			if(!flagsPropietario){
				x = null;
			}
			CasaPlaya casaplaya = new CasaPlaya(codigo,poblacion,nhabitaciones,nbanos,ncocinas,ncomedores,nestacionamientos,true,null,x);
			ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(codigo,null,null,null,null,null,null,true,null,null));
			boolean aceptado = true;
			while(resultCasaPlaya.hasNext()){
				if(resultCasaPlaya.next().getCodigo().equals(codigo)){
					aceptado = false;
					break;
				}
			}
			if(aceptado){				
				
				
				db.store(casaplaya);					
				response.sendRedirect("index.jsp");
			}
			else{
				String mensaje = "Ha ocurrido un error, el codigo: " + codigo + " ya existe";
				request.setAttribute("mensaje", mensaje);				
				request.getRequestDispatcher("mensaje.jsp").forward(request, response);
			}
			
			
	}

}