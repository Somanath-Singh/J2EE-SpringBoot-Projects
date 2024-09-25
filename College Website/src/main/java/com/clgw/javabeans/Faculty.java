package com.clgw.javabeans;


public class Faculty {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String subject;
	private String about;
	private String profile;
	
	
	public Faculty(int id, String name, String email, String password, String gender, String subject,String about,
			String profile) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.subject = subject;
		this.about=about;
		this.profile = profile;
	}
	
	
	
	public Faculty(String name, String email, String password, String gender, String subject, String about) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.subject = subject;
		this.about = about;
		
	}



	public Faculty(String name, String email, String profile, String about) {
		
		this.name = name;
		this.email = email;
		this.profile = profile;
		this.about = about;
		
		
	}



	public Faculty() {
		
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


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}
	
			
	
}
	
