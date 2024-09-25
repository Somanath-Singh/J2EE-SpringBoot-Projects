package com.som.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.som.javabeans.Student;

public class StudentDao {

	private Connection con;

	public StudentDao(Connection con) {
		
		this.con = con;
		
	}
	
	//method to insert Student data into database
	
	public boolean addStudent(Student stu) {
		
		boolean f=false;
		
		try {
			String query="INSERT INTO STUDENT(COURSE,BRANCH,ROLL,SNAME,FNAME,GENDER) VALUES(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			
			//set values to query param
			
			ps.setString(1, stu.getCoursename());
			ps.setString(2, stu.getBranch());
			ps.setLong(3, stu.getRollno());
			ps.setString(4, stu.getName());
			ps.setString(5, stu.getFathername());
			ps.setString(6, stu.getGender());
			
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
	
	//get all student details
	
	public List<Student> getAllStudent(){
		
		ArrayList<Student> list=null;
		
		try {
			String query="SELECT COURSE,BRANCH,ROLL,SNAME,FNAME,GENDER FROM STUDENT";
			PreparedStatement ps=con.prepareStatement(query);
			
			ResultSet rs=ps.executeQuery();
			
			//process the result set object to copy all record to List<Student> object
			
			list=new ArrayList<Student>();
			
			while(rs.next()) {
				
				String course=rs.getString(1);
				String branch=rs.getString(2);
				Long roll=rs.getLong(3);
				String sname=rs.getString(4);
				String fname=rs.getString(5);
				String gender=rs.getString(6);
				
				//store into student class constructor
				
				Student stu=new Student(course,branch,roll,sname,fname,gender);
				
				list.add(stu);
				
			}//while
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return list;
		
	}
	
	//get perticular student details
	
	public Student getStudent(long roll) {
		
		Student stu=null;
		
		try {
			
			String query="SELECT COURSE,BRANCH,ROLL,SNAME,FNAME,GENDER FROM STUDENT WHERE ROLL=?";
			PreparedStatement ps=con.prepareStatement(query);
			
			//SET THE VALUE TO QUERY PARAM
			ps.setLong(1, roll);
			
			//execute the query
			ResultSet rs=ps.executeQuery();
			
			if(rs!=null) {
				
				rs.next();
				String course=rs.getString(1);
				String branch=rs.getString(2);
				Long sroll=rs.getLong(3);
				String sname=rs.getString(4);
				String fname=rs.getString(5);
				String gender=rs.getString(6);
				
				//store into student class constructor
				
				//process the result set object to copy all record to Student objec
				stu=new Student(course,branch,sroll,sname,fname,gender);
				
			}	
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return stu;
		
	}
}
