<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error page</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap');
    </style>
    
</head>
<body>


<div class="container text-center">
   <img alt="Image not supported" src="media/error.png" class="img-fluid" >
   <h3 class="display-3">Sorry !  something went wrong</h3>
   <%= exception %>
   <a href="admin.jsp"><button class="btn primary-background btn-lg text-white mt-3">Admin login</button></a>
</div>

    
</body>
</html>