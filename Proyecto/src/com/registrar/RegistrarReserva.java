package com.registrar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clases.Cliente;
import com.clases.Paquete;
import com.clases.Propietario;
import com.clases.Reserva;
import com.db4o.ObjectSet;
import com.conexion.BDOO;
import com.db4o.ObjectContainer;


/**
 * Servlet implementation class RegistrarReserva
 */
@WebServlet("/RegistrarReserva")
public class RegistrarReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ObjectContainer db = BDOO.obtenerInstancia(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarReserva() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigopaquete = request.getParameter("codigopaquete");
		
		ObjectSet<Paquete>   resultPaquete   = db.queryByExample(new Paquete(codigopaquete,null,null, null, 1,null, null, null));
		Paquete paquete  = resultPaquete.next();
		paquete.setEstados(2);
		
		
		String cedula 	= request.getParameter("cedula");
		String apellido = request.getParameter("apellido");
		String nombre 	= request.getParameter("nombre");
		String login 	= request.getParameter("login");
		String clave 	= request.getParameter("clave");
				
		Cliente usuario = new Cliente(cedula, nombre,apellido,null,clave,login,null,paquete,null);
		paquete.setCliente(usuario);
		
		ObjectSet<Propietario> resultPropietario =  db.queryByExample(new Propietario(null, null,null,null,null,login,null,null));
		ObjectSet<Cliente>     resultCliente = db.queryByExample(new Cliente(cedula,null,null,null,null,login,null,null,null));
		
		boolean aceptado = true;
		while(resultPropietario.hasNext()){
			if(resultPropietario.next().getCedula().equals(cedula) || resultPropietario.next().getLogin().equals(login)){
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
			db.store(paquete);
			Reserva reserva = new Reserva(paquete.getCodigo()+"r",usuario,paquete);
			db.store(reserva);
			String mensaje = "Se ha realizado la reserva, su codigo es: <strong> "  + paquete.getCodigo()+"r</strong>";
			request.setAttribute("mensaje", mensaje);			
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
		else{
			String mensaje = "Ha ocurrido un error,  ya existen los datos colocados";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
		
	}

}
