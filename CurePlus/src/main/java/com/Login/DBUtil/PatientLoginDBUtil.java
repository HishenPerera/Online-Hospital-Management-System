package com.Login.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DBConnection.DBConnection;
import com.Login.Model.Login;

public class PatientLoginDBUtil {

	private static PreparedStatement preparedStatement = null;
	private static Connection con = null;
	private static boolean isSuccess;
	private static ResultSet rs = null;
	
	public static boolean validate(Login login) {
		try {
			con = DBConnection.getConnection();
			String sql = "SELECT * FROM Patient WHERE username = ? AND password = ? ";
			preparedStatement = con.prepareStatement(sql);
			
			//Set the values for the parameters
			preparedStatement.setString(1, login.getlUsername());
			preparedStatement.setString(2, login.getlPassword());
			
			//Execute the query
			rs = preparedStatement.executeQuery();
			
			if(rs.next()) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			con.close();
			
		}catch(Exception e) {
			System.out.println("Validation Falied");
			e.printStackTrace();
			
		}
		
		return isSuccess;
	}
}
