package com.psl.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.psl.model.*;
import com.psl.exception.*;

public class PatientDAO {
	static Connection conn = null;
	static ResultSet rSet = null;
	static PreparedStatement preparedStatement = null;
	boolean wrong=false;
	public void uploadData(BufferedReader reader) throws IOException, SQLException, WrongFormatException {

		String line;
		int i = 0;
		String query = "insert into patient values(?, ?, ?, ?, ?, ?)";
		String rowCount = "select count(*) from patient";
		try {
			
			conn = ConnectionManager.getConnection();
			Statement st = conn.createStatement();
			preparedStatement = conn.prepareStatement(query);
			rSet = st.executeQuery(rowCount);
			while (rSet.next())
				i = rSet.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		while ((line = reader.readLine()) != null) {
			String data[] = line.split(",");
			System.out.println(data.length);
			if(data.length!=5)
				
					throw new WrongFormatException("CSV Format Not VAlid.");
				
			for (int j = 0; j < data.length; j++) {

				try {
					preparedStatement.setString(j + 2, data[j]);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			preparedStatement.setInt(1, ++i);
			preparedStatement.executeUpdate();
			// boolean more = rSet.next();
			System.out.println(preparedStatement.toString());

		}
		return;
	} 
	
	public ArrayList<Patient> UserDisplay(int page) {
		return UserDisplay(page, 5);
	}
	public ArrayList<Patient> UserDisplay() {
		return UserDisplay(1, 5);
	}
	public ArrayList<Patient> UserDisplay(int page, int limit) {
		Patient pat = null;
		ArrayList<Patient> a = new ArrayList<Patient>();
		try {
			conn = ConnectionManager.getConnection();
			Statement st=conn.createStatement();
			String str="select * from patient limit "+(page-1)*limit+", "+limit;
			rSet = st.executeQuery(str);
		
			while (rSet.next()) 
			{
				pat = new Patient(rSet.getInt(1), rSet.getString(2), rSet.getString(3), rSet.getString(4), rSet.getString(5) ,
						rSet.getString(6), rSet.getString(7));
				System.out.println(pat);
				a.add(pat);
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
			Statement st=conn.createStatement();
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
