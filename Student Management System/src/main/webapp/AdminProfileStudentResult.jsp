<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.som.helper.ConnectionProvider" %>
<%@page import="com.som.dao.ResultDao" %>
<%@page import="com.som.javabeans.Result" %>
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
                <li><a href="./AdminProfileShowStudent.jsp">Registered Student</a></li>
                <li style="background-image: linear-gradient(to right, rgba(0, 0, 255, 0.663),rgba(42, 213, 42, 0.619));color:white;"><a href="./AdminProfileStudentResult.jsp">All Student Result</a></li>
                <li><a href="./AdminLogoutServlet">Logout</a></li>
            </ul>
        </div>

        <div class="stud-info">
            <div class="sub-info  register-stud">
                <div>
                    <h3>All Student Result</h3>
                </div>
				
				<div>

                <label for="semister">Select Semester :</label>
                <select name="ssemister" id="semister" onchange="resultSemisterChange()">
                    <option selected disabled>Select semester ...</option>
                    <option value="First">First</option>
                    <option value="Second">Second</option>
                    <option value="Third">Third</option>
                    <option value="Fourth">Fourth</option>
                </select>
                <butto class="btn" onclick="reloadPage()">Clear</butto>

                </div>

                <div id="result1" style="display: none;">
                    <table border="1" >
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>Semester</th>
                                <th>C Programming</th>
                                <th>Coa</th>
                                <th>Discreate Math</th>
                                <th>English</th>
                                <th>Economics & Accounting</th>
                                <th>Total</th>
                                <th>Cgpa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
					ResultDao sdao=new ResultDao(ConnectionProvider.getConnection());
                     Result r=new Result();
                     r.setSemister("First");
					List<Result> result=sdao.getAllResult(r.getSemister());
					for(Result r1:result){
					%>
                            <tr>
                                <td><%=r1.getRoll() %></td>
                                <td><%=r1.getSemister() %></td>
                                <td><%=r1.getSub1() %></td>
                                <td><%=r1.getSub2() %></td>
                                <td><%=r1.getSub3() %></td>
                                <td><%=r1.getSub4() %></td>
                                <td><%=r1.getSub5() %></td>
                                <td><%=r1.getTotal() %></td>
                                <td><%=r1.getCgpa() %></td>
                            </tr>
                            <%
								}
							%>
                        </tbody>
                    </table>
                </div>
                
                <div id="result2" style="display: none;">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>Semester</th>
                                <th>C++ Programming</th>
                                <th>Operating System</th>
                                <th>DBMS</th>
                                <th>DADS</th>
                                <th>FLARTS</th>
                                <th>Total</th>
                                <th>Cgpa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
					ResultDao sdao2=new ResultDao(ConnectionProvider.getConnection());
                     Result r2=new Result();
                     r2.setSemister("Second");
					List<Result> result2=sdao2.getAllResult(r2.getSemister());
					for(Result r1:result2){
					%>
                            <tr>
                                <td><%=r1.getRoll() %></td>
                                <td><%=r1.getSemister() %></td>
                                <td><%=r1.getSub1() %></td>
                                <td><%=r1.getSub2() %></td>
                                <td><%=r1.getSub3() %></td>
                                <td><%=r1.getSub4() %></td>
                                <td><%=r1.getSub5() %></td>
                                <td><%=r1.getTotal() %></td>
                                <td><%=r1.getCgpa() %></td>
                            </tr>
                            <%
								}
							%>
                        </tbody>
                    </table>
                </div>
                
                <div id="result3"  style="display: none;">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Roll No</th>
                                <th>Semester</th>
                               <th>Java Programming</th>
                                <th>DCCN</th>
                                <th>Compile Design</th>
                                <th>Internet Of Things</th>
                                <th>Data Warehouse</th>
                                <th>Total</th>
                                <th>Cgpa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
					ResultDao sdao3=new ResultDao(ConnectionProvider.getConnection());
                     Result r3=new Result();
                     r3.setSemister("Third");
					List<Result> result3=sdao3.getAllResult(r3.getSemister());
					for(Result r1:result3){
					%>
                            <tr>
                                <td><%=r1.getRoll() %></td>
                                <td><%=r1.getSemister() %></td>
                                <td><%=r1.getSub1() %></td>
                                <td><%=r1.getSub2() %></td>
                                <td><%=r1.getSub3() %></td>
                                <td><%=r1.getSub4() %></td>
                                <td><%=r1.getSub5() %></td>
                                <td><%=r1.getTotal() %></td>
                                <td><%=r1.getCgpa() %></td>
                            </tr>
                            <%
								}
							%>
                        </tbody>
                    </table>
                </div>
                
                <div id="result4">
                   
                </div>
                
            </div>
        </div>

    </section>

</body>

</html>