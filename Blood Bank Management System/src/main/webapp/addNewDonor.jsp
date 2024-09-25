<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.som.helper.ConnectionProvider" %>
  <%@page import="com.som.javabeans.User" %>
   <%@page import="com.som.dao.UserDao" %>
 <%@page import="java.sql.*" %>
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
                <li><a href="addNewDonor.jsp" style="background-color:white;color:black;">Add New Donor</a></li>
                <li><a href="editDeleteDonor.jsp">Edit,Delete & List of Donor Details</a></li>
                <li><a href="manageStock.jsp">Manage Stock</a></li>
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
                		<center><font color="blue" size="5">Donor details saved successfully ..</font></center>
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
                <legend>
                		<h1>
						 <%
        	int id=1;
                		try{
                			Connection con=ConnectionProvider.getConnection();
                			String query="SELECT MAX(id) FROM DONOR";
                			PreparedStatement ps=con.prepareStatement(query);
                			ResultSet rs=ps.executeQuery();
                			
                			if(rs!=null){
                				rs.next();
                				id=rs.getInt(1);
                				id=id+1;
                			}
            %>
                		Donor Id :<%out. println(id); %>
             
       <%     
                		}
                		catch(Exception se){
                			se.printStackTrace();
                		}
        %>
				 		</h1> 
				 </legend>
                <form action="SaveDonorDetailsServlet" method="POST">
                    <div>
                        <label for="name">Enter Donor Name :</label>
                        <br>
                        <input type="text" id="name" name="dname" required>
                    </div>
                    <div>
                        <label for="fname">Enter Donor Father Name :</label>
                        <br>
                        <input type="text" id="fname" name="dfname" required>
                    </div>
                    <div>
                        <label for="mname">Enter Donor Mother Name :</label>
                        <br>
                        <input type="text" id="mname" name="dmname" required>
                    </div>
                    <div>
                        <label for="mob">Enter Mobile No :</label>
                        <br>
                        <input type="text" id="mob" name="dmobile" required>
                    </div>
                    <div>
                        <label for="gen">Select Gender :</label>
                        <input type="radio" value="Male" id="gen" name="gender" required>Male
                        <input type="radio" value="Female" id="gen" name="gender" required>Female
                    </div>
                    <div>
                        <label for="email">Enter Email id :</label>
                        <br>
                        <input type="email" id="email" name="demail" required>
                    </div>
                    <div>
                        <label for="group">Select Donor Blood group :</label>
                        <br>
                        <select name="dgroup" id="group" required>
                            <option selected disabled>Select Group ...</option>
                            <option value="A+">A+</option>
                            <option value="B+">B+</option>
                            <option value="AB+">AB+</option>
                            <option value="O+">O+</option>
                            <option value="A-">A-</option>
                            <option value="B-">B-</option>
                            <option value="AB-">AB-</option>
                            <option value="O-">O-</option>
                        </select>
                    </div>
                    <div>
                        <textarea rows="2" name="address" id="add"></textarea>
                    </div>
                    <div>
                        <button type="submit" class="btn">Save</button>
                    </div>
                
                </form>
            </fieldset>
        </section>
    </section>
</body>
</html>