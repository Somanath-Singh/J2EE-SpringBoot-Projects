package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.EventDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Admin;
import com.clgw.javabeans.Event;
import com.clgw.javabeans.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddEventServlet
 */
@MultipartConfig
public class AddEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter();){
			
			//fetch all form data
			
			String id=req.getParameter("eno");
			int eid=Integer.parseInt(id);
			String eventd=req.getParameter("news");
			String edates=req.getParameter("edate");
			
			//get httpsession object
			HttpSession s = req.getSession();
			Admin adm=(Admin)s.getAttribute("currentUserAdmin");
			
			int adminid=adm.getId();
			
			//create the eventdao class object
			EventDao edao=new EventDao(ConnectionProvider.getConnection());
			
			//create the object of Event
			
			Event e=new Event(eid, eventd, edates, adminid);
			
			if(edao.addEvent(e)) {
				pw.println("News Inserted successfully  ..");
		    	
		    	//call the Message class constructor with object creating
				Message msg=new Message("Event Inserted Successfully . ...","success","alert-success");
				s.setAttribute("editmessage",msg);
				
			}
			else {
				
				pw.println("Error in Inserting the News ....");
		    	//call the Message class constructor with object creating
				Message msg=new Message("Something went wrong while Inserting the Event . ...","error","alert-danger");
				s.setAttribute("message",msg);
				
			}
			
			res.sendRedirect("AdminProfile.jsp");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
		
	}

}
