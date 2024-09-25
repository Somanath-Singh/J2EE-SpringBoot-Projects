package com.som.javabeans;

public class BlodStock {

	private int id;
	private String group;
	private String scale;
	private int units;
	
	
	public BlodStock(int id, String group, int units) {
		
		this.id = id;
		this.group = group;
		this.units = units;
		
	}
	

	public BlodStock(String group, String scale, int units) {
	
		this.group = group;
		this.scale = scale;
		this.units = units;
		
	}


	public BlodStock() {
		
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getGroup() {
		return group;
	}


	public void setGroup(String group) {
		this.group = group;
	}


	
	public String getScale() {
		return scale;
	}


	public void setScale(String scale) {
		this.scale = scale;
	}


	public int getUnits() {
		return units;
	}


	public void setUnits(int units) {
		this.units = units;
	}
	
	
}
