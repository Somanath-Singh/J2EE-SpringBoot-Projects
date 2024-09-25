<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <header class="section">
        <div class="nav">
            <div>
                <img src="./media/logo1.png" alt="" width="50px">
            </div>
            <div>
                <ul>
                    <li><a href="./index.jsp">Home</a></li>
                    <li><a href="./Adminlogin.html">Admin</a></li>
                </ul>
            </div>
        </div>
    
        <p>Welcome to Admin panel ..</p>
        <hr>
        
        <div class="admin">
            <fieldset>
                <legend><img src="./media/studentdefault.png" alt=""></legend>
                <%
                  String msg=request.getParameter("msg");
              	  if("InValid".equals(msg)){
                	%>
                		<center><font color="red" size="5">Invalid Details ! Try again ..</font></center>
                	<%
                		}
                	%>
                <h3>Admin Login</h3><br>
                <form action="AdminLoginServlet" method="POST">
                    <label for="username">UserName</label><br>
                    <input type="text" id="username" placeholder="Enter Username" name="name"><br><br>
                    <label for="username">Password</label><br>
                    <input type="text" id="username" placeholder="Enter Password" name="password"><br><br>
                    <button type="submit">Login</button>
                </form>
            </fieldset>
        </div>
        
    </header>

</body>
</html>