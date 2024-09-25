<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@page import="com.som.javabeans.Donor" %>
<%@page import="com.som.dao.DonorDao" %>
<%@page import="com.som.helper.ConnectionProvider" %>
<%@page import="java.util.List" %>

<%
    	int adm=(int)session.getAttribute("CurrentAdmin");
   		 if(adm == 0){
    			response.sendRedirect("Adminlogin.jsp");
   				 }
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <section class="profile-body">
        <div class="header">
            <div>
            <ul>
                <li><a href="AdminProfile.jsp">Home</a></li>
                <li><a href="addNewDonor.jsp">Add New Donor</a></li>
                <li><a href="editDeleteDonor.jsp" style="background-color:white;color:black;">Edit,Delete & List of Donor Details</a></li>
                <li><a href="manageStock.jsp">Manage Stock</a></li>
                <li><a href="requestForBlood.jsp">Request for Blood</a></li>
                <li><a href="requestCompleted.jsp">Request Completed</a></li>
            </ul>
            </div>
            <div>
                <h3><a href="AdminLogoutServlet">Logout</a></h3>
            </div>
        </div>
	<br>
        <section class="sub-body-table">
       				 <%
                		String msg=request.getParameter("msg");
                		if("valid".equals(msg)){
                	%>
                		<center><font color="green" size="5">Successfully Updeted .</font></center>
                	<%
                		}
                	%>
                	<%
                		if("invalid".equals(msg)){
                	%>
                		<center><font color="red" size="5">Something went wrong ! Try again .</font></center>
                	<%
                		}
                	%>
                	<%
                		if("delete".equals(msg)){
                	%>
                		<center><font color="green" size="5">Successfully Deleted .</font></center>
                	<%
                		}
                	%>
            <table border="1" width="100%">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Father Name</th>
                    <th>Mother Name</th>
                    <th>Phone No</th>
                    <th>Gender</th>
                    <th>Email Id</th>
                    <th>Blood Group</th>
                    <th>Address</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
             <%
          
          DonorDao d=new DonorDao(ConnectionProvider.getConnection());
          List<Donor> donor=d.getAllDonor();
          for(Donor d1:donor)
          {
        %>
                <tr>
                	<td><%=d1.getId()%></td>
                    <td><%=d1.getName() %></td>
                    <td><%=d1.getFname() %></td>
                    <td><%=d1.getMname() %></td>
                    <td><%=d1.getPhno() %></td>
                    <td><%=d1.getGender() %></td>
                    <td><%=d1.getEmail() %></td>
                    <td><%=d1.getBgroup() %></td>
                    <td><%=d1.getAddress() %></td>
                    <td><a href="UpdateDonor.jsp?id=<%=d1.getId()%>" style="color:#05c46b;text-decoration:underline;">Edit</a></td>
                    <td><a href="DeleteDonor?id=<%=d1.getId()%>" style="color:red;text-decoration:underline;">Delete</a></td>
                </tr>
                <%
                }
        		  %>
            </tbody>
        </table>
        </section>
        
    </section>
</body>
</html>