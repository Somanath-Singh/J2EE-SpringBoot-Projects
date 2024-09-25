package com.clgw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.NewsDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Admin;
import com.clgw.javabeans.Message;
import com.clgw.javabeans.PostNews;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//set the response content type
				res.setContentType("text/html");
				//get the stream
				try(PrintWriter pw=res.getWriter();)
				{
					//fetch the News
					String n_id=req.getParameter("nid");
					int nid=Integer.parseInt(n_id);
					String news=req.getParameter("news");
					
					
					//get httpsession object
					HttpSession s = req.getSession();
					Admin adm=(Admin)s.getAttribute("currentUserAdmin");
					
					int adminid=adm.getId();
					//create a object of NewsDao
					NewsDao dao=new NewsDao(ConnectionProvider.getConnection());
					
					//create the object of PostNews
					PostNews p=new PostNews(nid, news,adminid);
					
					if(dao.addNews(p)) {
						pw.println("News Inserted successfully  ..");
				    	
				    	//call the Message class constructor with object creating
						Message msg=new Message("News Inserted Successfully . ...","success","alert-success");
						s.setAttribute("editmessage",msg);
				    	
				    }
				    else {
				    	
				    	pw.println("Error in Inserting the News ....");
				    	//call the Message class constructor with object creating
						Message msg=new Message("Something went wrong while Inserting the News . ...","error","alert-danger");
						s.setAttribute("message",msg);
						
				    }//if
				    
					res.sendRedirect("AdminProfile.jsp");
				}//try
	}//dGet(-,-)

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}

}
