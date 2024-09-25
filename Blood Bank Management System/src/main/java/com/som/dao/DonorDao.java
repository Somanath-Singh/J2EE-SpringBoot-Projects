package com.som.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.som.javabeans.Donor;

public class DonorDao {

	private Connection con;

	public DonorDao(Connection con) {
		
		this.con = con;
		
	}
	
	
	public boolean saveDonorDetails(Donor d) {
		
		boolean f=false;
		
		try {
			String query="INSERT INTO DONOR(NAME,FATHER,MOTHER,MOBILENO,GENDER,EMAIL,BLOODGROUP,ADDRESS) VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			
			ps.setString(1, d.getName());
			ps.setString(2 ,d.getFname());
			ps.setString(3 ,d.getMname());
			ps.setString(4, d.getPhno());
			ps.setString(5, d.getGender());
			ps.setString(6, d.getEmail());
			ps.setString(7, d.getBgroup());
			ps.setString(8, d.getAddress());
			
			
			//execute the query
			ps.executeUpdate();
			
			//query executed successfully
			f=true;
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	
	
	public List<Donor> getAllDonor(){
		
		List<Donor> list= new ArrayList<>();
		
		//fetch all the news data
		
		try {
			String query="SELECT  ID,NAME,FATHER,MOTHER,MOBILENO,GENDER,EMAIL,BLOODGROUP,ADDRESS FROM DONOR ORDER BY ID ASC";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int id=rs.getInt("id");
				String name=rs.getString("name");
				String fname=rs.getString("father");
				String mname=rs.getString("mother");
				String phno=rs.getString("mobileno");
				String gender=rs.getString("gender");
				String email=rs.getString("email");
				String bgroup=rs.getString("bloodgroup");
				String address=rs.getString("address");
				
				//create the Donor class object and pass the value of getting data to news constructor
				Donor d=new Donor(id,name,fname,mname,phno,gender,email,bgroup,address);
				
				//add all the object to list
				list.add(d);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
	
	return list;
	
}
	
	public List<Donor> getDonorDetailsById(String id){
		
		List<Donor> list= new ArrayList<>();
		
		//fetch all the news data
		
		try {
			String query="SELECT ID, NAME,FATHER,MOTHER,MOBILENO,EMAIL,BLOODGROUP,ADDRESS FROM DONOR WHERE ID=?";
			PreparedStatement ps=con.prepareStatement(query);
			//set the parameter
			int Id=Integer.parseInt(id);
			ps.setInt(1, Id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int did=rs.getInt("id");
				String name=rs.getString("name");
				String fname=rs.getString("father");
				String mname=rs.getString("mother");
				String phno=rs.getString("mobileno");
				String email=rs.getString("email");
				String bgroup=rs.getString("bloodgroup");
				String address=rs.getString("address");
				
				//create the Donor class object and pass the value of getting data to news constructor
				Donor d=new Donor(did,name,fname,mname,phno,email,bgroup,address);
				
				
				//add all the object to list
				list.add(d);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
	
	return list;
	
}
	
	
	
public boolean updateDonorDetails(Donor d) {
		
		boolean f=false;
		
		try {
			String query="UPDATE DONOR SET NAME=?,FATHER=?,MOTHER=?,MOBILENO=?,EMAIL=?,BLOODGROUP=?,ADDRESS=? WHERE ID=?";
			PreparedStatement ps=this.con.prepareStatement(query);
			
			ps.setString(1, d.getName());
			ps.setString(2 ,d.getFname());
			ps.setString(3 ,d.getMname());
			ps.setString(4, d.getPhno());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getBgroup());
			ps.setString(7, d.getAddress());
			ps.setInt(8, d.getId());
			
			//execute the query
			ps.executeUpdate();
			
			//query executed successfully
			f=true;
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}

public boolean deleteDonorDetails(Donor d) {
	
	boolean f=false;
	
	try {
		String query="DELETE FROM DONOR WHERE ID=?";
		PreparedStatement ps=this.con.prepareStatement(query);
		
		//	set the parameter
		
		ps.setInt(1, d.getId());
		
		//execute the query
		ps.executeUpdate();
		
		//query executed successfully
		f=true;
		
	}
	catch(Exception se) {
		se.printStackTrace();
	}
	
	return f;
	
}


}
