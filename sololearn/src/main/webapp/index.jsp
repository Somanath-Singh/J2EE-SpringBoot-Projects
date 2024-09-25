<%@page import="com.nt.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<!-- import the database package to access it -->
<%@page import="java.sql.*"%>

<!-- if any error then it open error page -->
<%@page errorPage="error-page.jsp"%>

<!DOCTYPE html>
<html>


<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="apple-touch-icon" sizes="180x180"
	href="./favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="./favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="./favicon/favicon-16x16.png">
<link rel="manifest" href="./favicon/site.webmanifest">
<link rel="mask-icon" href="./favicon/safari-pinned-tab.svg"
	color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">

</head>

<body>

	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<!-- banner -->
	<div class="container-fluid p-0 m-0">


		<div class="jumbotron primary-background text-white banner-background">

			<div class="container content-padding">

				<h3 class="Display-3">Welcome to TechBlog</h3>
				<p>Welcome to technical blog, World .A programming language is a
					system of notation for writing computer programs.[1] Most
					programming languages are text-based formal languages, but they may
					also be graphical. They are a kind of computer language.</p>

				<p>The description of a programming language is usually split
					into the two components of syntax (form) and semantics (meaning),
					which are usually defined by a formal language.</p>


				<a class="btn btn-outline-light btn-lg hero_btn"
					href="starts_it_free.jsp"><span class="fa fa-drivers-license"></span>
					Start ! its free</a> <a class="btn btn-outline-light btn-lg"
					href="login-page.jsp"><span class="fa fa-child fa-spin"></span>
					Login</a>
			</div>

		</div>


	</div>



	<!-- card -->


	<br>

	<%@include file="content.jsp"%>

	<br>
	<br>

	<!-- footer -->
	<%@include file="footer.jsp"%>


	<!-- Java Script -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script src="js/logic.js" type="text/javascript"></script>



</body>

</html>

<!-- Checking the database is connected successfully -->
<%-- <h1>Hello world</h1>
                <% Connection con=ConnectionProvider.getConnection(); %>
                    <h1>
                        <%=con %>
                    </h1> --%>