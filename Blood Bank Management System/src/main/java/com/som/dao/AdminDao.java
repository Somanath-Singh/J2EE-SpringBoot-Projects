
package com.som.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {

	private Connection con;

	public AdminDao(Connection con) {
		
		this.con = con;
		
	}
	
	//verify the admin
		public int verifyAdmin(String uname,String password) {
			
			int count=0;
			
			try {
				String query="SELECT COUNT(*) FROM ADMIN WHERE NAME=? AND PASSWORD=?";
				PreparedStatement ps=con.prepareStatement(query);
				//set the query param to execute the query
				ps.setString(1, uname);
				ps.setString(2, password);
				
				//execute the query
				ResultSet rs=ps.executeQuery();
				if(rs!=null) {
					rs.next();
					
					count=rs.getInt(1);
					
					if(count == 0) {
						System.out.println("invalid credential "+count);
					}
					else {
						System.out.println("Valid credential "+count);
					}//if
				}//if
			}//try
			catch(Exception se) {
				se.printStackTrace();
			}
			
			return count;
			
		}
		
	}
	

