package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.FacultyDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Faculty;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FacultyRegisterServlet
 */
@MultipartConfig
public class FacultyRegisterServlet extends HttpServlet {
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
					String check=req.getParameter("fac-check");
					
					if(check==null) {
						
						pw.println("please click on agree terms and condition to register  ...");
						
					}
					else {
						//fetch all form data to store it into database
						
						String name=req.getParameter("fac-name");
						String email=req.getParameter("fac-email");
						String password=req.getParameter("fac-pasw");
						String gender=req.getParameter("fac-gender");
						String subject=req.getParameter("fac-sub");
						String about=req.getParameter("about");
						
						//create a Faculty object and set all the data into javabeans class constructor
						Faculty fac=new Faculty(name,email,password,gender,subject,about);
						
						//creating StudentrDao object
						FacultyDao fdao=new FacultyDao(ConnectionProvider.getConnection());
						
						//now call the "addStudent" method of StudentDao class
						
						if(fdao.addFaculty(fac)) {
							//save
							pw.println("Faculty Registration is Done  ...");
						}
						else {
							pw.println("Error in Faculty Registration  ...");
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
