package com.pases;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerPaquete
 */
@WebServlet("/VerPaquete")
public class VerPaquete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerPaquete() {
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
		String codigocasa 	= request.getParameter("codigocasa");	
		String finicial 	= request.getParameter("finicial");
		String ffinal		= request.getParameter("ffinal");
			
		
		request.setAttribute("codigocasa", codigocasa);
		if(finicial != "")
			request.setAttribute("finicial", finicial);
		else
			request.setAttribute("finicial", null);
		if(ffinal != "")
			request.setAttribute("ffinal", ffinal);
		else
			request.setAttribute("ffinal", null);
		
		
		request.getRequestDispatcher("paquete.jsp").forward(request, response);
	}

}
