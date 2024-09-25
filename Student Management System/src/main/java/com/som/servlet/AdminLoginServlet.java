package com.som.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.som.dao.AdminDao;
import com.som.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter()){
			// Admin login
			//fetch all Admin username and password
			String username=req.getParameter("uname");
			String password=req.getParameter("password");
			//create the admindao object to pass the jdbc url
			AdminDao adao=new AdminDao(ConnectionProvider.getConnection());
			//check the admin username and password
			int a=adao.verifyAdmin(username,password);
			
			if(a == 0) {
				//login error
				res.sendRedirect("Adminloginerror.html");
			}
			else {
				//login success
				HttpSession s=req.getSession();
				s.setAttribute("CurrentAdmin", a);
				res.sendRedirect("AdminProfile.jsp");
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
