package com.psl.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Verification
{

	public Boolean validetUser(String user, String pass)
	{
		Connect conObj = new Connect();
		Connection con=conObj.getCon();
		String pw=null;
		try {
			Statement st= con.createStatement();
			String sql= "select password from user where userid='"+user+"'";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next())
			{
		         pw = rs.getString(1);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(pw==pass)
		{
			return true;
		}
		else
			return false;
	}
	
}

