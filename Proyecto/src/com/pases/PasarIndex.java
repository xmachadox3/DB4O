package com.pases;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PasarIndex
 */
@WebServlet("/PasarIndex")
public class PasarIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasarIndex() {
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
		String Poblacion = request.getParameter("bpoblacion");
		String codigo    = request.getParameter("codigo");
		if(Poblacion.equals("")){
			Poblacion = null;
		}
		if(codigo.equals("")){
			codigo = null;
		}
		if(Poblacion == null && codigo == null){
			String mensaje = "Ha ocurrido un error, no se selecciono ninguna opcion";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}else{
			request.setAttribute("Poblacion", Poblacion);
			request.setAttribute("codigo", codigo);
			request.getRequestDispatcher("ver1.jsp").forward(request, response);
		}
		
	}

}
