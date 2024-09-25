package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.StaffDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffRegisterServlet
 */

@MultipartConfig
public class StaffRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter();){
			
			//fetch all form data
			String check=req.getParameter("staff-check");
			
			if(check==null) {
				
				pw.println("please click on agree terms and condition to register  ...");
				
			}
			else {
				//fetch all form data to store it into database
				
				String name=req.getParameter("staff-name");
				String email=req.getParameter("staff-email");
				String password=req.getParameter("staff-pasw");
				String gender=req.getParameter("gender");
				String about=req.getParameter("about");
				
				//create a Faculty object and set all the data into javabeans class constructor
			    Staff stf=new Staff(name,email,password,gender,about);
				
				//creating StudentrDao object
				StaffDao sdao=new StaffDao(ConnectionProvider.getConnection());
				
				//now call the "addStudent" method of StudentDao class
				
				if(sdao.addStaff(stf)) {
					//save
					pw.println("Staff Registration is Done  ...");
				}
				else {
					pw.println("Error in Staff Registration  ...");
				}
				
				
			}
				
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
