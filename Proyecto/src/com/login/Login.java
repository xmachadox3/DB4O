package com.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conexion.BDOO;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.clases.Propietario;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ObjectContainer db = BDOO.obtenerInstancia();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
					
		String login 	= request.getParameter("login");
		String password = request.getParameter("password");
		ObjectSet<Propietario> resultPropietario = db.queryByExample(new Propietario(null,null,null,null,password,login,null,null));
		Propietario propietario = null;
		boolean flagPropietario = false;
		while(resultPropietario.hasNext()){
			propietario = resultPropietario.next();
			if(propietario.getLogin().equals(login) && propietario.getClave().equals(password)){
				flagPropietario = true;
			}
		}
		if(flagPropietario){	
			HttpSession misession;
			misession = request.getSession(true);				
			misession.setAttribute("session",propietario.getLogin());
			response.sendRedirect("index.jsp");
		}
		else{
			String mensaje = "Ha ocurrido un error, no se pudo iniciar la sesion";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}
				
		
	}

}