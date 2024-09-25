package com.nt.project.servlet;

import java.io.IOException;

import com.nt.dao.ReplyDao;
import com.nt.helper.ConnectionProvider;
import com.nt.javabeans.Message;
import com.nt.javabeans.Reply;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ReplyServlet
 */
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//set the response content type
		res.setContentType("text/html");
		//fetch all form data
		String reply=req.getParameter("reply");
		String p_id=req.getParameter("pid");
		int pid=Integer.parseInt(p_id);
		String u_id=req.getParameter("uid");
		int uid=Integer.parseInt(u_id);
		
		//create Reply class object and pass all the data
		Reply rep=new Reply(pid,uid,reply);
		
		//create the Replydao object
		ReplyDao dao=new ReplyDao(ConnectionProvider.getConnection());
		
		if(dao.addReply(rep)) {
			//call the Message class constructor with object creating
			Message msg=new Message("Reply successfully ...","success","alert-success");	
			//create session object
			HttpSession s= req.getSession();
			s.setAttribute("message",msg);

		}
		else {
			//call the Message class constructor with object creating
			Message msg=new Message("Something went wrong . ...","error","alert-danger");
			//create session object
			HttpSession s= req.getSession();
			s.setAttribute("message",msg);
			
		}
		
		res.sendRedirect("show-blog-page.jsp?post-id="+pid);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
