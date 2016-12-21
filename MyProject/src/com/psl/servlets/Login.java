package com.psl.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.dao.Message;
import com.psl.dao.UserEntry;
import com.psl.dao.Verification;

//@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	      PrintWriter out = response.getWriter();
	      String firstName=request.getParameter("firstName");
	      String lastName =request.getParameter("lastName");
	      String email=request.getParameter("email");
	      String facility=request.getParameter("FacilityName");
	      String role = request.getParameter("role");
	      System.out.println(role);
	      String status=request.getParameter("activation");
	      
	      UserEntry ue=new UserEntry();
	      Message message=ue.createUser(firstName, lastName, email, facility, role,status);
	      if(message.isSuccessful())
	      {
	    	  request.setAttribute("name", message);
	    	 request.getRequestDispatcher("/UserServlet").forward(request, response);
//	    	  response.sendRedirect("UserServlet");
	      }
	      else
	    	  response.sendRedirect("Registration.html");
	 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
