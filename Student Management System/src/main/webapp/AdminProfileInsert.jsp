<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <li style="background-image: linear-gradient(to right, rgba(0, 0, 255, 0.663),rgba(42, 213, 42, 0.619));color:white;"><a href="./AdminProfileInsert.jsp">Insert New Result</a></li>
                <li><a href="./AdminProfileShowStudent.jsp">Registered Student</a></li>
                <li><a href="./AdminProfileStudentResult.jsp">All Student Result</a></li>
                <li><a href="./AdminLogoutServlet">Logout</a></li>
            </ul>
        </div>

        <div class="stud-info">
            <div class="sub-info">
                <div>
                    <h3>Insert New Result</h3>
                </div>

                <div class="stud-form stud-details">
                    <form action="StudentResultStoreServlet" method="POST">
                        <div>
                            <label for="roll">Roll Number :</label>
                            <input type="text" id="roll" name="sroll">
                        </div>
                        <div>
                            <label for="semister">Select Semester :</label>
                            <select name="ssemister" id="semister" onchange="semisterChange()">
                                <option selected disabled>Select semester ...</option>
                                <option value="First">First</option>
                                <option value="Second">Second</option>
                                <option value="Third">Third</option>
                                <option value="Fourth">Fourth</option>
                            </select>
                            <butto class="btn" onclick="reloadPage()">Clear</butto>
                        </div>
                        <div id="s1">
                            
                            
                        </div>
                        <div id="s2">
                        
                        
                        </div>
                        <div id="s3">
                        
                        
                        </div>
                        <div id="s4">
                        
                        
                        </div>
                        <div id="s5">
                        
                        
                        </div>
                        <div id="s6">
                            
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </section>

</body>

</html>