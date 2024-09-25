package com.som.servlet;

import java.io.IOException;

import com.som.dao.DonorDao;
import com.som.helper.ConnectionProvider;
import com.som.javabeans.Donor;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveDonorDetailsServlet
 */
public class DeleteDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				//set the response content type
				res.setContentType("text/html");
				//fetch all form data to store it into database
				int id=Integer.parseInt(req.getParameter("id"));
				
				
				//create a donor object and set all the data into javabeans class constructor
				
				Donor d=new Donor(id);
				
				//creatingdonorDao object
				DonorDao ddao=new DonorDao(ConnectionProvider.getConnection());
				
				boolean b=ddao.deleteDonorDetails(d);
				
				System.out.println(b);
				
				if(b) {
					res.sendRedirect("editDeleteDonor.jsp?msg=delete");
				}
				else {
					res.sendRedirect("editDeleteDonor.jsp?msg=invalid");
				}
				
			
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
		
	}

}
