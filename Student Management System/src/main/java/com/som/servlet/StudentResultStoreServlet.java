package com.som.servlet;

import java.io.IOException;

import com.som.dao.ResultDao;
import com.som.helper.ConnectionProvider;
import com.som.javabeans.Result;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentResultStoreServlet
 */
public class StudentResultStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		//set the response content type
				res.setContentType("text/html");
				
				//fetch all form data
				
				long roll=Long.parseLong(req.getParameter("sroll"));
				String semister=req.getParameter("ssemister");
				int sub1=Integer.parseInt(req.getParameter("ssub1"));
				int sub2=Integer.parseInt(req.getParameter("ssub2"));
				int sub3=Integer.parseInt(req.getParameter("ssub3"));
				int sub4=Integer.parseInt(req.getParameter("ssub4"));
				int sub5=Integer.parseInt(req.getParameter("ssub5"));
				
				//create a Result object and set all the data into javabeans class constructor
				
				Result res1=new Result(roll,semister,sub1,sub2,sub3,sub4,sub5);
				
				//creating a resultdao object
				ResultDao rdao=new ResultDao(ConnectionProvider.getConnection());
				
				//call the store result method
				
				boolean b=rdao.addResult(res1);
				
				System.out.println(b);
				
				res.sendRedirect("AdminProfileInsert.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
		
	}

}
