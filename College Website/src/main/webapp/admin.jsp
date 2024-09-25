<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.clgw.javabeans.Message" %>
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

    <!--admin-->
    <section>
        <div class="container mt-4">
            <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card login">
                            <div class="card-header header-background text-white text-center">
                                <br>
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Admin</p>
                            </div>
                            <!-- jsp code -->
                            <%
                            	Message A=(Message)session.getAttribute("AdminMessage");
                            	if(A!=null)
                            	{
                            %>
                            <div class="alert <%=A.getCssClass() %>" role="alert">
                              	<%=A.getContent() %>
                              </div>
                              <%
								        session.removeAttribute("AdminMessage");
                                       }
                              %>
                            <div class="card-body">
                                <form action="AdminLoginServlet" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" name="Aemail" required class="form-control" id="exampleInputEmail1"
                                            aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
                                        </div>
                                    </div>
                    
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" name="Apassword" required class="form-control" id="exampleInputPassword1">
                                    </div>
                    
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
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