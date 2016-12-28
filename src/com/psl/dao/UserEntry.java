package com.psl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.psl.model.Message;
import com.psl.model.UserBean;

public class UserEntry {
	Connection connection = ConnectionManager.getConnection();
	public Message createUser(String firstName, String lastName, String email, String facility, String role,
			String status) {
		Connection connection = ConnectionManager.getConnection();
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("select Firstname from userlogin where Email='" + email + "'");
			if (rs.next()) {
				return new Message("email is already taken", false);
			}
			String sql = "insert into userlogin(Firstname,Lastname,Email,Password, Facility, Role,Status, Deleted) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, firstName);
			pst.setString(2, lastName);
			pst.setString(3, email);
			pst.setString(4, firstName + "_" + lastName);
			pst.setString(5, facility);
			pst.setString(6, role);
			pst.setString(7, status);
			pst.setInt(8, 0);
			pst.executeUpdate();
			pst.close();
			return new Message("successfully registered", true);
		} catch (SQLException e) {
			e.printStackTrace();
			return new Message("exception", false);
		}
	}
	public ArrayList<UserBean> UserDisplay(int page) {
		return UserDisplay(page, 5);
	}
	public ArrayList<UserBean> UserDisplay() {
		return UserDisplay(1, 5);
	}
	public ArrayList<UserBean> UserDisplay(int page, int limit) {
		UserBean user = null;
		ArrayList<UserBean> a = new ArrayList<UserBean>();
		try {
			Statement st = connection.createStatement();
			String str="select * from userlogin limit "+(page-1)*limit+", "+limit;
			ResultSet rs = st.executeQuery(str);
		
			while (rs.next()) {
				user = new UserBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6),
						rs.getString(7), rs.getString(8), rs.getBoolean(9));
				a.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
	public int getCount()
	{
		int count=0;
		try {
		
		Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery("select count(*) from userlogin");
		if(rs.next())
		{
			count=rs.getInt(1);
			return count;
		}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
