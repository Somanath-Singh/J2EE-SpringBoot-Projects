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
public class UpdateDonorDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				//set the response content type
				res.setContentType("text/html");
				//fetch all form data to store it into database
				int id=Integer.parseInt(req.getParameter("did"));
				System.out.println(id);
				String name=req.getParameter("dname");
				String fname=req.getParameter("dfname");
				String mname=req.getParameter("dmname");
				String mobileno=req.getParameter("dmobile");
				String email=req.getParameter("demail");
				String bgroup=req.getParameter("bgroup");
				String address=req.getParameter("address");
				
				//create a donor object and set all the data into javabeans class constructor
				
				Donor d=new Donor(id,name,fname,mname,mobileno,email,bgroup,address);
				
				//creatingdonorDao object
				DonorDao ddao=new DonorDao(ConnectionProvider.getConnection());
				
				boolean b=ddao.updateDonorDetails(d);
				
				System.out.println(b);
				
				if(b) {
					res.sendRedirect("editDeleteDonor.jsp?msg=valid");
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
