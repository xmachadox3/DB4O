package com.registrar;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clases.CasaPlaya;

import com.clases.Paquete;

import com.conexion.BDOO;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;






public class RegistrarPaqueteCasaPlaya extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ObjectContainer db = BDOO.obtenerInstancia();
 
    public RegistrarPaqueteCasaPlaya() {
        super();        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		
		String codigocasa 		= request.getParameter("codigocasa");
		String codigopaquete 	= request.getParameter("codigopaquete"); 
		Float  precio 			= Float.parseFloat(request.getParameter("precio"));
  		
  		Date fechainicial = null;
  		Date fechafinal = null;
  		try {  			
  			fechainicial = formatter.parse(request.getParameter("finicial"));
  			System.out.println(fechainicial);
  			System.out.println(formatter.format(fechainicial));
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
  		try {
  			fechafinal = formatter.parse(request.getParameter("ffinal"));
  			System.out.println(fechafinal );
  			System.out.println(formatter.format(fechafinal ));
			
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
  		System.out.println(fechainicial + " - " + fechafinal);
  		
  		ObjectSet<CasaPlaya> resultCasaPlaya =  db.queryByExample(new CasaPlaya(codigocasa,null,null,null,null,null,null,true,null,null));
  		
  		
  		CasaPlaya casaplaya = null;
  		casaplaya = resultCasaPlaya.next();
  		Paquete paquete = new Paquete(codigopaquete,fechainicial,fechafinal, precio, 1,null, null, casaplaya);
		
  		
  		
  		db.store(paquete);
  		response.sendRedirect("index.jsp");
		
		
		
		
		
		
		
	}

}
