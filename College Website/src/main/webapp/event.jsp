<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.clgw.javabeans.PostNews" %>
<%@page import="com.clgw.dao.NewsDao" %>
 <%@page import="com.clgw.javabeans.Event" %>
<%@page import="com.clgw.dao.EventDao" %>
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
    <link rel="stylesheet" href="./style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap');
    </style>
</head>

<body>

    <!--     navbar -->
<%@include file="navbar.jsp" %>


   

    <section>
        <div class="container mt-5">
            <div class="row justify-content-center">
                  <div class="col-lg-12 event">
                    <p class="header-background">Uppcomming events</p>
                     <ul>
                      <!-- jsp code -->
                        
                        <%
                        
                        EventDao e=new EventDao(ConnectionProvider.getConnection());
                        List<Event> event=e.getAllEvent();
                        for(Event e1:event)
                        {
                        %>
                        
                            <li> <span class="date header-background">  <%=e1.getEdates()%> </span>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;  <%=e1.getEdescription() %>  </li>
                            
                        <%
                          }
                        %>
                        </ul>
                </div>
            </div>
        </div>
    </section>


<!--     footer section -->
<%@include file="footer.jsp" %>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5eb391e4c9.js" crossorigin="anonymous"></script>
</body>

</html>