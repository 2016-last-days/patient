package com.psl.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection connection;
	static String url;
	
	public static Connection getConnection() {
		try{
			url="jdbc:mysql://localhost:3306/user";
			Class.forName("com.mysql.jdbc.Driver");
			try{
				connection = DriverManager.getConnection(url, "root", "Shubham@25");
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return connection;
		
	}
}
