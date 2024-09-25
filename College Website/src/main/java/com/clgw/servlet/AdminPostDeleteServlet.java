package com.clgw.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.PostDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.javabeans.Message;

/**
 * Servlet implementation class AdminPostDeleteServlet
 */
@MultipartConfig
public class AdminPostDeleteServlet extends HttpServlet {
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
					
					String pId=req.getParameter("post-id");
					
					if(pId   ==  null) {
						
						pw.println("please fill all the fields ...");
						
						System.out.println(pId);
						
					}
					else {
						
						int postId=Integer.parseInt(pId);
						
						 //get the postdao class object 
					    PostDao pdao=new PostDao(ConnectionProvider.getConnection());
					    
					    boolean ans=pdao.deletePost(postId);
					    
					    if(ans) {
					    	
					    	pw.println("post deleted successfully  ..");
					    	
					    	//call the Message class constructor with object creating
							Message msg=new Message("Post details updated . ...","success","alert-success");
							s.setAttribute("editmessage",msg);
					    	
					    }
					    else {
					    	
					    	pw.println("Error in delete the post ....");
					    	//call the Message class constructor with object creating
							Message msg=new Message("Something went wrong while updating post . ...","error","alert-danger");
							s.setAttribute("message",msg);
							
					    }//if
					    
						res.sendRedirect("AdminProfile.jsp");
					}//if
				
					
				}//try
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
		
	}

}
