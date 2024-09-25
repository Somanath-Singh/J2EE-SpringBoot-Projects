package com.clgw.javabeans;

public class Admin {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private String aprofile;
	
	//create parameterized constructor
	public Admin(int id, String name, String email, String password, String gender, String aprofile,String about) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.aprofile = aprofile;
		this.about = about;
		
	}

	//default constructor
	public Admin() {
		
	}

	
	//getter and setter method
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAprofile() {
		return aprofile;
	}

	public void setAprofile(String aprofile) {
		this.aprofile = aprofile;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}
	
	
	

}
