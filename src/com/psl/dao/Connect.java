package com.psl.dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class Connect 
{
	public Connection getCon()
	{
		Connection con =null;
		try{
			
				Class.forName("com.mysql.jdbc.Driver"); 
				con	= DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","Shubham@25");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}
