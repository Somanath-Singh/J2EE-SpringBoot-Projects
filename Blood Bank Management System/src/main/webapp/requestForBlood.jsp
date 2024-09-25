<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.som.javabeans.User" %>
<%@page import="com.som.dao.UserDao" %>
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
                <li><a href="editDeleteDonor.jsp">Edit,Delete & List of Donor Details</a></li>
                <li><a href="manageStock.jsp">Manage Stock</a></li>
                <li><a href="requestForBlood.jsp" style="background-color:white;color:black;">Request for Blood</a></li>
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
                		<center><font color="green" size="5">User request approved ...</font></center>
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
                		<center><font color="red" size="5"> User request deleted ....</font></center>
                	<%
                		}
                	%>
            <table border="1" width="100%">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                     <th>Email</th>
                    <th>Mobile no</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                    <th>Done</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
             <%
          
          UserDao u=new UserDao(ConnectionProvider.getConnection());
          List<User> user=u.getAllUser();
          for(User u1:user)
          {
        %>
                <tr>
                	<td><%=u1.getId()%></td>
                    <td><%=u1.getName() %></td>
					<td><%=u1.getEmail() %></td>
                    <td><%=u1.getPhno() %></td>
                    <td><%=u1.getGender() %></td>
                    <td><%=u1.getBgroup() %></td>
                    <td><a href="RequestApprovedServlet?id=<%=u1.getId()%>"  style="background-color:orange;color:black;padding:10px;border-radius:10px;">Done</a></td>
                    <td><a href="DeleteUser?id=<%=u1.getId()%>"  style="background-color:red;color:#fff;padding:10px;border-radius:10px;">Delete</a></td>
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