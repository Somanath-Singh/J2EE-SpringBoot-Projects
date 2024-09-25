<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.clgw.javabeans.BlogPost" %>
<%@page import="com.clgw.dao.PostDao" %>
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

    <!-- blog -->


 <div class="container" id="post-container">
 
        <div class="text-center my-5">
            <h2>Blog Posts</h2>
            <hr>
        </div>
        
        <div class="row">
        
        
            <!-- loading-->
            
          <%
          
          PostDao d=new PostDao(ConnectionProvider.getConnection());
          List<BlogPost> post=d.getAllPost();
          for(BlogPost p:post)
          {
        %>
        	  
        	  <!-- wright the post content in between this -->
        	    <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="card mb-5 shadow-sm  blog">
                    <img src="./post-pics/<%=p.getPpic() %>" class="img-fluid">
                    <div class="card-body">
                        <div class="card-title">
                            <h2><%=p.getPtitle() %></h2>
                        </div>
                        <div class="card-text">
                         <%=p.getPcontent() %>
                        </div>
                    </div>
                </div>
            </div>
        	  
        <%
          	}
         %>
            
            
        </div>
    </div>
    <!-- blog end -->

<!--     footer section -->
<%@include file="footer.jsp" %>
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5eb391e4c9.js" crossorigin="anonymous"></script>
    
  
</body>
</html>