package com.som.javabeans;

public class Student {
	
	private String coursename;
	private String branch;
	private long rollno;
	private String name;
	private String fathername;
	private String gender;
	
	
	public Student() {
		
	}

//	

	public String getName() {
		return name;
	}


	

	public Student(String coursename, String branch, long rollno, String name, String fathername, String gender) {
		
		this.coursename = coursename;
		this.branch = branch;
		this.rollno = rollno;
		this.name = name;
		this.fathername = fathername;
		this.gender = gender;
		
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getFathername() {
		return fathername;
	}


	public void setFathername(String fathername) {
		this.fathername = fathername;
	}


	public String getCoursename() {
		return coursename;
	}


	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}


	public String getBranch() {
		return branch;
	}


	public void setBranch(String branch) {
		this.branch = branch;
	}


	public long getRollno() {
		return rollno;
	}


	public void setRollno(long rollno) {
		this.rollno = rollno;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}
	

}
