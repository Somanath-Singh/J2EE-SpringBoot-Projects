package com.clgw.javabeans;

public class Staff {

	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private String profile;
	
	
	public Staff(int id, String name, String email, String password, String gender, String about, String profile) {
	
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.profile = profile;
	}

	
	public Staff() {
		
	}

	
	public Staff(String name, String email, String about, String profile) {
		
		this.name = name;
		this.email = email;
		this.about = about;
		this.profile = profile;
		
	}


	//initialize constructor
	

	public Staff(String name, String email, String password, String gender, String about) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
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


	public String getAbout() {
		return about;
	}


	public void setAbout(String about) {
		this.about = about;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
	
	
	
	
}
