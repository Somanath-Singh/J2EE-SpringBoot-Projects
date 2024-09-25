package com.som.servlet;

import java.io.IOException;

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
		
		//login
		//fetch all user email and password
		String uname=req.getParameter("name");
		String Password=req.getParameter("password");
		//create the object of AdminDao class to pass the jdbc url
		AdminDao adao=new AdminDao(ConnectionProvider.getConnection());
		//check the Admin email and password is present in the database or not
		int count=adao.verifyAdmin(uname, Password);
		
		if(count==1) {
			//login success
			HttpSession s=req.getSession();
			s.setAttribute("CurrentAdmin", count);
			res.sendRedirect("AdminProfile.jsp");
		}
		else {
			res.sendRedirect("AdminLogin.jsp?msg=InValid");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		doGet(req, res);
		
	}

}
