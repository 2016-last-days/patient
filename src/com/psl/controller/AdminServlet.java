package com.psl.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.dao.UserEntry;
import com.psl.model.Message;
import com.psl.model.UserBean;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		UserEntry ue = new UserEntry();
		String str=request.getParameter("page");
//		request.getSession().setAttribute("name", null);
		int i;
		if(str==null)
			i=1;
		else
			i=Integer.parseInt(str);
		ArrayList<UserBean> arrayList= ue.UserDisplay(i);
		int totalUser=ue.getCount();
		int pg=(int) Math.ceil(totalUser/5.0);
		request.setAttribute("totalUser", new Integer(totalUser));
		request.setAttribute("pages", new Integer(pg));
		request.setAttribute("UserList", arrayList);
		if(request.getMethod().equals("POST"))
			request.setAttribute("name", new Message("successfully updated", true));
		
  	  request.getRequestDispatcher("DisplayUser.jsp").forward(request, response);
	}

}
