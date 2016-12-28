package com.psl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.psl.model.Message;
import com.psl.model.Patient;
import com.psl.model.UserBean;

public class PatientEntry {
	Connection connection = ConnectionManager.getConnection();
	
	public ArrayList<Patient> UserDisplay(int page) {
		return UserDisplay(page, 5);
	}
	public ArrayList<Patient> UserDisplay() {
		return UserDisplay(1, 5);
	}
	public ArrayList<Patient> UserDisplay(int page, int limit) {
		Patient patient = null;
		ArrayList<Patient> a = new ArrayList<Patient>();
		try {
			Statement st = connection.createStatement();
			String str="select * from patient limit "+(page-1)*limit+", "+limit;
			ResultSet rs = st.executeQuery(str);
		
			while (rs.next()) {
				patient = new Patient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
				a.add(patient);
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
		ResultSet rs = st.executeQuery("select count(*) from patient");
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
