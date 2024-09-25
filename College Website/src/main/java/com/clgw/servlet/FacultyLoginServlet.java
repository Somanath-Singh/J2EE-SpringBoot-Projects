package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.FacultyDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Faculty;
import com.clgw.javabeans.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class FacultyLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//get PrintWriter method
				PrintWriter pw=res.getWriter();
				//set contenttype
				res.setContentType("text/html");
				
				//get mail-id and Password from form data
				String email=req.getParameter("femail");
				String password=req.getParameter("fpassword");
				
				//create a object of FacultyDao class
				FacultyDao facultydao=new FacultyDao(ConnectionProvider.getConnection());
				
				//check the user email and password is present in the database or not
				Faculty f=facultydao.getFacultyByEmailAndPassword(email, password);
				
				if(f==null) {
					//login.......
//					error//
					//pw.println("Invalid Details.. try again");
					Message msg=new Message("Invalid Deatils ! try with another","error","alert-danger"); 
					HttpSession s=req.getSession();
					s.setAttribute("msg", msg);
					res.sendRedirect("login.jsp");
				}
				else {
					//login success
					HttpSession s=req.getSession();
					s.setAttribute("currentUserFaculty", f);
					res.sendRedirect("faculty_profile.jsp");
				}
				
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
