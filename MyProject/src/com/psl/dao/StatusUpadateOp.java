package com.psl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.psl.bean.User;

public class StatusUpadateOp 
{

	public Message Updation (String[] arr)
	{
		Connect conObj = new Connect();
		Connection con = conObj.getCon();
		try {
			Statement st = con.createStatement();
			
			//ResultSet rs = st.executeQuery("select id from userlogin");
			for(String str: arr)
			{
				String a[]=str.split(" ");
				System.out.println(a[0]+" "+a[1]);
				String query = "update userlogin set Status = ? where id = ?";
				PreparedStatement preparedStmt = con.prepareStatement(query);
				preparedStmt.setString(1, a[1]);
				preparedStmt.setInt(2, Integer.parseInt(a[0]));
				System.out.println(preparedStmt);
				preparedStmt.executeUpdate();
			}
		}catch (Exception e) {
			e.printStackTrace();
			return new Message("exception", false);
		}
		return new Message("successfully registered", true);

		}
	}
