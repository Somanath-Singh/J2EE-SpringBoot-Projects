package com.som.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.som.dao.StudentDao;
import com.som.helper.ConnectionProvider;
import com.som.javabeans.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentDetailsSaveServlet
 */
public class StudentDetailsSaveServlet extends HttpServlet {
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
					String course=req.getParameter("scourse");
					String branch=req.getParameter("sbranch");
					long roll=Long.parseLong(req.getParameter("sroll"));
					String sname=req.getParameter("sname");
					String fname=req.getParameter("sfname");
					String gender=req.getParameter("gender");
					
					//create a student object and set all the data into javabeans class constructor
					Student stu=new Student(course,branch,roll,sname,fname,gender);
					
					//create studentdao object
					StudentDao sdao=new StudentDao(ConnectionProvider.getConnection());
					
					//now call add student method
					boolean b=sdao.addStudent(stu);
					
					System.out.println(b);
					
					res.sendRedirect("AdminProfile.jsp");
					
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
