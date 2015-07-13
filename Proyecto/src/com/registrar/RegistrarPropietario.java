package com.registrar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clases.CasaPlaya;
import com.clases.Cliente;
import com.clases.Propietario;
import com.conexion.BDOO;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

/**
 * Servlet implementation class RegistrarPropietario
 */
public class RegistrarPropietario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ObjectContainer db = BDOO.obtenerInstancia(); 
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarPropietario() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cedula 	= request.getParameter("cedula");
		String apellido = request.getParameter("apellido");
		String nombre 	= request.getParameter("nombre");
		String login 	= request.getParameter("login");
		String clave 	= request.getParameter("clave");
		String ncuenta 	= request.getParameter("ncuenta");
		String telefono = request.getParameter("telefono");
		
		ArrayList<CasaPlaya> CasaPlaya = new ArrayList<CasaPlaya>();
		Propietario usuario = new Propietario(cedula, nombre,apellido,telefono,clave,login,ncuenta,CasaPlaya);
		
		
		ObjectSet<Propietario> resultPropietario =  db.queryByExample(new Propietario(cedula, null,null,null,null,login,ncuenta,null));
		ObjectSet<Cliente>     resultCliente = db.queryByExample(new Cliente(cedula,null,null,null,clave,login,null,null,null));
		
		boolean aceptado = true;
		while(resultPropietario.hasNext()){
			if(resultPropietario.next().getCedula().equals(cedula) || resultPropietario.next().getLogin().equals(login) || resultPropietario.next().getNcuenta().equals(ncuenta)){
				aceptado = false;
				break;
			}
		}
		while(resultCliente.hasNext()){
			if(resultCliente.next().getCedula().equals(cedula) || resultCliente.next().getLogin().equals(login)){
				aceptado = false;
				break;
			}
		}
		if(aceptado){
			db.store(usuario);
			String mensaje = "Se ha registrado satisfactoriamente";
			request.setAttribute("mensaje", mensaje);
			
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
		else{
			String mensaje = "Ha ocurrido un error, la cedula: " + cedula + " ya existe";
			request.setAttribute("mensaje", mensaje);
			
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
		
	}

}