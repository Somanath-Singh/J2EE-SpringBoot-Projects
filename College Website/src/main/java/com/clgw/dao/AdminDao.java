package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.clgw.javabeans.Admin;

public class AdminDao {
	
	private Connection con;

	
	//get the url by constructor
	public AdminDao(Connection con) {
		
		this.con = con;
		
	}
	
	//get student details using email and password
	public Admin getAdminByEmailAndPassword(String email,String password) {
		
		Admin adm=null;
		
		try {
			String query="SELECT * FROM ADMIN WHERE EMAIL=? AND PASSWORD=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			//execute the query
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				adm=new Admin();
				//get store the data into javabeans class
				adm.setId(rs.getInt("id"));
				adm.setName(rs.getString("name"));
				adm.setEmail(rs.getString("email"));
				adm.setPassword(rs.getString("password"));
				adm.setGender(rs.getString("gender"));
				adm.setAbout(rs.getString("about"));
				adm.setAprofile(rs.getString("profile"));
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		return adm;	
	}
	
	
	//update Admin data
	
	public boolean updateAdmin(Admin adm) {
		boolean f=false;
		try {
			//UPDATE `collegewebsite`.`admin` SET `name` = 'sasmita mishra mam', `email` = 'sasmitamam123@gmail.com', `password` = '12345', `gender` = 'Femail', `about` = 'HOD of the Cs Department of igit' WHERE (`id` = '1');
			String query="UPDATE ADMIN SET NAME=?  ,    EMAIL=?   ,   PASSWORD=?   ,GENDER=?    ,   ABOUT=? ,PROFILE=?   WHERE ID=?";
			PreparedStatement ps=con.prepareStatement(query);
			//set the value to database
			ps.setString(1, adm.getName());
			ps.setString(2, adm.getEmail());
			ps.setString(3, adm.getPassword());
			ps.setString(4, adm.getGender());
			ps.setString(5, adm.getAbout());
			ps.setString(6, adm.getAprofile());
			ps.setInt(7, adm.getId());
			
			//execute the query
			ps.executeUpdate();
			f=true;
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		return f;	
	}
}
