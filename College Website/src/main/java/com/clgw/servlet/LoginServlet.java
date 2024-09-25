package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.StudentDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Message;
import com.clgw.javabeans.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter();){
			//login
			//fetch all user email and passowrd
			String studEmail=req.getParameter("email");
			String studPasw=req.getParameter("password");
			//create the object of StudentDao claaa to pass the jdbc url
			StudentDao dao=new StudentDao(ConnectionProvider.getConnection());
			//check the student email and password is present in the database or not
			Student stu=dao.getUserByEmailAndPassword(studEmail,studPasw);
			
			if(stu==null) {
				
				//login error
				//call the Message class constructor with object creating
				Message msg=new Message("Invalid details try with another ....","error","alert-danger");
				//create session object
				HttpSession s=req.getSession();
				s.setAttribute("message", msg);
				//when error in login page then redirect the message into login page
				res.sendRedirect("login.jsp");
				
			}
			else {
				//login success
				HttpSession s=req.getSession();
				s.setAttribute("currentUser", stu);
				res.sendRedirect("studentprofile.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
