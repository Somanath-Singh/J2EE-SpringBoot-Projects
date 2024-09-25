package com.clgw.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.clgw.dao.AdminDao;
import com.clgw.helper.ConnectionProvider;
import com.clgw.helper.Helper;
import com.clgw.javabeans.Admin;
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
 * Servlet implementation class AdminEditServlet
 */

@MultipartConfig
public class AdminEditServlet extends HttpServlet {
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
			//fetch all data
			String name=req.getParameter("admin-name");
			String gender=req.getParameter("admin-gender");
			String email=req.getParameter("admin-email");
			String pasw=req.getParameter("admin-password");
			String about=req.getParameter("admin-about");
			
			//get admin image
			//get the image from adminprofile.jsp page in the form of part
			Part file=req.getPart("admin-image");
			String imageName=file.getSubmittedFileName();
			
			//get the user Admin session attribute using httpsession object
			HttpSession s=req.getSession();
			Admin adm=(Admin)s.getAttribute("currentUserAdmin");
			
			//set the newly getting value to the javabeans of Admin class getter setter method
			adm.setName(name);
			adm.setGender(gender);
			adm.setEmail(email);
			adm.setPassword(pasw);
			adm.setAbout(about);
			
			//get the old image file path name of Admin
			String oldpicName=adm.getAprofile();
			
			//set the new file path name
			adm.setAprofile(imageName);
			
			//get the admindao class oblect 
			
			AdminDao adao=new AdminDao(ConnectionProvider.getConnection());
			
			//pass the "adm"  object where all Admin data is present
			
			boolean ans=adao.updateAdmin(adm);
			
			if(ans)
			{
				//get the new image path
				ServletContext context=req.getServletContext();
				String newimagepath=context.getRealPath("/")+"picture"  +  File.separator  +   adm.getAprofile();
				
				//delete old file
				//get the old image path
				ServletContext context1=req.getServletContext();
				String oldimagepath=context1.getRealPath("/")+"picture"  +   File.separator   +   oldpicName;
				
				//if the file is other than default.png file then delete the file
				
				if(!oldpicName.equals("default.png")) {
					
					boolean b=Helper.deleteFile(oldimagepath);
					System.out.println(b);
					
				}
				
				if(Helper.saveFile(file.getInputStream(), newimagepath)) {
					
					pw.println("profile updated  .....");
					
					//call the Message class constructor with object creating
					Message msg=new Message("profile details updated . ...","success","alert-success");
					s.setAttribute("editmessage",msg);
					
				}
				else {
					
					//call the Message class constructor with object creating
					Message msg=new Message("Something went wrong while updating profile  . ...","error","alert-danger");
					s.setAttribute("editmessage",msg);
					
				}
				
			}
			else {
				
				pw.println("User Data not updated");
				//call the Message class constructor with object creating
				Message msg=new Message("Something went wrong . ...","error","alert-danger");
				s.setAttribute("message",msg);
				
			}
			
			res.sendRedirect("AdminProfile.jsp");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

}
