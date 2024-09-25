package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.AdminDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Admin;
import com.clgw.javabeans.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter();){
			//login
			//fetch all user email and password
			String AdminEmail=req.getParameter("Aemail");
			String AdminPassword=req.getParameter("Apassword");
			//create the object of AdminDao class to pass the jdbc url
			AdminDao adao=new AdminDao(ConnectionProvider.getConnection());
			//check the Admin email and password is present in the database or not
			Admin a=adao.getAdminByEmailAndPassword(AdminEmail, AdminPassword);
			
			
			if(a==null) {
				
				//login error
				//call the message class constructor with object creating
				Message msg1=new Message("Invalid details try with another ....","error","alert-danger");
				//creating session object
				HttpSession s=req.getSession();
				s.setAttribute("AdminMessage", msg1);
				res.sendRedirect("admin.jsp");
				
			}
			else {
				//login success
				HttpSession s=req.getSession();
				s.setAttribute("currentUserAdmin", a);
				res.sendRedirect("AdminProfile.jsp");
			}
			
			
		}
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
