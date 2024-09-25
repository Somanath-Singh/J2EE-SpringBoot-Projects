package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.clgw.dao.StudentDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Message;
import com.clgw.javabeans.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class showStudentDetails
 */
public class showStudentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//set the response content type
				res.setContentType("text/html");
				
				HttpSession s=req.getSession();
				
				//get the stream
				try(PrintWriter pw=res.getWriter();){
					
					//fetch all the form data
					
					String branch=req.getParameter("branch");
					int batch=Integer.parseInt(req.getParameter("batch"));
					
					//get the studentdao class object
					StudentDao dao=new StudentDao(ConnectionProvider.getConnection());
					
					System.out.println(branch+"  "+batch);
					List<Student> list=dao.getAllStudentDetails(branch,batch);
					
					//keep the results in request scope attributes
					req.getSession().setAttribute("studentinfo", list);
					
					//forword the request to view component(jsp pages)
					RequestDispatcher rd=req.getRequestDispatcher("/AdminProfile.jsp");
					rd.forward(req, res);
					
					  if(list!=null) {
					    	
					    	pw.println("Student details fetch successfully ...");
					    	
					    	//call the Message class constructor with object creating
							Message msg=new Message("Student details fetch successfully ...","success","alert-success");
							s.setAttribute("editmessage",msg);
					    	
					    }
					    else {
					    	
					    	pw.println("Error in fetch the student details ...");
					    	//call the Message class constructor with object creating
							Message msg=new Message("Error in fetch the student details ...","error","alert-danger");
							s.setAttribute("editmessage",msg);
							
					    }//if
					
						res.sendRedirect("AdminProfile.jsp");
						
				}//try
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		doGet(req, res);
		
	}

}
