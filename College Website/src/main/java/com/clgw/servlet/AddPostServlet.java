package com.clgw.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.PostDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.helper.Helper;
import com.clgw.javabeans.Admin;
import com.clgw.javabeans.BlogPost;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		//set the response content type
				res.setContentType("text/html");
				//get the stream
				try(PrintWriter pw=res.getWriter();){
					/*output of your page here you use the sample code*/
					
					//fetch all form data
					String check=req.getParameter("post-check");

					//check all the field are getting or not 
					
					if(check == null )
					{
						pw.println("please click on agree terms and condition to register  ...");
					}
					else {
						//get category all details
						
						String pTitle=req.getParameter("ptitle");
						String pContent=req.getParameter("pcontent");
					    Part part=req.getPart("ppic");
					  //get image
			            //part.getSubmittedFileName() this method return the name of selected file
						String image=part.getSubmittedFileName();
						//getting current userid
						
						//get httpsession object
						HttpSession session = req.getSession();
						Admin adm=(Admin)session.getAttribute("currentUserAdmin");
						 
						String catid=req.getParameter("cid");
						
						if(catid==null) {
							pw.println("please fill all the fields ...");
						}
						int cid=Integer.parseInt(catid);
						//get the admin id it is used to identify which admin post the blog
						int adminid=adm.getId();
						
						//create the object of post class
						BlogPost p=new BlogPost( pTitle,pContent ,image,cid,adminid);
						
						//create the object of postdao
						PostDao dao=new PostDao(ConnectionProvider.getConnection());
						
						if(dao.savePost(p)) {
							
							
							//store the post pictures in the files 
							ServletContext context = req.getServletContext();
							String path = context.getRealPath("/")+"post-pics"+File.separator+image;
							System.out.println(path);
							boolean b=Helper.saveFile(part.getInputStream(), path);
							System.out.println(b);
							
							pw.println("Successfully post Blog ....");
						}
						else {
							pw.println("Error in post the blog ....");
							
						}//inner if
					}//outer if
					
				}//try
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		doGet(req, res);
		
	}

}
