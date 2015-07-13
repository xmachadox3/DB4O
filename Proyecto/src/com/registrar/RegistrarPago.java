package com.registrar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.clases.Cliente;
import com.clases.Pago;
import com.clases.Paquete;
import com.clases.Reserva;
import com.db4o.ObjectSet;
import com.conexion.BDOO;
import com.db4o.ObjectContainer;


/**
 * Servlet implementation class RegistrarPago
 */
@WebServlet("/RegistrarPago")
public class RegistrarPago extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ObjectContainer db = BDOO.obtenerInstancia();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarPago() {
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
		String codigoreserva = request.getParameter("codigoreserva");
		String loginusuario  = request.getParameter("loginusuario");
		String clave 		 = request.getParameter("clave");
		String ndeposito	 = request.getParameter("ndeposito");
		String telefono		 = request.getParameter("telefono");
		
		boolean aceptado = false;
		
		//Ver si existe la reserva
		ObjectSet<Reserva> resultReserva 	= db.queryByExample(new Reserva(codigoreserva,null,null));
		Reserva reserva = resultReserva.next();
		if(reserva != null){
			
			//Actualizar Paquete		
			ObjectSet<Paquete>	resultPaquete   = db.queryByExample(new Paquete(codigoreserva.substring(0,codigoreserva.length()-1),null,null, null, null,null, null, null));
			Paquete paquete = resultPaquete.next();
			paquete.setEstados(3);
			db.store(paquete);
			System.out.println(codigoreserva.substring(0,codigoreserva.length()-1));
			
			//Actualizar Cliente
			ObjectSet<Cliente>	resultCliente = db.queryByExample(new Cliente(null,null,null,null,clave,loginusuario,null,null,null));
			Cliente cliente = resultCliente.next();
			cliente.setNdeposito(ndeposito);
			cliente.setTelefono(telefono);
			db.store(cliente);
			
			//Registra el pago
			Pago pago = new Pago(cliente,paquete);
			db.store(pago);
			aceptado = true;
			db.delete(reserva);
		}
		
		
		
	
			
		
		if(aceptado){
			String mensaje = "Se registro su pago satisfactoriamente :) ";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
		else{
			String mensaje = "no existe esa reserva";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
		
		
			
			
		
	}

}
