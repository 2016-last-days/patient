package com.psl.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import com.psl.bean.WrongFormatException;
import com.psl.servlets.ConnectionManager;

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
}
