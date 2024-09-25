package com.som.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			if(con == null) {
				//load the driver class
				Class.forName("com.mysql.cj.jdbc.Driver");
				//create the connection
				con=DriverManager.getConnection("jdbc:mysql:///studentmgmtsystem","root","root");
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		return con;
	}

}
