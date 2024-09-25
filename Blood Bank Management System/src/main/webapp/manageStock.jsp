<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.som.javabeans.BlodStock" %>
<%@page import="com.som.dao.BloodStockDao" %>
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
                <li><a href="manageStock.jsp" style="background-color:white;color:black;">Manage Stock</a></li>
                <li><a href="requestForBlood.jsp">Request for Blood</a></li>
                <li><a href="requestCompleted.jsp">Request Completed</a></li>
            </ul>
            </div>
            <div>
                <h3><a href="AdminLogoutServlet">Logout</a></h3>
            </div>
        </div>

       <section class="sub-body">
            <fieldset>
            		<%
                		String msg=request.getParameter("msg");
                		if("valid".equals(msg)){
                	%>
                		<center><font color="blue" size="5"> Details saved successfully ..</font></center>
                	<%
                		}
                	%>
                <% 
                if("invalid".equals(msg))
                	{
                	%>
                		<center><font color="red" size="5">Invalid Details ! Try again ..</font></center>
                	<%
                	}
                	%>
                <legend><h1 style="color:blue;">/..Manage Blood Bank Stock ../</h1> </legend>
                <form action="ManageStockservlet" method="POST">
                     <div>
                        <label for="group">Select Blood group :</label>
                        <br>
                        <select name="id" id="group" required>
                            <option selected disabled>Select Group ...</option>
                            <option value="1">A+</option>
                            <option value="2">B+</option>
                            <option value="3">AB+</option>
                            <option value="4">O+</option>
                            <option value="5">A-</option>
                            <option value="6">B-</option>
                            <option value="7">AB-</option>
                            <option value="8">O-</option>
                        </select>
                    </div>
                    <div>
                        <label for="qty">Select Increase/decrease :</label>
                        <br>
                        <select name="scale" id="qty" required>
                            <option selected disabled>Select One ...</option>
                            <option value="inc">Increase</option>
                            <option value="dec">Decrease</option>
                        </select>
                    </div>
                    <div>
                        <label for="unit">Enter Units of Blood :</label>
                        <br>
                        <input type="number" id="unit" name="bunit" required>
                    </div>
                    <div>
                        <button type="submit" class="btn">Save</button>
                    </div>
                
                </form>
            </fieldset>
            
                <section class="sub-body-table stock-blood">
                
                	<table border="1" width="100%">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Blood Group</th>
                    <th>Units</th>
                </tr>
            </thead>
            <tbody>
             <%
          
          BloodStockDao bsd=new BloodStockDao(ConnectionProvider.getConnection());
          List<BlodStock> bs=bsd.getAllStockDetails();
          for(BlodStock b:bs)
          {
        %>
                <tr>
                	<td><%=b.getId()%></td>
                    <td><%=b.getGroup() %></td>
					<td><%=b.getUnits() %></td>
                </tr>
                <%
                }
        		  %>
            </tbody>
        </table>
                
                </section>
            
            
        
        </section>
    </section>
</body>
</html>