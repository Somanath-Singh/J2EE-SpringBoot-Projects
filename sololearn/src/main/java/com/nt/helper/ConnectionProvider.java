package com.nt.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection con;
	
	public static Connection getConnection() 
	{	
		try {
			if(con == null) {
				//load the driver class
				Class.forName("com.mysql.cj.jdbc.Driver");
				//create a connection
				con=DriverManager.getConnection("jdbc:mysql:///sololearn","root","root");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
