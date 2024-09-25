package com.nt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.nt.javabeans.Reply;

public class ReplyDao {
	
	Connection con;
	
	public ReplyDao(Connection con) {
		this.con=con;
	}
	
	
	public boolean addReply(Reply reply) {
		
		boolean f=false;
		
		try {
			String query="INSERT INTO COMMENTS(P_ID,U_ID,ANSWER)VALUES(?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, reply.getP_id());
			ps.setInt(2, reply.getU_id());
			ps.setString(3, reply.getAnswer());
			//execute the query
			ps.executeUpdate();
			
			f=true;
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	
	public ArrayList<Reply> getAllReplys(int pid){
		
		ArrayList<Reply> list=new ArrayList<>();
		
		try {
			String query="SELECT U_ID,ANSWER,RDATE FROM COMMENTS WHERE P_ID= ? ";
			PreparedStatement ps=con.prepareStatement(query);
			//set the query param
			ps.setInt(1, pid);
			//execute the query
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				int uid=rs.getInt(1);
				String answer=rs.getString(2);
				Timestamp date=rs.getTimestamp(3);
				
				//create the Reply class object and pass the value
				Reply rep=new Reply(uid,answer,date);
				
				
				//add all object into list
				list.add(rep);
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return list;
		
	}

}
