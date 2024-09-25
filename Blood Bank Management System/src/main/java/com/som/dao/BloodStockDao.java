package com.som.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.som.javabeans.BlodStock;

public class BloodStockDao {

	private Connection con;

	
	public BloodStockDao(Connection con) {
		
		this.con = con;
		
	}
	
	
	
public List<BlodStock> getAllStockDetails(){
		
		List<BlodStock> list= new ArrayList<>();
		
		//fetch all the news data
		
		try {
			String query="SELECT  ID,BLOODGROUP,UNITS FROM BLOODSTOCK";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				int id=rs.getInt("id");
				String bgroup=rs.getString("bloodgroup");
				int units=rs.getInt("units");
				
				//create theBloodStock class object and pass the value of getting data to news constructor
				BlodStock d=new BlodStock(id,bgroup,units);
				
				//add all the object to list
				list.add(d);
				
			}
		}
		catch(Exception se) {
			se.printStackTrace();
		}
	
	return list;
	
}
	
}
