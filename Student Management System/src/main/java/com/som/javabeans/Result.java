package com.som.javabeans;

public class Result {
	
	private long roll;
	private String semister;
	private int sub1;
	private int sub2;
	private int sub3;
	private int sub4;
	private int sub5;
	private int total;
	private float cgpa;
	
	
	
	public Result() {
		
	}


	public Result(long roll, String semister, int sub1, int sub2, int sub3, int sub4, int sub5) {
		
		this.roll = roll;
		this.semister = semister;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
		this.sub4 = sub4;
		this.sub5 = sub5;
		
	}

	

	public Result(long roll, String semister, int sub1, int sub2, int sub3, int sub4, int sub5, int total, float cgpa) {
		
		this.roll = roll;
		this.semister = semister;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
		this.sub4 = sub4;
		this.sub5 = sub5;
		this.total = total;
		this.cgpa = cgpa;
		
	}


	public long getRoll() {
		return roll;
	}


	public void setRoll(long roll) {
		this.roll = roll;
	}


	public String getSemister() {
		return semister;
	}


	public void setSemister(String semister) {
		this.semister = semister;
	}


	public int getSub1() {
		return sub1;
	}


	public void setSub1(int sub1) {
		this.sub1 = sub1;
	}


	public int getSub2() {
		return sub2;
	}


	public void setSub2(int sub2) {
		this.sub2 = sub2;
	}


	public int getSub3() {
		return sub3;
	}


	public void setSub3(int sub3) {
		this.sub3 = sub3;
	}


	public int getSub4() {
		return sub4;
	}


	public void setSub4(int sub4) {
		this.sub4 = sub4;
	}


	public int getSub5() {
		return sub5;
	}


	public void setSub5(int sub5) {
		this.sub5 = sub5;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public float getCgpa() {
		return cgpa;
	}


	public void setCgpa(float cgpa) {
		this.cgpa = cgpa;
	}
	
	

}
