package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.StudentDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentRegisterServlet
 */
@MultipartConfig
public class StudentRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter();){
			
			//fetch all form data
			String check=req.getParameter("stu-check");
			
			if(check==null) {
				
				pw.println("please click on agree terms and condition to register  ...");
				
			}
			else {
				//fetch all form data to store it into database
				
				String redg=req.getParameter("stu-redgno");
				
				if(redg==null) {
					pw.println("please fill all the fields ..");
				}
				long redgno=Long.parseLong(redg);
				String name=req.getParameter("stu-name");
				String email=req.getParameter("stu-email");
				String password=req.getParameter("stu-pasw");
				String gender=req.getParameter("stu-gender");
				String branch=req.getParameter("stu-branch");
				int batch=Integer.parseInt(req.getParameter("branch"));
				
				//create a Student object and set all the data into javabeans class constructor
				Student stu=new Student(redgno,name,email,password,gender,branch,batch);
				
				//creating StudentrDao object
				StudentDao sdao=new StudentDao(ConnectionProvider.getConnection());
				
				//now call the "addStudent" method of StudentDao class
				
				if(sdao.addStudent(stu)) {
					//save
					pw.println("Student Registration is Done  ...");
				}
				else {
					pw.println("Error in Student registration  ....");
				}
				
				
			}
				
			}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
		
	}

}
