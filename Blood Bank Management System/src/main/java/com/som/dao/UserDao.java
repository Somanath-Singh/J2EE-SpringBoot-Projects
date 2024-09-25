package com.som.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.som.javabeans.Donor;
import com.som.javabeans.User;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		
		this.con = con;
		
	}
	
	public boolean saveUserData(User u) {
		
		boolean f=false;
		
		try {
			String query="INSERT INTO BLOODREQUEST(NAME,EMAIL,MOBILENO,GENDER,BLOODGROUP,STATUS) VALUES(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			//set the value to query param
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhno());
			ps.setString(4, u.getGender());
			ps.setString(5, u.getBgroup());
			ps.setString(6, u.getStatus());
			
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
	
	
public List<User> getAllUser(){
		
		List<User> list= new ArrayList<>();
		
		//fetch all the news data
		
		try {
			String query="SELECT  ID,NAME,EMAIL,MOBILENO,GENDER,BLOODGROUP FROM BLOODREQUEST WHERE STATUS=?";
			PreparedStatement ps=con.prepareStatement(query);
			//add the parameter
			ps.setString(1, "pending");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int id=rs.getInt("id");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String phno=rs.getString("mobileno");
				String gender=rs.getString("gender");
				String bgroup=rs.getString("bloodgroup");
				
				//create the Donor class object and pass the value of getting data to news constructor
				User u=new User(id,name,phno,gender,email,bgroup);
				
				//add all the object to list
				list.add(u);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
	
	return list;
	
}


public List<User> getAllApprovedUser(){
	
	List<User> list= new ArrayList<>();
	
	//fetch all the news data
	
	try {
		String query="SELECT  ID,NAME,EMAIL,MOBILENO,GENDER,BLOODGROUP FROM BLOODREQUEST WHERE STATUS=?";
		PreparedStatement ps=con.prepareStatement(query);
		//add the parameter
		ps.setString(1, "Approved");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String email=rs.getString("email");
			String phno=rs.getString("mobileno");
			String gender=rs.getString("gender");
			String bgroup=rs.getString("bloodgroup");
			
			//create the Donor class object and pass the value of getting data to news constructor
			User u=new User(id,name,phno,gender,email,bgroup);
			
			//add all the object to list
			list.add(u);
			
		}
	}
	catch(Exception se) {
		se.printStackTrace();
	}

return list;

}


public boolean approvedUserDetails(User u) {
	
	boolean f=false;
	
	try {
		String query="UPDATE BLOODREQUEST SET STATUS=? WHERE ID=?";
		PreparedStatement ps=this.con.prepareStatement(query);
		//set the query param
		
		ps.setString(1, "Approved");
		ps.setInt(2, u.getId());
		
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


public boolean deleteUserDetails(User u) {
	
	boolean f=false;
	
	try {
		String query="DELETE FROM BLOODREQUEST WHERE ID=?";
		PreparedStatement ps=this.con.prepareStatement(query);
		
		//	set the parameter
		
		ps.setInt(1, u.getId());
		
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
