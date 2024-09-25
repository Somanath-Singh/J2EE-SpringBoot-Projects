<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-back">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs">  SoloLearn </span> </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
         <li class="nav-item">
          <a class="nav-link" href="#"  data-bs-toggle="modal" data-bs-target="#contactsection"><span class="fa fa-address-book">  Contacts</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login-page.jsp"><span class="fa fa-child">  Login</span></a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="registeration-page.jsp"><span class="fa fa-child">  Register</span></a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="modal fade" id="contactsection" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Connect With Us .........</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Please login to connect with us .</p>
					<a href="login-page.jsp" type="button" class="btn btn-primary hero_btn">login</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>