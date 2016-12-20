package com.psl.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.psl.bean.Patient;
import com.psl.bean.WrongFormatException;
import com.psl.servlets.ConnectionManager;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection conn = null;
	static ResultSet rSet = null;
	static PreparedStatement preparedStatement = null;
	Patient patient = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Upload() {
		super();

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		InputStream inputStream, inputStream2 = null;
		String query = "insert into patient values(?, ?, ?, ?, ?)";
		try {
			conn = ConnectionManager.getConnection();
			preparedStatement = conn.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Part filePart = request.getPart("input7[]");
		System.out.println(filePart.getName());
		System.out.println(filePart.getSize());
		inputStream = filePart.getInputStream();
		inputStream2 = filePart.getInputStream();
		// inputStream.mark(0);

		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
		BufferedReader reader1 = new BufferedReader(new InputStreamReader(inputStream2));
		try {
			Class<?> clazz = Class.forName("com.psl.dao.PatientDAO");
			Object obj = clazz.newInstance();
			Method method = clazz.getMethod("uploadData", reader.getClass());
			method.invoke(obj, reader);

		}
		
		catch (ClassNotFoundException | InstantiationException | IllegalAccessException | NoSuchMethodException
				| SecurityException | IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} /*
			 * StringBuilder out = new StringBuilder(); String line; while
			 * ((line = reader.readLine()) != null) { String data[] =
			 * line.split(","); for(int j=0;j<data.length;j++){
			 * 
			 * try { preparedStatement.setString(j+1, data[j]); } catch
			 * (SQLException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); }
			 * 
			 * 
			 * } System.out.println(preparedStatement.toString());
			 * 
			 * }
			 */
		// reader = new BufferedReader(new InputStreamReader(inputStream));

		// System.out.println(out.toString());
		// reader = new BufferedReader(new InputStreamReader(inputStream));
		// reader.reset();
		// inputStream.reset();
		request.setAttribute("Reader", reader1);
		System.out.println(reader.toString());
		// System.out.println("Reaching here");
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/uploadSuccess.jsp");
		requestDispatcher.forward(request, response);
		doGet(request, response);
	}

}
