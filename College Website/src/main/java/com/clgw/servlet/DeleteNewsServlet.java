package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.NewsDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//set the response content type
		res.setContentType("text/html");
		
		HttpSession s=req.getSession();
		
//get the stream
		try(PrintWriter pw=res.getWriter();){
			
			//fetch all the form data
			
				String nid=req.getParameter("newsId");
				int nId=Integer.parseInt(nid);
				
				 //get the Newsdao class object 
			    NewsDao dao=new NewsDao(ConnectionProvider.getConnection());
			    
			    boolean ans=dao.deleteNews(nId);
			    
			    if(ans) {
			    	
			    	pw.println("News deleted successfully  ..");
			    	
			    	//call the Message class constructor with object creating
					Message msg=new Message("News Deleted Successfully . ...","success","alert-success");
					s.setAttribute("editmessage",msg);
			    	
			    }
			    else {
			    	
			    	pw.println("Error in delete the News ....");
			    	//call the Message class constructor with object creating
					Message msg=new Message("Something went wrong while Deleting the News . ...","error","alert-danger");
					s.setAttribute("message",msg);
					
			    }//if
			    
				res.sendRedirect("AdminProfile.jsp");
		
		}//try
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}

}
