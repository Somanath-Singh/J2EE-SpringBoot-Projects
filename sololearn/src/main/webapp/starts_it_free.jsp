<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<!-- if any error then it open error page -->
<%@page errorPage="error-page.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Start_its_Free</title>

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

	<div class="container-fluid p-0 m-0 text-center">
		<div class="jumbotron primary-background text-white  page-background">
			<div class="container w3-col 112 w3-center">
				<h1>
					<span class="fa fa-500px">Born to Code</span>
				</h1>
				<h1>
					<span class="fa">With a Best Tutorials Site</span>
				</h1>
				<br> <br> <a href="registeration-page.jsp"
					class="btn btn-outline-light btn-lg "> <span
					class="fa fa-code "></span> Not Sure Where To Begin
				</a> <a href="login-page.jsp" class="btn btn-outline-light btn-lg hero_btn">
					<span class="fa fa-user-circle-o fa-spin"></span> Login
				</a> <br>
				<br>
				<br>
			</div>
		</div>
	</div>

	<br>
	
	<%@include file="content.jsp"%>

	<br>
	<br>

	<!-- footer -->
	<%@include file="footer.jsp"%>

	<!-- java Script -->

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