package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.clgw.javabeans.Faculty;
import com.clgw.javabeans.Staff;

public class StaffDao {

private Connection con;
	
	public StaffDao(Connection con) {
		this.con=con;
	}
	
	
	//method to insert Student data into database
	
			public boolean addStaff(Staff stf) {
				boolean f=false;
				
				try {
					//Faculty--->Database
					//INSERT INTO `collegewebsite`.`faculty` (`name`, `email`, `password`, `gender`, `subject`, `about`) VALUES ('hari', 'hari123@gmail.com', '1234', 'male', 'python', 'teacher');
					String query="INSERT INTO STAFF(NAME,GENDER,EMAIL,PASSWORD,ABOUT) VALUES(?,?,?,?,?)";
					PreparedStatement ps=this.con.prepareStatement(query);
					
					ps.setString(1, stf.getName());
					ps.setString(2, stf.getGender());
					ps.setString(3, stf.getEmail());
					ps.setString(4, stf.getPassword());
					ps.setString(5, stf.getAbout());
					
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
			
			
			//get all staff details
			
			public List<Staff> getAllStaffDetails(){
				
				List<Staff> list=new ArrayList<>();
				
				//fetch all the faculty details
				
				try {
					String query="SELECT NAME, EMAIL,ABOUT,PROFILE FROM STAFF ORDER BY ID ASC";
					PreparedStatement ps=con.prepareStatement(query);
					ResultSet rs=ps.executeQuery();
					
					while(rs.next()) {
						
						String name=rs.getString("name");
						String email=rs.getString("email");
						String about=rs.getString("about");
						String profile=rs.getString("profile");
						
						//create the faculty class object and pass the value of getting data to Faculty constructor
						Staff stf=new Staff(name, email, about ,profile);
						
						//add all the object to list
						list.add(stf);
						
					}
				}
				catch(Exception se) {
					se.printStackTrace();
				}
				
				return list;
				
			}
}
