package com.clgw.javabeans;

import java.sql.Timestamp;

public class PostNews {
	
	private int newsId;
	private String newsContent;
	private int adminid;
	private Timestamp ndate;
	
	
	public PostNews() {
		super();
	}


	public PostNews(int newsId, String newsContent ,int adminid) {
		this.newsId = newsId;
		this.newsContent = newsContent;
		this.adminid=adminid;
	}

	

	public PostNews(int newsId, String newsContent, int adminid, Timestamp ndate) {
		super();
		this.newsId = newsId;
		this.newsContent = newsContent;
		this.adminid = adminid;
		this.ndate = ndate;
	}


	public int getAdminid() {
		return adminid;
	}


	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}


	public int getNewsId() {
		return newsId;
	}


	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}


	public String getNewsContent() {
		return newsContent;
	}


	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}


	public Timestamp getNdate() {
		return ndate;
	}


	public void setNdate(Timestamp ndate) {
		this.ndate = ndate;
	}
	
	
	

}
