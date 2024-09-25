package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.clgw.javabeans.Student;

public class StudentDao {

	private Connection con;
	
	// get the url using constructor
	public StudentDao(Connection con) {
	
		this.con = con;
		
	}
	
	
	//method to insert Student data into database
	
	public boolean addStudent(Student stu) {
		boolean f=false;
		
		try {
			//Student---->Database
			//INSERT INTO `collegewebsite`.`student` (`redgno`, `name`, `email`, `password`, `gender`, `about`, `branch`) VALUES ();
			String query="INSERT INTO STUDENT(REDGNO, NAME,EMAIL,PASSWORD,GENDER, BRANCH,BATCH) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setLong(1, stu.getRedgno());
			ps.setString(2, stu.getName());
			ps.setString(3, stu.getEmail());
			ps.setString(4, stu.getPassword());
			ps.setString(5, stu.getGender());
			ps.setString(6, stu.getBranch());
			ps.setInt(7, stu.getBatch());
			
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
	
	
	//get student details using email and password
	public Student getUserByEmailAndPassword(String email,String password) {
		
		Student stud=null;
		try {
			String query="SELECT * FROM STUDENT WHERE EMAIL=? AND PASSWORD=?";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, password);
				
				//execute the query
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					stud=new Student();
					//get store the data in the javabeans class
					stud.setId(rs.getInt("id"));
					stud.setRedgno(rs.getLong("redgno"));
					stud.setName(rs.getString("name"));
					stud.setEmail(rs.getString("email"));
					stud.setPassword(rs.getString("password"));
					stud.setGender(rs.getString("gender"));
					stud.setProfile(rs.getString("profile"));
					stud.setBranch(rs.getString("branch"));
					stud.setBatch(rs.getInt("batch"));
					
					
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return stud;
	}
	
	
	//get all student name
	
	public List<Student> getAllStudentName(){
		
		List<Student> list=new ArrayList<>();
		
		//fetch all the student name
		
		try {
			String query="SELECT NAME  FROM STUDENT ORDER BY ID ASC";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				String name=rs.getString("name");
				
				//create the student class object and pass the value of getting data to student constructor
				Student stu=new Student(name);
				
				//add all the object to list
				list.add(stu);
				
			}
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		return list;
		
		
	}
	
	
	//get all student details
	
public List<Student> getAllStudentDetails(String branch,int batch){
		
		ArrayList<Student> list=null;
		System.out.println(branch+"  "+batch);
		//fetch all the student details
		
		try {
			String query="SELECT REDGNO,NAME,EMAIL,GENDER,BATCH,PROFILE FROM STUDENT WHERE BRANCH=? AND  BATCH=?";
			PreparedStatement ps=con.prepareStatement(query);
			
			//set the value to query param
			ps.setString(1, branch);
			ps.setInt(2, batch);
			
			//execute the query
			ResultSet rs=ps.executeQuery();
			
			//process the resultset object to copy record to List<Student> object
			list=new ArrayList<Student>();
			
			while(rs.next()) {
				
				long redgno=rs.getLong(1);
				String name=rs.getString(2);
				String email=rs.getString(3);
				String gender=rs.getString(4);
				int stubatch=rs.getInt(5);
				String profile=rs.getString(6);
				
				//create the Student class object and pass the value of getting data to Student constructor
				
				Student stu=new Student(redgno, name, email, gender, stubatch, profile);
				
				list.add(stu);
				
			}//while
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return list;
		
}

}
