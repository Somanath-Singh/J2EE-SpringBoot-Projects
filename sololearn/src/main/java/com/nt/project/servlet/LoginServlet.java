package com.nt.project.servlet;

import java.io.IOException;

import com.nt.dao.AdminDao;
import com.nt.dao.UserDao;
import com.nt.helper.ConnectionProvider;
import com.nt.javabeans.Admin;
import com.nt.javabeans.Message;
import com.nt.javabeans.UserData;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// set the response content type
		response.setContentType("text/html");
		// get the stream

		/* output of your page here you use the sample code */
		// login
		// fetch all username and password
		String login_type=request.getParameter("login_type");
		String Name = request.getParameter("email");
		String Password = request.getParameter("password");
		
		if(login_type.equalsIgnoreCase("Admin")) {
			
			//create the object of AdminDao class
			AdminDao dao=new AdminDao(ConnectionProvider.getConnection());
			//check admin email id and password is present in the database or not
			Admin admin=dao.getAdminEmailAndPassword(Name,Password);
			
			if (admin == null) {
				// login error
				/* pw.println("Invalid details try again ....."); */
				// call the Message class constructor with object creating
				Message msg = new Message("Invalid details try with another ...", "error", "alert-danger");
				// create session object
				HttpSession s = request.getSession();
				s.setAttribute("message", msg);
				// when error user ivalid user email and password enter then we rediret this
				// message into login page
				response.sendRedirect("login-page.jsp");
			} else {
				// login success

				// get httpsession object
				HttpSession s = request.getSession();
				s.setAttribute("currentUserAdmin", admin);
				response.sendRedirect("AdminPage.jsp");
				
			}
				
		}
		else {
			// create object of UserDao class
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			// check the user email and password is present in the database or not
			UserData u = dao.getUserByEmailAndPassword(Name, Password);

			if (u == null) {
				// login error
				/* pw.println("Invalid details try again ....."); */
				// call the Message class constructor with object creating
				Message msg = new Message("Invalid details try with another ...", "error", "alert-danger");
				// create session object
				HttpSession s = request.getSession();
				s.setAttribute("message", msg);
				// when error user ivalid user email and password enter then we rediret this
				// message into login page
				response.sendRedirect("login-page.jsp");
			} else {
				// login success

				// get httpsession object
				HttpSession s = request.getSession();
				s.setAttribute("currentUser", u);
				response.sendRedirect("profile.jsp");
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
