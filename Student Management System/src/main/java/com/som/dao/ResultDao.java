package com.som.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.som.javabeans.Result;
import com.som.javabeans.Student;

public class ResultDao {

	private Connection con;

	public ResultDao(Connection con) {
		
		this.con = con;
		
	}
	
	public boolean addResult(Result res) {
		
		boolean f=false;
		
		try {
			//insert result
			String query="INSERT INTO RESULT(SROLL,SEMISTER,SUB1,SUB2,SUB3,SUB4,SUB5,TOTAL_MARK,CGPA)  VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			
			//set the query param
			ps.setLong(1, res.getRoll());
			ps.setString(2, res.getSemister());
			ps.setInt(3, res.getSub1());
			ps.setInt(4, res.getSub2());
			ps.setInt(5, res.getSub3());
			ps.setInt(6, res.getSub4());
			ps.setInt(7, res.getSub5());
			
			int total_mark=(res.getSub1() + res.getSub2() + res.getSub3() + res.getSub4() + res.getSub5());
			
			float percentage=(float)((total_mark*100)/(500));
			
			System.out.println(percentage);
			
			float cgpa= (float) ((percentage)/(9.5));
			
			System.out.println(cgpa);
			
			ps.setInt(8, total_mark);
			ps.setFloat(9, cgpa);
			
			
			//execute the query
			ps.executeUpdate();
			
			f=true;
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		return f;
		
	}
	
	
	//get all result details
	
		public List<Result> getAllResult(String sem){
			
			ArrayList<Result> list=null;
			
			try {
				String query="SELECT SROLL,SEMISTER,SUB1,SUB2,SUB3,SUB4,SUB5,TOTAL_MARK,CGPA FROM RESULT WHERE SEMISTER = ? ";
				PreparedStatement ps=con.prepareStatement(query);
				
				//set the query param
				ps.setString(1, sem);
				
				ResultSet rs=ps.executeQuery();
				
				//process the result set object to copy all record to List<Result> object
				
				list=new ArrayList<Result>();
				
				while(rs.next()){
					
					long roll=rs.getLong(1);
					String semister=rs.getString(2);
					int sub1=rs.getInt(3);
					int sub2=rs.getInt(4);
					int sub3=rs.getInt(5);
					int sub4=rs.getInt(6);
					int sub5=rs.getInt(7);
					int total=rs.getInt(8);
					float cgpa=rs.getFloat(9);
					
					//store into result class constructor
					
					Result res=new Result(roll,semister,sub1,sub2,sub3,sub4,sub5,total,cgpa);
					
					list.add(res);
					
				}//while
			}
			catch(Exception se) {
				se.printStackTrace();
			}
			
			return list;
			
		}
		
		
		//get all perticular result details
		
			public Result getResult(long roll, String sem){
				
				Result res=null;
				
				try {
					String query="SELECT SROLL,SEMISTER,SUB1,SUB2,SUB3,SUB4,SUB5,TOTAL_MARK,CGPA FROM RESULT WHERE SROLL = ? AND SEMISTER=?";
					PreparedStatement ps=con.prepareStatement(query);
					
					//set the query param
					ps.setLong(1, roll);
					ps.setString(2, sem);
					
					ResultSet rs=ps.executeQuery();
					
					//process the result set object to copy all record to List<Result> object
					
					if(rs!=null){
						
						rs.next();
						long sroll=rs.getLong(1);
						String semister=rs.getString(2);
						int sub1=rs.getInt(3);
						int sub2=rs.getInt(4);
						int sub3=rs.getInt(5);
						int sub4=rs.getInt(6);
						int sub5=rs.getInt(7);
						int total=rs.getInt(8);
						float cgpa=rs.getFloat(9);
						
						//store into result class constructor
						
						res=new Result(roll,semister,sub1,sub2,sub3,sub4,sub5,total,cgpa);
						
					}//while
				}
				catch(Exception se) {
					se.printStackTrace();
				}
				
				return res;
				
			}
}
