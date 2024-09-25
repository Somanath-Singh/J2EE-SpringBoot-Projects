package com.som.javabeans;

public class Donor {

	private int id;
	private String name;
	private String fname;
	private String mname;
	private String phno;
	private String gender;
	private String email;
	private String bgroup;
	private String address;


	
	public Donor(int id, String name, String fname, String mname, String phno, String gender, String email,
			String bgroup, String address) {
		
		this.id = id;
		this.name = name;
		this.fname = fname;
		this.mname = mname;
		this.phno = phno;
		this.gender = gender;
		this.email = email;
		this.bgroup = bgroup;
		this.address = address;
		
	}
	
	
	


	public Donor(int id, String name, String fname, String mname, String phno, String email, String bgroup,
			String address) {
		
		this.id = id;
		this.name = name;
		this.fname = fname;
		this.mname = mname;
		this.phno = phno;
		this.email = email;
		this.bgroup = bgroup;
		this.address = address;
		
	}





	public Donor(String name, String fname, String mname, String phno, String gender, String email, String bgroup,
			String address) {
	
		this.name = name;
		this.fname = fname;
		this.mname = mname;
		this.phno = phno;
		this.gender = gender;
		this.email = email;
		this.bgroup = bgroup;
		this.address = address;
		
	}

	

	public Donor(int id) {
		
		this.id = id;
		
	}





	public Donor() {
		
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


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
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


	public String getBgroup() {
		return bgroup;
	}


	public void setBgroup(String bgroup) {
		this.bgroup = bgroup;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
	
	
}
