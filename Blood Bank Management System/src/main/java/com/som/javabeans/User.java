package com.som.javabeans;

public class User {

	private int id;
	private String name;
	private String email;
	private String phno;
	private String gender;
	private String bgroup;
	private String status;
	
	
	
	public User() {
		
	}

	

	public User(String name, String email, String phno, String gender, String bgroup, String status) {
		
		this.name = name;
		this.email = email;
		this.phno = phno;
		this.gender = gender;
		this.bgroup = bgroup;
		this.status = status;
		
	}



	public User(int id,String name, String email, String phno, String gender, String bgroup) {
		
		this.id=id;
		this.name = name;
		this.email = email;
		this.phno = phno;
		this.gender = gender;
		this.bgroup = bgroup;
		
	}


	
	public User(int id) {
		
		this.id = id;
		
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhno() {
		return phno;
	}


	public void setPhno(String phno) {
		this.phno = phno;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBgroup() {
		return bgroup;
	}


	public void setBgroup(String bgroup) {
		this.bgroup = bgroup;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
