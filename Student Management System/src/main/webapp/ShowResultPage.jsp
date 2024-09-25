<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.som.helper.ConnectionProvider" %>
<%@page import="com.som.dao.StudentDao" %>
<%@page import="com.som.javabeans.Student" %>
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
    
    <style>
    	
    	@media print {
    		
    		body section a,body .sem-change,body #sem4 {
    			display:none;
    		}
    		
    		body .result table{
    			color:black;
    			border:2px solid black;
    		}
    		body .result table tbody{
    			color:black;
    			border:2px solid black;
    		}
    	}
    </style>

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
        
			<a href="resultsearch.html"  class="btn">Back</a>
			
        <div class="result">
            <table border="1">
            <%
            StudentDao sdao=new StudentDao(ConnectionProvider.getConnection());
            long roll=Long.parseLong( request.getParameter("sroll"));
            Student stu=sdao.getStudent(roll);
            %>
                <tr>
                    <td>INSTITUATION NAME : IGIT</td>
                    <td>COURSE NAME : <%=stu.getCoursename() %></td>
                    <td>BRANCH NAME : <%=stu.getBranch() %></td>
                    <td>ROLL NO : <%=stu.getRollno() %></td>
                </tr>
                <tr>
                    <td>NAME : <%=stu.getName() %></td>
                    <td>FATHER NAME : <%=stu.getFathername() %></td>
                    <td>GENDER : <%=stu.getGender() %></td>
                    <td><img src="./media/print.png" alt="" title="print screen"  id ="print" onclick="printResult()" target="_blank" style="cursor:pointer;"></td>
                </tr>
            </table>
        </div>

		<br>
		
			 <div class="sem-change">

                <label for="semister">Select Semester :</label>
                <select name="ssemister" id="semister" onchange="showSemisterResult()">
                    <option selected disabled>Select semester ...</option>
                    <option value="First">First</option>
                    <option value="Second">Second</option>
                    <option value="Third">Third</option>
                    <option value="Fourth">Fourth</option>
                </select>
				<button class="btn" onclick="reloadPage()">Clear</button>
                </div>

        <div class="result" id="sem1" style="display:none">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Course</th>
                        <th rowspan="2">Type</th>
                        <th rowspan="2">Full Mark</th>
                        <th rowspan="2">Passing Mark</th>
                        <th rowspan="2">Obtained Mark</th>
                    </tr>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody class="mark">
                <%
                ResultDao rdao1=new ResultDao(ConnectionProvider.getConnection());
                Result res1=new Result();
                res1.setSemister("First");
                res1=rdao1.getResult(roll, res1.getSemister());
                %>
                    <tr>
                        <td>MCAPQS1P1</td>
                        <td>C Programming</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res1.getSub1()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS1P2</td>
                        <td>Coa</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res1.getSub2()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS1P3</td>
                        <td>Discreate Math</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res1.getSub3()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS1P4</td>
                        <td>English</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res1.getSub4()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS1P5</td>
                        <td>Economics & Accounting</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res1.getSub5()%></td>
                    </tr>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">Total Mark</td>
                        <td>500</td>
                        <td>180</td>
                        <td><%=res1.getTotal() %></td>
                    </tr>
                    <tr>
                        <td colspan="3">Cgpa</td>
                        <td colspan="3"><%=res1.getCgpa() %></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        
        
          <div class="result" id="sem2" style="display:none">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Course</th>
                        <th rowspan="2">Type</th>
                        <th rowspan="2">Full Mark</th>
                        <th rowspan="2">Passing Mark</th>
                        <th rowspan="2">Obtained Mark</th>
                    </tr>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody class="mark">
                <%
                ResultDao rdao=new ResultDao(ConnectionProvider.getConnection());
                Result res=new Result();
                res.setSemister("Second");
                res=rdao.getResult(roll, res.getSemister());
                %>
                    <tr>
                        <td>MCAPQS2P1</td>
                        <td>C Programming</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res.getSub1()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS2P2</td>
                        <td>Coa</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res.getSub2()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS2P3</td>
                        <td>Discreate Math</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res.getSub3()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS2P4</td>
                        <td>English</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res.getSub4()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS2P5</td>
                        <td>Economics & Accounting</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res.getSub5()%></td>
                    </tr>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">Total Mark</td>
                        <td>500</td>
                        <td>180</td>
                        <td><%=res.getTotal() %></td>
                    </tr>
                    <tr>
                        <td colspan="3">Cgpa</td>
                        <td colspan="3"><%=res.getCgpa() %></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        
          <div class="result" id="sem3" style="display:none">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Course</th>
                        <th rowspan="2">Type</th>
                        <th rowspan="2">Full Mark</th>
                        <th rowspan="2">Passing Mark</th>
                        <th rowspan="2">Obtained Mark</th>
                    </tr>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody class="mark">
                <%
                ResultDao rdao2=new ResultDao(ConnectionProvider.getConnection());
                Result res2=new Result();
                res2.setSemister("Third");
                res2=rdao2.getResult(roll, res2.getSemister());
                %>
                    <tr>
                        <td>MCAPQS3P1</td>
                        <td>C Programming</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res2.getSub1()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS3P2</td>
                        <td>Coa</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res2.getSub2()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS3P3</td>
                        <td>Discreate Math</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res2.getSub3()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS3P4</td>
                        <td>English</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res2.getSub4()%></td>
                    </tr>
                     <tr>
                        <td>MCAPQS3P5</td>
                        <td>Economics & Accounting</td>
                        <td>Theory</td>
                        <td>500</td>
                        <td>40</td>
                        <td><%=res2.getSub5()%></td>
                    </tr>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">Total Mark</td>
                        <td>500</td>
                        <td>180</td>
                        <td><%=res2.getTotal() %></td>
                    </tr>
                    <tr>
                        <td colspan="3">Cgpa</td>
                        <td colspan="3"><%=res2.getCgpa() %></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        
          <div class="result" id="sem4">
           
        </div>

       
            
       

    </section>

</body>

</html>