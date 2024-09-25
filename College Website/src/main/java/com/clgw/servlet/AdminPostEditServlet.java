package com.clgw.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.PostDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.helper.Helper;
import com.clgw.javabeans.Admin;
import com.clgw.javabeans.BlogPost;
import com.clgw.javabeans.Message;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class AdminPostEditServlet
 */
@MultipartConfig
public class AdminPostEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//set the response content type
		res.setContentType("text/html");
		//get the stream
		try(PrintWriter pw=res.getWriter();)
		{
			//fetch all the form data
			String pId=req.getParameter("post-id");
			int postId=Integer.parseInt(pId);
			String pTitle=req.getParameter("ptitle");
			String pContent=req.getParameter("pcontent");
			
			//get httpsession object
			HttpSession s = req.getSession();
			Admin adm=(Admin)s.getAttribute("currentUserAdmin");
			 
			String catid=req.getParameter("cid");
			
			if(catid==null) {
				pw.println("please fill all the fields ...");
			}
			int cid=Integer.parseInt(catid);
			
			//get the admin id it is used to identify which admin post the blog
			int adminid=adm.getId();
			
			//get post image
			//get the image from adminprofile.jsp page in the form of part
		    Part file=req.getPart("ppic");
		    String postImage=file.getSubmittedFileName();
		    
		    //create the javabeans of BlogPost class object to store newly getting value
		    
		    
		    BlogPost bpos=new BlogPost();
		    
		    //create the Postdao class object to get the oldpostpic value
		    PostDao dao=new PostDao(ConnectionProvider.getConnection());
		    
		    //call the getPostPic it returns postpic name
		  //get the old post image file path name of Post
		    
		    String oldpostpic=dao.getPostPic(postId);
		    System.out.println(oldpostpic);
		    
		    //set the newly getting value o the javabeans of Post class Getter and setter method
		    bpos.setPid(postId);
		    bpos.setCatid(cid);
		    bpos.setPtitle(pTitle);
		    bpos.setPcontent(pContent);
		    bpos.setAdminid(adminid);
		 
		    
		    //set the new post image file name
		    bpos.setPpic(postImage);
		    
		    //get the postdao class object 
		    PostDao pdao=new PostDao(ConnectionProvider.getConnection());
		    
		    //pass the "pdao" object where all Admin data is present
		    
		    boolean ans=pdao.updatePost(bpos);
		    
		    if(ans) {
		    	//get the new image path
		    	ServletContext context=req.getServletContext();
		    	String newimagepath = context.getRealPath("/")+"post-pics"+File.separator+bpos.getPpic();
				
		    	//delete old file
		    	//get the old image path
		    	ServletContext context1=req.getServletContext();
		    	String oldimagepath = context.getRealPath("/")+"post-pics"+File.separator+oldpostpic;
		    	
		    	//delete the old image path name
		    		if(oldpostpic == oldpostpic) {
					
		    				boolean b=Helper.deleteFile(oldimagepath);
		    				System.out.println(b);
					
		    			}
		    	
		    	if(Helper.saveFile(file.getInputStream(), newimagepath)) {
		    		
		    		pw.println("Post updated    ......");
		    		
		    		//call the Message class constructor with object creating
		    		Message msg=new Message("post details updated . ...","success","alert-success");
		    		s.setAttribute("editmessage",msg);
		    		
		    	}
		    	else
		    	{
		    		
		    		//call the Message class constructor with object creating
					Message msg=new Message("Something went wrong while updating Post  . ...","error","alert-danger");
					s.setAttribute("editmessage",msg);
					
		    	}//inner if
		    }
		    else {
		    	
		    	pw.println("Post  not updated");
				//call the Message class constructor with object creating
				Message msg=new Message("Something went wrong . ...","error","alert-danger");
				s.setAttribute("message",msg);
				
		    }
		    
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
