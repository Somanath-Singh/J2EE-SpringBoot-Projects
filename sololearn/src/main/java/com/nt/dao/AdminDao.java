package com.nt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nt.javabeans.Admin;

public class AdminDao {
	
	Connection con;
	
	public AdminDao(Connection con) {
		
		this.con=con;
		
	}
	
	public Admin getAdminEmailAndPassword(String email,String password) {
		
		Admin adm=null;
		
		try {
			String query="select * from admin where aemail= ? and apassword= ?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			//execute the query
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				
				adm=new Admin();
				
				adm.setAid(rs.getInt("aid"));
				adm.setAname(rs.getString("aname"));
				adm.setAemail(rs.getString("aemail"));
				adm.setApassword(rs.getString("apassword"));
				adm.setApic(rs.getString("apic"));
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		
		return adm;
		
	}

}
