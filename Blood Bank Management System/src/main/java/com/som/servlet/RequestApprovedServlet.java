package com.som.servlet;

import java.io.IOException;

import com.som.dao.UserDao;
import com.som.helper.ConnectionProvider;
import com.som.javabeans.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveDonorDetailsServlet
 */
public class RequestApprovedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				//set the response content type
				res.setContentType("text/html");
				//fetch all form data to store it into database
				int id=Integer.parseInt(req.getParameter("id"));
				System.out.println(id);
				
				//create a User object and set all the data into javabeans class constructor
				
				User u=new User(id);
				
				//creatingdonorDao object
				UserDao ddao=new UserDao(ConnectionProvider.getConnection());
				
				boolean b=ddao.approvedUserDetails(u);
				
				System.out.println(b);
				
				if(b) {
					res.sendRedirect("requestForBlood.jsp?msg=valid");
				}
				else {
					res.sendRedirect("requestForBlood.jsp?msg=invalid");
				}
			
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
		
	}

}
