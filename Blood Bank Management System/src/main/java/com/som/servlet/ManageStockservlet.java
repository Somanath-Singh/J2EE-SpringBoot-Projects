package com.som.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import com.som.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageStockservlet
 */
public class ManageStockservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageStockservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//set the response content type
		response.setContentType("text/html");
		
	
		int bid=Integer.parseInt(request.getParameter("id"));
		String scale=request.getParameter("scale");
		String unit=request.getParameter("bunit");
		int unit1=Integer.parseInt(unit);
		
		try{
			Connection con=ConnectionProvider.getConnection();
			Statement st=con.createStatement();
			
			if(scale.equals("inc")){
				st.executeUpdate("update bloodstock set units=units+' "+unit1+" ' where id= ' "+bid+" ' ");
			}
			else{
				st.executeUpdate("update bloodstock set units=units-' "+unit1+" ' where id= ' "+bid+" ' ");
			}
			
			response.sendRedirect("manageStock.jsp?msg=valid");
		}
		catch(Exception se){
			response.sendRedirect("manageStock.jsp.jsp?msg=invalid");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
