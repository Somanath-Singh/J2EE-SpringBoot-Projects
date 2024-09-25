<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.som.helper.ConnectionProvider" %>
  <%@page import="com.som.javabeans.User" %>
   <%@page import="com.som.dao.UserDao" %>
 <%@page import="java.sql.*" %>
<!--  collect the information comming from index page -->
 <%
 	
 	String name=request.getParameter("uname");
	String email=request.getParameter("uemail");
 	String mobileno=request.getParameter("umobile");
 	String gender=request.getParameter("gender");
 	String bloodgroup=request.getParameter("group");
 	String status ="pending";
 	
 	try{
 		//store all the information to User javabeans class
 		User user=new User(name,email,mobileno,gender,bloodgroup,status);
 		UserDao udao=new UserDao(ConnectionProvider.getConnection());
 		 
 		boolean f=udao.saveUserData(user);
 		System.out.println(f);
 		if(f){
 			response.sendRedirect("index.jsp?msg=Valid");
 		}
 		else{
 			response.sendRedirect("index.jsp?msg=InValid");
 		}
 		
 	}
 	catch(Exception se){
 		se.printStackTrace();
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>