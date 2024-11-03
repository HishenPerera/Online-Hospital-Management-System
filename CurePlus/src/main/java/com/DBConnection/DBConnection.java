package com.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/hospital";
		String user = "root";
		String password = "root@123";

		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver not found.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Database Connection failed.");
			e.printStackTrace();
		}

		return con;
	}
}