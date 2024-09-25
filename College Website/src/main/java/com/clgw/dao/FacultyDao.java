package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.clgw.javabeans.Faculty;
import com.clgw.javabeans.Student;

public class FacultyDao {
	
	private Connection con;
	
	public FacultyDao(Connection con) {
		this.con=con;
	}
	
	
	
	//method to insert Student data into database
	
		public boolean addFaculty(Faculty fac) {
			boolean f=false;
			
			try {
				//Faculty--->Database
				//INSERT INTO `collegewebsite`.`faculty` (`name`, `email`, `password`, `gender`, `subject`, `about`) VALUES ('hari', 'hari123@gmail.com', '1234', 'male', 'python', 'teacher');
				String query="INSERT INTO FACULTY(NAME,EMAIL,PASSWORD,GENDER, SUBJECT,ABOUT) VALUES(?,?,?,?,?,?)";
				PreparedStatement ps=this.con.prepareStatement(query);
				
				ps.setString(1, fac.getName());
				ps.setString(2, fac.getEmail());
				ps.setString(3, fac.getPassword());
				ps.setString(4, fac.getGender());
				ps.setString(5, fac.getSubject());
				ps.setString(6, fac.getAbout());
				
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
		
	
	//get the details on the behalf of the email id and password
	public Faculty getFacultyByEmailAndPassword(String email,String password) {
		Faculty faculty=null;
		try {
			String query="SELECT * FROM FACULTY WHERE EMAIL=? AND PASSWORD=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				faculty=new Faculty();
				
				//get the data from DataBase
				faculty.setId(rs.getInt("id"));
				faculty.setName(rs.getString("name"));
				faculty.setEmail(rs.getString("email"));
				faculty.setPassword(rs.getString("password"));
				faculty.setGender(rs.getString("gender"));
				faculty.setSubject(rs.getString("subject"));
				faculty.setProfile(rs.getString("profile"));
				
			}
		}//try
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return faculty;
	}
	
	public boolean updateFaculty(Faculty faculty) {
		boolean f=false;
		try {
			String query="UPDATE FACULTY SET NAME=? , EMAIL=?, PASSWORD=?,GENDER=?,SUBJECT=?,PROFILE=? WHERE ID=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, faculty.getName());
			ps.setString(2, faculty.getEmail());
			ps.setString(3, faculty.getPassword());
			ps.setString(4, faculty.getGender());
			ps.setString(5, faculty.getSubject());
			ps.setString(6, faculty.getProfile());
			ps.setInt(7, faculty.getId());
			
			ps.executeUpdate();
			f=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	

	//get all faculty details
	
	public List<Faculty> getAllFacultyDetails(){
		
		List<Faculty> list=new ArrayList<>();
		
		//fetch all the faculty details
		
		try {
			String query="SELECT NAME, EMAIL,PROFILE,ABOUT  FROM FACULTY ORDER BY ID ASC";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				String name=rs.getString("name");
				String email=rs.getString("email");
				String profile=rs.getString("profile");
				String about=rs.getString("about");
				
				//create the faculty class object and pass the value of getting data to Faculty constructor
				Faculty fac=new Faculty(name, email, profile, about);
				
				//add all the object to list
				list.add(fac);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return list;
		
	}
}
