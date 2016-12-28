package com.psl.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.dao.UserDAO;
import com.psl.model.Message;
import com.psl.model.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{	    
		     UserBean user = new UserBean();
		     user.setEmail(request.getParameter("email"));
		     user.setPassword(request.getParameter("password"));
		    // PrintWriter out = response.getWriter();
		     user = UserDAO.login(user);
		     HttpSession session=request.getSession(false); 
		     //if(session!=null)
		    // {
		     if (user.isValid())
		     {
		    		    
		      
		          request.setAttribute("Uname", user.getFirstName());
		          System.out.println();
		          if(user.getRole().equals("Admin"))
		          {		          
		          //response.sendRedirect("admin"); //logged-in page
		        	  request.setAttribute("name", new Message("successfully logged in", true));
		        	  session.setAttribute("User", user.getFirstName());
			    	  request.getRequestDispatcher("admin").include(request, response);
			      }
			      else
			      {
			    	  request.setAttribute("name", new Message("successfully logged in", true));
			    	  session.setAttribute("User", user.getFirstName());
			    	  request.getRequestDispatcher("clerk.jsp").include(request, response);
			      }
		     }
			        
		     else {
		    	 	
		          
		          response.sendRedirect("index.html");
		     }
		     
		    /* else{
		    	 out.print("Please login first");  
		            request.getRequestDispatcher("index.html").include(request, response); 
		     }*/
		} 
				
				
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
		    
			

	}
	

}
