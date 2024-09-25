<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.som.helper.ConnectionProvider" %>
<%@page import="com.som.dao.StudentDao" %>
<%@page import="com.som.javabeans.Student" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/action.js"></script>

</head>

<body>

    <section class="container">
        <div class="profileheader">
            <div>
                <img src="./media/s5logo.png" alt="">
            </div>
            <div>
                <hr>
                <h1>INDIRA GANDHI INSTITUTE OF TECHNOLOGY </h1>
            </div>
            <div>
                <img src="./media/favicon.jpg" alt="">
            </div>
        </div>
        <hr>

        <!-- nav section -->
        <div class="navlinks">
            <ul>
               <li><a href="./AdminProfile.jsp">Add New Student</a></li>
                <li><a href="./AdminProfileInsert.jsp">Insert New Result</a></li>
                <li style="background-image: linear-gradient(to right, rgba(0, 0, 255, 0.663),rgba(42, 213, 42, 0.619));color:white;"><a href="./AdminProfileShowStudent.jsp">Registered Student</a></li>
                <li><a href="./AdminProfileStudentResult.jsp">All Student Result</a></li>
                <li><a href="./AdminLogoutServlet">Logout</a></li>
            </ul>
        </div>

        <div class="stud-info">
            <div class="sub-info register-stud">
                <div>
                    <h3>Registered Student</h3>
                </div>
				
				<div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Course</th>
                                <th>Branch</th>
                                <th>Roll</th>
                                <th>Name</th>
                                <th>Father's Name</th>
                                <th>Gender</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
					StudentDao sdao=new StudentDao(ConnectionProvider.getConnection());
					List<Student> stu=sdao.getAllStudent();
					for(Student s1:stu){
					%>
							<tr>
								<td><%=s1.getCoursename() %></td>
                                <td><%=s1.getBranch() %></td>
                                <td><%=s1.getRollno() %></td>
                                <td><%=s1.getName() %></td>
                                <td><%=s1.getFathername() %></td>
                                <td><%=s1.getGender() %></td>
                             </tr>
					<%
						}
					%>  
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </section>

</body>

</html>