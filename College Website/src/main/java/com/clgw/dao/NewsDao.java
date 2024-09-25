package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.clgw.javabeans.BlogPost;
import com.clgw.javabeans.PostNews;

public class NewsDao {
	
	Connection con ;
	
	public NewsDao(Connection con) {
		this.con=con;
	}
	
	//method to insert news data into the Data Base
	public boolean addNews(PostNews pn) {
		boolean f=false;
		try {
			String query="INSERT INTO NEWS(NID,NEWSCONTENT,ADMID) VALUES(?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, pn.getNewsId());
			ps.setString(2, pn.getNewsContent());
			ps.setInt(3, pn.getAdminid());
			//execute the Query
			ps.executeUpdate();
			
			//query Execute successfully
			f=true;

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//delete the news
	
		public boolean deleteNews(int nid) {
			
			boolean f=false;
			
			try {
				//DELETE FROM `collegewebsite`.`post` WHERE (`pid` = '6');
				String query="DELETE FROM NEWS WHERE NID=?";
				PreparedStatement ps=this.con.prepareStatement(query);
				//set the pid
				ps.setInt(1, nid);
				
				ps.executeUpdate();
				
				f=true;
				
			}
			catch(Exception se)
			{
				se.printStackTrace();
			}
			
			return f;
			
		}
		
		
		public List<PostNews> getAllNews(){
			
			List<PostNews> list= new ArrayList<>();
			
			//fetch all the news data
			
			try {
				String query="SELECT * FROM NEWS ORDER BY NID DESC";
				PreparedStatement ps=con.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					
					int nid=rs.getInt("nid");
					String nContent=rs.getString("newscontent");
					int adminId=rs.getInt("admid");
					Timestamp ndate=rs.getTimestamp("ndate");
					
					//create the news class object and pass the value of getting data to news constructor
					PostNews news=new PostNews(nid, nContent, adminId, ndate);
					
					//add all the object to list
					list.add(news);
					
				}
			}
			catch(Exception se) {
				se.printStackTrace();
			}
			
			return list;
			
		}
		

		
		

}
