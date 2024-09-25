<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.clgw.javabeans.Student" %>
<%@page import="com.clgw.dao.StudentDao" %>
<%@page import="com.clgw.helper.ConnectionProvider" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap');
    </style>
</head>
<body>
    
    <!--     navbar -->
<%@include file="navbar.jsp" %>

    <!--Student page-->
    
    <div class="container mt-5">
    
        <div class="row justify-content-around">
        
        <%
        	StudentDao sd=new StudentDao(ConnectionProvider.getConnection());
        	List<Student> stu=sd.getAllStudentName();
        	 for(Student s:stu)
             {
        %>
            <div class="col-lg-5 col-6">
            
                <div class="card mb-3" style="width:100%">
                    <div class="row g-0">
                        <div class="col-md-4 text-center" >
                            <img src="./media/studentdefault.png" class="img-fluid student-img" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body mt-4">
                                <h3 class="card-title stu-name text-center"><%=s.getName() %></h3>
                            </div>
                        </div>
                    </div>
                </div>
            
            </div>
            
            <%
             }
            %>
            
        
        </div>
    </div>
    


<!--     footer section -->
<%@include file="footer.jsp" %>

    
      <script
      src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5eb391e4c9.js" crossorigin="anonymous"></script>
    
</body>
</html>