package com.nt.javabeans;

import java.sql.Timestamp;

public class Reply {
	
	private int rid;
	private int p_id;
	private int u_id;
	private String answer;
	private Timestamp date;
	private String name;
	
	
	

	public Reply(int rid, int p_id, int u_id, String answer, Timestamp date) {
		
		this.rid = rid;
		this.p_id = p_id;
		this.u_id = u_id;
		this.answer = answer;
		this.date = date;
	}


	public Reply(int p_id, int u_id, String answer) {
		
		this.p_id = p_id;
		this.u_id = u_id;
		this.answer = answer;
	}

	

	public Reply(int u_id, String answer, Timestamp date) {

		this.u_id = u_id;
		this.answer = answer;
		this.date = date;
	}


	public Reply() {


	}


	public int getRid() {
		return rid;
	}


	public void setRid(int rid) {
		this.rid = rid;
	}


	public int getP_id() {
		return p_id;
	}


	public void setP_id(int p_id) {
		this.p_id = p_id;
	}


	public int getU_id() {
		return u_id;
	}


	public void setU_id(int u_id) {
		this.u_id = u_id;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public Timestamp getDate() {
		return date;
	}


	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	

}
