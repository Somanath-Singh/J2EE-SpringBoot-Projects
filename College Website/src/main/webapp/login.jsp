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

    <!--Student login-->
    <section>
        <div class="container mt-4">
            <div class="row justify-content-evenly">
                    <div class="col-lg-4">
                            <div class="card login">
                                <div class="card-header header-background text-white text-center">
                                    <br>
                                    <span class="fa fa-user-plus fa-3x"></span>
                                    <p>Student Login</p>
                                </div>
                              <!-- jsp code -->
                              <%
                              	Message m=(Message)session.getAttribute("message");
                              if(m!=null)
                                 {
                              %>
                              <div class="alert <%=m.getCssClass() %>" role="alert">
                              	<%=m.getContent() %>
                              </div>
                              <%
								        session.removeAttribute("message");
                                       }
                              %>
                              
                                <div class="card-body">
                                    <form action="LoginServlet" method="POST">
                                        <div class="mb-3">
                                           <label for="exampleInputEmail1" class="form-label">Email address</label>
                                           <input type="email" name="email" required class="form-control" id="exampleInputEmail1                                                    aria-describedby="emailHelp">
                                           <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                            
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Password</label>
                                            <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
                                        </div>
                            
                                        <div class="container text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="card login">
                            <div class="card-header header-background text-white text-center">
                                <br>
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Faculty Login</p>
                            </div>
                             <!-- jsp code -->
                              <%
                              	Message n=(Message)session.getAttribute("msg");
                              if(n!=null)
                                 {
                              %>
                              <div class="alert <%=n.getCssClass() %>" role="alert">
                              	<%=n.getContent() %>
                              </div>
                              <%
								        session.removeAttribute("msg");
                                       }
                              %>
                            <div class="card-body">
                                <form  action="FacultyLoginServlet" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input type="email" name="femail" required class="form-control"
                                            id="exampleInputEmail1"  aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
                                        </div>
                                    </div>
                    
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" name="fpassword" required class="form-control" id="exampleInputPassword1">
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