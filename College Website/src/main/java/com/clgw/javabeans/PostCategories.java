package com.clgw.javabeans;

public class PostCategories {

	private int cid;
	private String name;
	private String description;
	
	
	public PostCategories(int cid, String name, String description) {
		
		this.cid = cid;
		this.name = name;
		this.description = description;
		
	}

	//getters and setters

	public PostCategories() {
		
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}
