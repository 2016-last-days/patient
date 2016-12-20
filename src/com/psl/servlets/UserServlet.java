package com.psl.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.bean.User;
import com.psl.dao.Connect;
import com.psl.dao.Message;
import com.psl.dao.UserEntry;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserEntry ue = new UserEntry();
		String str=request.getParameter("page");
//		request.getSession().setAttribute("name", null);
		int i;
		if(str==null)
			i=1;
		else
			i=Integer.parseInt(str);
		ArrayList<User> arrayList= ue.UserDisplay(i);
		int totalUser=ue.getCount();
		int pg=(int) Math.ceil(totalUser/5.0);
		request.setAttribute("totalUser", new Integer(totalUser));
		request.setAttribute("pages", new Integer(pg));
		request.setAttribute("UserList", arrayList);
		if(request.getMethod().equals("POST"))
			request.setAttribute("name", new Message("successfully updated", true));
	      
  	  request.getRequestDispatcher("DisplayUser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
