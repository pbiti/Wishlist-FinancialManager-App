package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Connector {
	Connection myConn = null;
	Statement myStmt = null;
	
	public Connector() {
		String url = "jdbc:mysql://localhost:3306/baseisdatabase";
		String dbUser = "root";
		String dbPassword = "ksql4321!";
		
		//set driver  
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//get connection
		try {
			this.myConn = DriverManager.getConnection(url, dbUser, dbPassword);
			this.myStmt = myConn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public Connection getConn() {
		return myConn;
	}
	
	public Statement getStmt() {
		return myStmt;
	}
}
