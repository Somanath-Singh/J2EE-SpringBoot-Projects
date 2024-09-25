package com.clgw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.clgw.javabeans.Event;
import com.clgw.javabeans.PostNews;

public class EventDao {

	Connection con;

	public EventDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to insert event data into the database
	
	public boolean addEvent(Event e) {
		
		boolean f=false;
		
		try {
			String query="INSERT INTO EVENT(EID,EDESCRIPTION,EDATE,AID) VALUES(?,?,?,?)";
			
			String sdate=e.getEdates();
			
			System.out.println(sdate);
			
			//create the preparedstatement object
			PreparedStatement ps=this.con.prepareStatement(query);
			
			ps.setInt(1, e.getEid());
			ps.setString(2, e.getEdescription());
			ps.setString(3, e.getEdates());
			ps.setInt(4, e.getAid());
			
			ps.executeUpdate();
			
			f=true;
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	
	//delete the event
	
			public boolean deleteNews(int eid) {
				
				boolean f=false;
				
				try {
					
					String query="DELETE FROM EVENT WHERE EID=?";
					PreparedStatement ps=this.con.prepareStatement(query);
					//set the pid
					ps.setInt(1, eid);
					
					ps.executeUpdate();
					
					f=true;
					
				}
				catch(Exception se)
				{
					se.printStackTrace();
				}
				
				return f;
				
			}
	
	//get the all event details
	
	public List<Event> getAllEvent(){
		
		List<Event> list= new ArrayList<>();
		
		//fetch all the news data
		
		try {
			String query="SELECT * FROM EVENT ORDER BY EID DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int eid=rs.getInt("eid");
				String edescription=rs.getString("edescription");
				String edate=rs.getString("edate");
				
				int aid=rs.getInt("aid");
				
				//create the Event class object and pass the value of getting data to Event constructor
				Event news=new Event(eid, edescription, edate,aid);
				
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
