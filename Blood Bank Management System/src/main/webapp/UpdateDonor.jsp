<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.som.javabeans.Donor" %>
<%@page import="com.som.dao.DonorDao" %>
<%@page import="com.som.helper.ConnectionProvider" %>
<%@page import="java.util.List" %>
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
                <li><a href="requestForBlood.jsp">Request for Blood</a></li>
                <li><a href="requestCompleted.jsp">Request Completed</a></li>
            </ul>
            </div>
            <div>
                <h3><a href="adminLogin.jsp">Logout</a></h3>
            </div>
        </div>

        <section class="sub-body">
        
       
            
        </section>
        
        <section class="sub-body">
        	
            <fieldset>
            		<%
                		String id=request.getParameter("id");
                		DonorDao ddao=new DonorDao(ConnectionProvider.getConnection());
                		List<Donor> donor=ddao.getDonorDetailsById(id);
                        for(Donor d1:donor)
                        {
                	%>
                		
                <legend><h1>Donner Id :<%=id %></h1> </legend>
                <form action="UpdateDonorDetailsServlet" method="POST">
               		 <div>
                        <label for="id">Donor Id :</label>
                        <br>
                        <input type="number" id="id" name="did"  value="<%=d1.getId()%>" required>
                    </div>
                    <div>
                        <label for="name"> Donor Name :</label>
                        <br>
                        <input type="text" id="name" name="dname" required value="<%=d1.getName()%>">
                    </div>
                    <div>
                        <label for="fname">Donor Father Name :</label>
                        <br>
                        <input type="text" id="fname" name="dfname" required value="<%=d1.getFname()%>">
                    </div>
                    <div>
                        <label for="mname">Donor Mother Name :</label>
                        <br>
                        <input type="text" id="mname" name="dmname" required value="<%=d1.getMname()%>">
                    </div>
                    <div>
                        <label for="mob">Enter Mobile No :</label>
                        <br>
                        <input type="text" id="mob" name="dmobile" required value="<%=d1.getPhno()%>">
                    </div>
                    <div>
                        <label for="email">Enter Email id :</label>
                        <br>
                        <input type="email" id="email" name="demail" required value="<%=d1.getEmail()%>">
                    </div>
                    <div>
                        <label for="group">Donor Blood group :</label>
                        <br>
                        <input type="text" id="group" name="bgroup" required value="<%=d1.getBgroup()%>">
                    </div>
                    <div>
                        <textarea rows="2" name="address" id="add"><%=d1.getAddress()%></textarea>
                    </div>
                    <div>
                        <button type="submit" class="btn">Update</button>
                    </div>
                
                </form>
                <%
                        }
                %>
            </fieldset>
        </section>
    </section>
</body>
</html>