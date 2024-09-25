<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <!-- configure the admin login -->
    
    <%
    	int adm=(int)session.getAttribute("CurrentAdmin");
   		 if(adm == 0){
    			response.sendRedirect("Adminlogin.html");
   				 }
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="./css/style.css">
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
                 <li style="background-image: linear-gradient(to right, rgba(0, 0, 255, 0.663),rgba(42, 213, 42, 0.619));color:white;"><a href="./AdminProfile.jsp">Add New Student</a></li>
                <li><a href="./AdminProfileInsert.jsp">Insert New Result</a></li>
                <li><a href="./AdminProfileShowStudent.jsp">Registered Student</a></li>
                <li><a href="./AdminProfileStudentResult.jsp">All Student Result</a></li>
                <li><a href="./AdminLogoutServlet">Logout</a></li>
            </ul>
        </div>

        <div class="stud-info">
            <div class="sub-info">
                <div>
                    <h3>Add New Student</h3>
                </div>

                <div class="stud-form">
                    <form action="StudentDetailsSaveServlet" method="POST">
                        <div>
                            <label for="course">Course Name :</label>
                            <select name="scourse" id="branch" required>
                                <option selected disabled>Select Course ...</option>
                                <option value="MCA">MCA</option>
                                <option value="Btech">Btech</option>
                            </select>
                        </div>
                        <div>
                            <label for="branch">Select Branch :</label>
                               <select name="sbranch" id="branch" required>
                                <option selected disabled>Select Branch ...</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Mchenical">Mchenical</option>
                                 <option value="Elictrical">Elictrical</option>
                            </select>
                        </div>
                        <div>
                            <label for="roll">Roll Number :</label>
                            <input type="text" id="roll" name="sroll" required>
                        </div>
                        <div>
                            <label for="name">Student Name :</label>
                            <input type="text" id="name" name="sname" required>
                        </div>
                       <div>
                        <label for="fname">Father's Name :</label>
                        <input type="text" id="fname" name="sfname" required>
                       </div>
                       <div>
                        <label for="gen">Select Gender :</label>
                        <input type="radio" value="Male" id="gen" name="gender" required>Male
                        <input type="radio" value="Female" id="gen" name="gender" required>Female
                       </div>
                       <div>
                        <button type="submit" class="btn">Save</button>
                       </div>

                    </form>
                </div>
            </div>
        </div>
        
    </section>
    
</body>
</html>