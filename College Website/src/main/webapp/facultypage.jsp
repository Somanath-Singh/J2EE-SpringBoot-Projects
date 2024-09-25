<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.clgw.javabeans.Faculty" %>
<%@page import="com.clgw.dao.FacultyDao" %>
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

    <!--faculty page-->
    
   <div class="container mt-5">

        <div class="row justify-content-evenly">

			   <%
        	FacultyDao fd=new FacultyDao(ConnectionProvider.getConnection());
        	List<Faculty> fac=fd. getAllFacultyDetails();
        	 for(Faculty f:fac)
             {
           %>
        
                <div class="col-lg-5 col-10">

                    <div class="card mb-3 text-center"  style="width:100%" >
                        <div class="row g-0 ">
                            <div class="col-md-4">
                                <img src="./picture/<%=f.getProfile() %>" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h4 class="card-title"><%=f.getName() %></h4>
                                    <h5 class="card-text"><small class="text-muted"><%=f.getEmail() %></small></h5>
                                    <h5 class="card-text"><%=f.getAbout()%></h5>
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