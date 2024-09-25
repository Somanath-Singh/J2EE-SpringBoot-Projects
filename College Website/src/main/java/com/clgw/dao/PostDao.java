package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.clgw.javabeans.BlogPost;
import com.clgw.javabeans.PostCategories;


public class PostDao {
	
	Connection con ;

	
	public PostDao(Connection con) {

		this.con = con;
		
	}
	
	
	//get all post category
	
	public ArrayList<PostCategories> getAllCategories(){
		
		ArrayList<PostCategories> list=new ArrayList<>();;
		
		try {
			
			String query="SELECT * FROM CATEGORIES";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int cid=rs.getInt(1);
				String name=rs.getString(2);
				String description=rs.getString(3);
				
				PostCategories c=new PostCategories(cid,name,description);
				
				//add into list all category details
				list.add(c);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return list;	
	}
	

	//get all the posts and store it into the database
	
	public boolean savePost(BlogPost p) {
		
		boolean f=false;
		
		try {
			//INSERT INTO `collegewebsite`.`post` (`ptitle`, `pcontent`, `ppic`, `catid`, `adminid`) VALUES ('what is AI ?', 'welcome to post section .', 'logo.png', '1', '1');
			String query="INSERT INTO POST(CATID,ADMINID,PTITLE,PCONTENT,PPIC) VALUES(?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			
			ps.setInt(1, p.getCatid());
			ps.setInt(2, p.getAdminid());
			ps.setString(3, p.getPtitle());
			ps.setString(4, p.getPcontent());
			ps.setString(5, p.getPpic());
			

			//execute the query
			ps.executeUpdate();
			
			f = true;
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	//get postpic
	
	public String getPostPic(int postid){
		
		String pic=null;
		
		try {
			String query="SELECT PPIC FROM POST WHERE PID=?";
			PreparedStatement ps=con.prepareStatement(query);
			//set the pid
			ps.setInt(1, postid);
			//get the result set
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				pic=rs.getString(1);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return pic;
		
	}
	
	//update Post data
	
	public boolean updatePost(BlogPost bpos) {
		
		boolean f=false;
		
		try {
			//UPDATE `collegewebsite`.`post` SET `catid` = '2', `adminid` = '2', `ptitle` = 'What is web ?', `pcontent` = 'just check', `ppic` = 'new.png' WHERE (`pid` = '5');
			String query="UPDATE POST SET CATID=?  ,  ADMINID=?    ,     PTITLE=?   ,    PCONTENT=?    ,    PPIC=?   WHERE   PID=?";
			PreparedStatement ps=con.prepareStatement(query);
			//set the value to database
			ps.setInt(1, bpos.getCatid());
			ps.setInt(2, bpos.getAdminid());
			ps.setString(3, bpos.getPtitle());
			ps.setString(4, bpos.getPcontent());
			ps.setString(5, bpos.getPpic());
			ps.setInt(6, bpos.getPid());
			
			//execute the query
			ps.executeUpdate();
			f=true;
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	//delete the post
	
	public boolean deletePost(int postid) {
		
		boolean f=false;
		
		try {
			//DELETE FROM `collegewebsite`.`post` WHERE (`pid` = '6');
			String query="DELETE FROM POST WHERE PID=?";
			PreparedStatement ps=con.prepareStatement(query);
			//set the pid
			ps.setInt(1, postid);
			
			ps.executeUpdate();
			
			f=true;
			
		}
		catch(Exception se)
		{
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	
	//get all the post
	
	public List<BlogPost> getAllPost(){
		
		List<BlogPost> list= new ArrayList<>();
		
		//fetch all the post data
		
		try {
			String query="SELECT * FROM POST ORDER BY PID DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int pid=rs.getInt("pid");
				int catId=rs.getInt("catid");
				int userId=rs.getInt("adminid");
				String pTitle=rs.getString("ptitle");
				String pContent=rs.getString("pcontent");
				String pPic=rs.getString("ppic");
				Timestamp date=rs.getTimestamp("pdate");
				
				//create the post class object and pass the value of getting data to post constructor
				BlogPost post=new BlogPost(pid, catId, userId, pTitle, pContent, pPic, date);
				
				//add all the object to list
				list.add(post);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return list;
		
	}
	
}
