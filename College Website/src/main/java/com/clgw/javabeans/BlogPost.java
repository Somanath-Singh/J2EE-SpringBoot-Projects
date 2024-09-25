package com.clgw.javabeans;

import java.sql.Timestamp;

public class BlogPost {

	private int pid;
	private int catid;
	private int adminid;
	private String ptitle;
	private String pcontent;
	private String ppic;
	private Timestamp pdate;

	
	
	
	
	public BlogPost() {
		super();
	}


//store all the postservlet data into this constructor
	
	public BlogPost(int pid, int catid, int adminid, String ptitle, String pcontent, String ppic, Timestamp pdate) {
	
		this.pid = pid;
		this.catid = catid;
		this.adminid = adminid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.ppic = ppic;
		this.pdate = pdate;
		
	}

	
//getters and setters

	public BlogPost(String ptitle, String pcontent, String ppic, int catid, int adminid) {
		
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.ppic = ppic;
		this.catid = catid;
		this.adminid = adminid;
		
	}



	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public String getPtitle() {
		return ptitle;
	}



	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}



	public String getPcontent() {
		return pcontent;
	}



	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}



	public String getPpic() {
		return ppic;
	}



	public void setPpic(String ppic) {
		this.ppic = ppic;
	}



	public Timestamp getPdate() {
		return pdate;
	}



	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}



	public int getCatid() {
		return catid;
	}



	public void setCatid(int catid) {
		this.catid = catid;
	}



	public int getAdminid() {
		return adminid;
	}



	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	
	
	
	
}
