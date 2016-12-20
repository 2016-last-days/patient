package com.psl.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.bean.UserBean;
import com.psl.dao.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
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
		    // HttpSession session=request.getSession(false); 
		     //if(session!=null)
		    // {
		     if (user.isValid())
		     {
		    	  HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",user); 
		          System.out.println();
			     if(user.getRole().equals("Admin"))
			    {		          
		          response.sendRedirect("UserServlet"); //logged-in page
			      }
			      else
			    	  response.sendRedirect("clerk.html");
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
