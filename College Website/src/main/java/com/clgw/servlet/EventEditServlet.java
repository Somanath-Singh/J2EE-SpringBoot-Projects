package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.EventDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EventEditServlet
 */
@MultipartConfig
public class EventEditServlet extends HttpServlet {
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
					
						String eid=req.getParameter("eid");
						int eventId=Integer.parseInt(eid);
						
						 //get the Newsdao class object 
					    EventDao dao=new EventDao(ConnectionProvider.getConnection());
					    
					    boolean ans=dao.deleteNews(eventId);
					    
					    if(ans) {
					    	
					    	pw.println("Event deleted successfully  ..");
					    	
					    	//call the Message class constructor with object creating
							Message msg=new Message("Event Deleted Successfully . ...","success","alert-success");
							s.setAttribute("editmessage",msg);
					    	
					    }
					    else {
					    	
					    	pw.println("Error in delete the Event ....");
					    	//call the Message class constructor with object creating
							Message msg=new Message("Something went wrong while Deleting theEvent . ...","error","alert-danger");
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
