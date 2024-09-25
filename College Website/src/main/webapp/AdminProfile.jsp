<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.clgw.javabeans.Admin"%>
<%@page import="com.clgw.javabeans.Student"%>
<%@page import="com.clgw.javabeans.Message"%>
<%@page import="com.clgw.javabeans.PostCategories"%>
<%@page import="com.clgw.dao.PostDao"%>
<%@page import="com.clgw.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!-- if any error then it open error page -->
<%@page errorPage="error-page.jsp"%>

<!-- 	configure the Admin login -->
<%
Admin adm = (Admin) session.getAttribute("currentUserAdmin");
if (adm == null) {
	response.sendRedirect("admin.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<link rel="stylesheet" href="./css/profile.css" />
<link rel="stylesheet" href="./css/style.css" />

<script src="./js/script.js"></script>

<title>Admin Dashboard</title>

</head>

<body>

	<!-- message shown in webpage -->
	<%
	Message m = (Message) session.getAttribute("editmessage");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%> " role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("editmessage");
	}
	%>


	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-white" id="sidebar-wrapper">
			<div
				class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom">
				<i class="fa-brands fa-pied-piper-alt fa-beat fa-xl"
					style="color: #000e75;"></i>&nbsp;&nbsp;IGIT
			</div>
			<div class="list-group list-group-flush my-3">
				<a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text active"><i
					class="fa-solid fa-snowflake fa-flip fa-xl" style="color: #ff0a74;"></i>&nbsp;&nbsp;Dashboard</a>
				<a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#Student-Register"><i
					class="fa-solid fa-registered  fa-lg" style="color: #6d2ffe;"></i>&nbsp;&nbsp;Register
					Students</a> <a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#Faculty-Register"><i
					class="fa-solid fa-registered  fa-lg" style="color: #fe2fa8;"></i>&nbsp;&nbsp;Register
					Faculty</a> <a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#Staff-Register"><i
					class="fa-solid fa-registered  fa-lg" style="color: #66fe2f;"></i>&nbsp;&nbsp;Register
					Staff</a> <a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#addPostModel"><i
					class="fa-sharp fa-solid fa-envelopes-bulk  fa-lg"
					style="color: #ff8800;"></i>&nbsp;&nbsp;Add Post</a> <a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#profile-model-News"><i
					class="fa-solid fa-newspaper fa-lg" style="color: #0033ff;"></i>&nbsp;&nbsp;Add
					News</a> <a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#profile-model-Event"><i
					class="fa-solid fa-calendar-check fa-lg" style="color: #06ccfe;"></i>&nbsp;&nbsp;Add
					Event</a> <a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#profile-model-Student-Msg"><i
					class="fas fa-map-marker-alt me-2"></i>Message to Student</a> <a
					href="#"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
					data-bs-toggle="modal" data-bs-target="#profile-model-Faculty-Msg"><i
					class="fas fa-map-marker-alt me-2"></i>Message to Faculty</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper"
			style="background-image: linear-gradient(to left, rgba(0, 81, 195, 0.776), rgba(141, 203, 139, 0.753));">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">

				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h2 class="fs-2 m-0">Dashboard</h2>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle second-text fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <img
								src="./picture/<%=adm.getAprofile()%>" class="img-fluid"
								style="border-radius: 60%; max-width: 32px">&nbsp;&nbsp;<%=adm.getName()%></a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item fw-bold" href="#"
									data-bs-toggle="modal" data-bs-target="#profile-model">Profile</a></li>
								<li><a class="dropdown-item text-danger fw-bold"
									href="AdminLogoutServlet"><i class="fas fa-power-off me-2"></i>Logout</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>

			<div class="container-fluid px-4">
				<div class="row g-3 my-2 justify-content-center">

					<div class="col-md-4">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2">720</h3>
								<p class="fs-5">Students</p>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2">4920</h3>
								<p class="fs-5">Faculty</p>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div
							class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
							<div>
								<h3 class="fs-2">3899</h3>
								<p class="fs-5">Staffs</p>
							</div>
						</div>
					</div>

				</div>

				<div class="row my-5">
					<h3 class="fs-4 mb-3">Recent Orders</h3>
					<div class="col">


						<div class="accordian" id="details">
							<div class="accordian-item">
								<div class="accordian-header">
									<button class="btn  accordian-background w-100"
										data-bs-toggle="collapse" data-bs-target="#student">
										<h3 class="text-white">Student</h3>
									</button>
								</div>
								<div id="student"
									class="accordian-body accordian-collapse collapse show bg-white"
									data-bs-parent="#details">

									<form action="showStudentDetails" method="POST">

										<div class="row justify-content-center p-5">

											<h4 class="text-center p-3">Select student details :</h4>
											<div class="col-lg-5 mb-2">

												<select class="form-select form-select-sm"
													aria-label=".form-select-sm example" name="branch">
													<option selected disabled>Select branch ....</option>
													<option value="BTECH">Btech</option>
													<option value="MCA">Mca</option>
													<option value="MTECH">Mtech</option>
													<option value="PHD">Phd</option>
												</select>

											</div>

											<br>

											<div class="col-lg-5 mb-2">

												<select class="form-select form-select-sm"
													aria-label=".form-select-sm example" name="batch" required>
													<option selected disabled>Select batch ....</option>
													<option value="39">39</option>
													<option value="40">40</option>
													<option value="41">41</option>
													<option value="42">42</option>
													<option value="43">43</option>
													<option value="44">44</option>
													<option value="45">45</option>
													<option value="46">46</option>
													<option value="47">47</option>
													<option value="48">48</option>
													<option value="49">49</option>
													<option value="50">50</option>
												</select>

											</div>

										</div>

										<div class="row justify-content-center p-2">
											<div class="col-lg-3 col-3 text-center">
												<input type="submit" class="btn btn-outline-warning"
													name="s1" value="show">
											</div>
										</div>

									</form>
									<!-- form -->
								
<%-- <%-- 									<% --%> 
<!-- // 									//read the request attribute value -->
<!-- // 									List<Student> stulist = (List<Student>)request.getSession().getAttribute("studentinfo"); -->
<!-- // 									//read request param value -->
<!-- // 									String branch = request.getParameter("branch"); -->
<%-- 									%> --%>

<!-- 									Display the details in the form of html table -->

<!-- 									<h1 style="color: red; text-align: center"> -->
<!-- 										The Employees Belonging to -->
<%-- 										<%=branch%> --%>
<!-- 										are -->
<!-- 									</h1> -->

<!-- 									<table border="1" bgcolor="cyan" align="center"> -->
<!-- 										<tr> -->
<!-- 											<th>Redg no</th> -->
<!-- 											<th>Name</th> -->
<!-- 											<th>Email</th> -->
<!-- 											<th>Gender</th> -->
<!-- 											<th>Batch</th> -->
<!-- 											<th>Profile</th> -->
<!-- 										</tr> -->
<%-- 										<% --%>
<!-- // 										for (Student stu : stulist) { -->
<%-- 										%> --%>
<!-- 										<tr> -->
<%-- 											<td><%=stu.getRedgno()%></td> --%>
<%-- 											<td><%=stu.getName()%></td> --%>
<%-- 											<td><%=stu.getEmail()%></td> --%>
<%-- 											<td><%=stu.getGender()%></td> --%>
<%-- 											<td><%=stu.getBatch()%></td> --%>
<%-- 											<td><img src="./picture/<%=stu.getProfile()%>" --%>
<!-- 												class="img-fluid" -->
<!-- 												style="border-radius: 60%; max-width: 32px"></td> -->
<!-- 										</tr> -->

<%-- 										<% --%>

<%-- 										%> --%>
<!-- 									</table> -->
									

									
								</div>
								<!-- body -->


							</div>
							<!--item -->

							<br>

							<div class="accordian-item">
								<div class="accordian-header">
									<button class="btn  accordian-background w-100"
										data-bs-toggle="collapse" data-bs-target="#faculty">
										<h3 class="text-white">Faculty</h3>
									</button>
								</div>
								<div id="faculty"
									class="accordian-body accordian-collapse collapse show bg-white"
									data-bs-parent="#details" style="background-color: aqua;">



								</div>
							</div>

							<br>

							<div class="accordian-item">
								<div class="accordian-header">
									<button class="btn   accordian-background w-100"
										data-bs-toggle="collapse" data-bs-target="#staff">
										<h3 class="text-white">Staffs</h3>
									</button>
								</div>
								<div id="staff"
									class="accordian-body accordian-collapse collapse show bg-white"
									data-bs-parent="#details"></div>
							</div>


						</div>



					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->



	<!-- profile model -->

	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profile-model">
      Launch demo modal
    </button> -->

	<!-- Modal -->
	<div class="modal fade" id="profile-model" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  model-background  text-white text-center">
					<h5 class="modal-title text-center" id="exampleModalLabel">Admin</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="./picture/<%=adm.getAprofile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 110px">
						<h5 class="modal-title mt-3" id="exampleModalLabel">
							<%=adm.getName()%></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th>ID</th>
										<td><%=adm.getId()%></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><%=adm.getEmail()%></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><%=adm.getGender()%></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><%=adm.getAbout()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->
						<div id="admin-profile-edit" style="display: none;">
							<br>
							<h6 class="nt-2" style="color: red;">Please edit carefully</h6>
							<form action="AdminEditServlet" method="POST"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th>ID</th>
										<td><%=adm.getId()%></td>
									</tr>
									<tr>
										<th>Name</th>
										<td><input type="text" class="form-control"
											name="admin-name" value="<%=adm.getName()%>" required></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><input type="text" class="form-control"
											name="admin-gender" value="<%=adm.getGender()%>" required>
										</td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" class="form-control"
											name="admin-email" value="<%=adm.getEmail()%>" required></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" class="form-control"
											name="admin-password" value="<%=adm.getPassword()%>" required></td>
									</tr>
									<tr>
										<th>Profile Pic</th>
										<td><input type="file" class="form-control"
											name="admin-image" required></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><textarea class="form-control" name="admin-about"
												rows="3" required><%=adm.getAbout()%></textarea></td>
									</tr>

								</table>

								<div class="container ">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>

						</div>

					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="Aedit-profile-btn" type="button"
						class="btn btn-primary">Edit</button>
				</div>

			</div>
		</div>
	</div>



	<!-- 	student register -->


	<div class="modal fade" id="Student-Register" tabindex="-1"
		aria-labelledby="exampleModalLabelRegisterStudent" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  text-white text-center">
					<h5 class="modal-title text-center text-dark"
						id="exampleModalLabelRegisterStudent">Student</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container">

						<div class="col-lg-12 ">

							<div class="card">

								<div class="card-header text-center model-background text-white">
									<span class="fa  fa-3x fa-user-circle"></span> <br>
									Register here
								</div>
								<div class="card-body">

									<form id="stu-reg-form" action="StudentRegisterServlet"
										method="POST">

										<div class="mb-3">
											<label for="stu-redg" class="form-label">Registration
												no</label> <input type="text" name="stu-redgno" class="form-control"
												id="stu-redg" placeholder="Enter registration no" required>
										</div>

										<div class="mb-3">
											<label for="stu-name" class="form-label">User name</label> <input
												type="text" name="stu-name" class="form-control"
												id="stu-name" placeholder="Enter name" required>
										</div>

										<div class="mb-3">
											<label for="exampleInputStudentEmail" class="form-label">Email
												address</label> <input type="email" name="stu-email"
												class="form-control" id="exampleInputStudentEmail"
												aria-describedby="emailHelp" required>
											<div id="emailHelp" class="form-text">We'll never share
												your email with anyone else.</div>
										</div>

										<div class="mb-3">
											<label for="exampleInputStudentPassword" class="form-label">Password</label>
											<input type="password" name="stu-pasw" class="form-control"
												id="exampleInputStudentPassword" required>
										</div>

										<div class="mb-3">
											<label for="gender" class="form-label">Select Gender</label>
											<br> <input type="radio" id="gender" name="stu-gender"
												value="Male" required>male <input type="radio"
												id="gender" name="stu-gender" value="Female" required>female
										</div>

										<div class="mb-3">
											<label for="gender" class="form-label">Select Branch</label>
											<br> <input type="radio" id="branch" name="stu-branch"
												value="Mca" required>Mca <input type="radio"
												id="branch" name="stu-branch" value="Btech" required>Btech
											<input type="radio" id="branch" name="stu-branch"
												value="Mtech" required>Mtech
										</div>
										<div class="mb-3">
											<select class="form-select form-select-sm"
												aria-label=".form-select-sm example" name="branch" required>
												<option selected disabled>Select batch ....</option>
												<option value="39">39</option>
												<option value="40">40</option>
												<option value="41">41</option>
												<option value="42">42</option>
												<option value="43">43</option>
												<option value="44">44</option>
												<option value="45">45</option>
												<option value="46">46</option>
												<option value="47">47</option>
												<option value="48">48</option>
												<option value="49">49</option>
												<option value="50">50</option>
											</select>
										</div>
										<div class="mb-3 form-check">
											<input type="checkbox" name="stu-check"
												class="form-check-input" id="exampleCheckStudent"
												value="hel"> <label class="form-check-label"
												for="exampleCheckStudent">agree terms and condition</label>
										</div>


										<br>
										<div class="container text-center" id="loader"
											style="display: none">
											<span class="fa fa-refresh  fa-spin fa-4x"></span>
											<h4>Please wait ...</h4>
										</div>

										<button id="stu-submit-btn" type="submit"
											class="btn btn-primary">Submit</button>

									</form>

								</div>
								<div class="card-footer"></div>

							</div>

						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>





	<!-- 	Faculty register -->


	<div class="modal fade" id="Faculty-Register" tabindex="-1"
		aria-labelledby="exampleModalLabelRegisterFaculty" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  text-white text-center">
					<h5 class="modal-title text-center text-dark"
						id="exampleModalLabelRegisterFaculty">Faculty</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container">

						<div class="col-lg-12 ">

							<div class="card">

								<div class="card-header text-center model-background text-white">
									<span class="fa  fa-3x fa-user-circle"></span> <br>
									Register here
								</div>
								<div class="card-body">
									<form id="fac-reg-form" action="FacultyRegisterServlet"
										method="POST">

										<div class="mb-3">
											<label for="fac-name" class="form-label">User name</label> <input
												type="text" name="fac-name" class="form-control"
												id="fac-name" placeholder="Enter name" required>
										</div>

										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Email
												address</label> <input type="email" name="fac-email"
												class="form-control" id="exampleInputEmail1"
												aria-describedby="emailHelp" required>
											<div id="emailHelp" class="form-text">We'll never share
												your email with anyone else.</div>
										</div>

										<div class="mb-3">
											<label for="exampleInputPassword1" class="form-label">Password</label>
											<input type="password" name="fac-pasw" class="form-control"
												id="exampleInputPassword1" required>
										</div>

										<div class="mb-3">
											<label for="gender" class="form-label">Select Gender</label>
											<br> <input type="radio" id="gender" name="fac-gender"
												value="Male" required>male <input type="radio"
												id="gender" name="fac-gender" value="Female" required>female
										</div>

										<div class="mb-3">
											<label for="fac-sub" class="form-label">Faculty
												subject</label> <input type="text" name="fac-sub"
												class="form-control" id="fac-sub"
												placeholder="Enter subject" required>
										</div>

										<div class="mb-3">
											<textarea name="about" class="form-control" rows="5"
												placeholder="Enter something about faculty" required></textarea>
										</div>


										<div class="mb-3 form-check">
											<input type="checkbox" name="fac-check"
												class="form-check-input" id="exampleCheck1"> <label
												class="form-check-label" for="exampleCheck1">agree
												terms and condition</label>
										</div>

										<br>
										<div class="container text-center" id="loader"
											style="display: none">
											<span class="fa fa-refresh  fa-spin fa-4x"></span>
											<h4>Please wait ...</h4>
										</div>

										<button id="fac-submit-btn" type="submit"
											class="btn btn-primary">Submit</button>

									</form>
								</div>
								<div class="card-footer"></div>

							</div>

						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>



	<!-- 	Staff register -->


	<div class="modal fade" id="Staff-Register" tabindex="-1"
		aria-labelledby="exampleModalLabelRegisterStaff" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  text-white text-center">
					<h5 class="modal-title text-center text-dark"
						id="exampleModalLabelRegisterStaff">Staff</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container">

						<div class="col-lg-12 ">

							<div class="card">

								<div
									class="card-header text-center  model-background  text-white">
									<span class="fa  fa-3x fa-user-circle"></span> <br>
									Register here
								</div>
								<div class="card-body">
									<form id="staff-reg-form" action=" StaffRegisterServlet"
										method="POST">

										<div class="mb-3">
											<label for="staff-name" class="form-label">Staff name</label>
											<input type="text" name="staff-name" class="form-control"
												id="staff-name" placeholder="Enter name" required>
										</div>

										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Email
												address</label> <input type="email" name="staff-email"
												class="form-control" id="exampleInputEmail1"
												aria-describedby="emailHelp" required>
											<div id="emailHelp" class="form-text">We'll never share
												your email with anyone else.</div>
										</div>

										<div class="mb-3">
											<label for="exampleInputPassword1" class="form-label">Password</label>
											<input type="password" name="staff-pasw" class="form-control"
												id="exampleInputPassword1" required>
										</div>

										<div class="mb-3">
											<label for="gender" class="form-label">Select Gender</label>
											<br> <input type="radio" id="gender" name="gender"
												value="Male">male <input type="radio" id="gender"
												name="gender" value="Female" required>female
										</div>

										<div class="mb-3">
											<textarea name="about" class="form-control" rows="5"
												placeholder="Enter something about your self" required></textarea>
										</div>


										<div class="mb-3 form-check">
											<input type="checkbox" name="staff-check"
												class="form-check-input" id="exampleCheck1"> <label
												class="form-check-label" for="exampleCheck1">agree
												terms and condition</label>
										</div>

										<br>
										<div class="container text-center" id="loader"
											style="display: none">
											<span class="fa fa-refresh  fa-spin fa-4x"></span>
											<h4>Please wait ...</h4>
										</div>

										<button id="staff-submit-btn" type="submit"
											class="btn btn-primary">Submit</button>

									</form>
								</div>
								<div class="card-footer"></div>

							</div>

						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>




	<!-- 	Add post -->


	<!-- Modal -->
	<div class="modal fade" id="addPostModel" tabindex="-1"
		aria-labelledby="exampleModalLabelPost" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabelPost">Provide the
						post details ......</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-left">

						<div id="post-details">

							<form id="add-post-form" action="AddPostServlet" method="POST"
								enctype="multipart/form-data">

								<div class="form=group">
									<select class="form-control" name="cid" required>
										<option selected disabled>-----Select Cetagry-----</option>
										<%
										PostDao post = new PostDao(ConnectionProvider.getConnection());
										ArrayList<PostCategories> list = post.getAllCategories();
										for (PostCategories c : list) {
										%>
										<option value="<%=c.getCid()%>"><%=c.getName()%></option>
										<%
										}
										%>
									</select>
								</div>
								<br>
								<div class="form=group">
									<input type="text" name="ptitle"
										placeholder="Enter Post Title  ." class="form-control"
										required>
								</div>
								<br>
								<div class="form=group">
									<textarea rows="5" name="pcontent"
										placeholder="Enter Your Content   ." class="form-control"
										required></textarea>
								</div>
								<br>
								<div class="form=group">
									<label for="pic">Select Post pic...</label><br> <input
										type="file" class="form-control" name="ppic" id="pic" required>
								</div>
								<br>
								<div class="mb-3 form-check">
									<input type="checkbox" name="post-check"
										class="form-check-input" id="exampleCheckStudent" value="hel">
									<label class="form-check-label" for="exampleCheckStudent">agree
										terms and condition</label>
								</div>
								<br>
								<div class="container text-center" id="loader"
									style="display: none">
									<span class="fa fa-refresh  fa-spin fa-4x"></span>
									<h4>Please wait ...</h4>
								</div>
								<br>
								<div class="container text-center">
									<button id="post-submit-btn" type="submit"
										class="btn btn-outline-primary">Post</button>
								</div>

							</form>

						</div>

					</div>


					<!-- post edit -->

					<div id="admin-post-edit" style="display: none;">
						<br>
						<h6 class="nt-2 text-center" style="color: red;">Please edit
							carefully post details</h6>
						<br>
						<form action="AdminPostEditServlet" method="POST"
							enctype="multipart/form-data">
							<div class="form=group">
								<input type="number" name="post-id"
									placeholder="Enter Post id to to update  ."
									class="form-control" required>
							</div>
							<br>
							<div class="form=group">
								<select class="form-control" name="cid" required>
									<option selected disabled>-----Select Cetagry-----</option>
									<%
									PostDao pedit = new PostDao(ConnectionProvider.getConnection());
									ArrayList<PostCategories> list1 = post.getAllCategories();
									for (PostCategories c : list1) {
									%>
									<option value="<%=c.getCid()%>"><%=c.getName()%></option>
									<%
									}
									%>
								</select>
							</div>
							<br>
							<div class="form=group">
								<input type="text" name="ptitle"
									placeholder="Enter Post Title  ." class="form-control" required>
							</div>
							<br>
							<div class="form=group">
								<textarea rows="5" name="pcontent"
									placeholder="Enter Your Content   ." class="form-control"
									required></textarea>
							</div>
							<br>
							<div class="form=group">
								<label for="pic">Select your pic...</label><br> <input
									type="file" class="form-control" name="ppic" id="pic" required>
							</div>
							<br>

							<div class="container  text-center">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
						</form>

					</div>

					<!-- post delete -->

					<div id="post-delete" style="display: none;">
						<br>
						<h6 class="nt-2 text-center" style="color: red;">Delete the
							post ...</h6>
						<br>
						<form id="admin-post-delete" action="AdminPostDeleteServlet"
							method="POST" enctype="multipart/form-data">
							<div class="form=group">
								<input type="number" name="post-id"
									placeholder="Enter Post id to to delete  ."
									class="form-control" required>
							</div>
							<br>
							<div class="container  text-center">
								<button type="submit" class="btn btn-outline-primary">Delete</button>
							</div>
						</form>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button id="Aedit-post-btn" type="button" class="btn btn-primary">Edit</button>
						<button id="Adelete-post-btn" type="button"
							class="btn btn-primary">Remove</button>
					</div>

				</div>
				<!-- end body -->

			</div>
		</div>
	</div>



	<!-- 	Add news -->



	<div class="modal fade" id="profile-model-News" tabindex="-1"
		aria-labelledby="exampleModalLabelNews" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  model-background  text-white text-center">
					<h5 class="modal-title text-center" id="exampleModalLabelNews">Add
						News</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<div class="row justify-content-ceter">
							<div id="news-profile" class="col-lg-12">
								<form id="news-reg-form" action="AddNewsServlet" method="POST">
									<div class="mb-3">
										<input type="number" name="nid" placeholder="Enter News id  "
											class="form-control" required>
									</div>
									<div class="form-group">
										<textarea name="news" class="form-control" rows="5"
											placeholder="Enter something about News" required></textarea>
									</div>
									<br>
									<button id="submit-btn" type="submit" class="btn btn-primary">Submit
										News</button>
								</form>
							</div>
						</div>
					</div>

					<!-- news edit -->
					<div id="delete-news" style="display: none;">
						<br>
						<h6 class="nt-2 text-center" style="color: red;">Delete the
							news ...</h6>
						<br>
						<form action="DeleteNewsServlet" method="POST">
							<div class="form-group">
								<input type="number" placeholder="Enter News id  " name="newsId"
									class="form-control" required>
							</div>
							<br>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary">Delete</button>
							</div>
						</form>

					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="delete-news-btn" type="button" class="btn btn-primary">Remove</button>
				</div>

			</div>

		</div>
	</div>


	<!-- 	Add Event-->



	<div class="modal fade" id="profile-model-Event" tabindex="-1"
		aria-labelledby="exampleModalLabelEvent" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header model-background  text-white text-center">
					<h5 class="modal-title text-center" id="exampleModalLabelEvent">Event</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<div class="row justify-content-ceter">
							<div id="event-details" class="col-lg-12">
								<form action="AddEventServlet" method="POST">
									<div class="form=group">
										<input type="number" name="eno"
											placeholder="Enter event  id  " class="form-control" required>
									</div>
									<br>
									<div class="mb-3">
										<textarea name="news" class="form-control" rows="5"
											placeholder="Enter something about Event" required></textarea>
									</div>
									<div class="mb-3">
										<input type="date" name="edate"
											placeholder="Enter event date " class="form-control" required>
									</div>
									<button id="submit-btn" type="submit" class="btn btn-primary">Submit
										Event</button>
								</form>
							</div>
						</div>
					</div>

					<!-- event edit -->
					<div id="event-edit" style="display: none;">
						<br>
						<h6 class="nt-2 text-center" style="color: red;">Delete the
							event ...</h6>
						<br>
						<form action="EventEditServlet" method="POST"
							enctype="multipart/form-data">
							<div class="form=group">
								<input type="number" name="eid" placeholder="Enter event id  "
									class="form-control" required>
							</div>
							<br>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary">Remove</button>
							</div>
						</form>

					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-event-btn" type="button" class="btn btn-primary">Delete</button>
				</div>

			</div>

		</div>
	</div>


	<!-- 	Message Student-->



	<div class="modal fade" id="profile-model-Student-Msg" tabindex="-1"
		aria-labelledby="exampleModalLabelStudentMsg" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  model-background  text-white text-center">
					<h5 class="modal-title text-center"
						id="exampleModalLabelStudentMsg">Message Student</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<div class="row justify-content-ceter">
							<div class="col-lg-12">
								<form id="reg-form" action="RegisterServlet" method="POST">
									<div class="mb-3">
										<textarea name="news" class="form-control" rows="5"
											placeholder="Enter Message"></textarea>
									</div>
									<button id="submit-btn" type="submit" class="btn btn-primary">Send</button>
								</form>
							</div>
						</div>
					</div>

					<!-- profile edit -->
					<div id="profile-edit" style="display: none;">
						<br> <br> <br> <br> <br>
						<h6 class="nt-2" style="color: red;">Please edit carefully</h6>
						<form action="EditServlet" method="POST"
							enctype="multipart/form-data">
							<div class="form=group">
								<input type="number" name="ptitle" placeholder="Enter News id  "
									class="form-control">
							</div>
							<div class="mb-3">
								<textarea name="news" class="form-control" rows="5"
									placeholder="Enter something about News"></textarea>
							</div>

							<div class="container ">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
						</form>

					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>

			</div>

		</div>
	</div>



	<!-- 	Message Faculty-->



	<div class="modal fade" id="profile-model-Faculty-Msg" tabindex="-1"
		aria-labelledby="exampleModalLabelFacultyMsg" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  model-background  text-white text-center">
					<h5 class="modal-title text-center"
						id="exampleModalLabelFacultyMsg">Message Faculty</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<div class="row justify-content-ceter">
							<div class="col-lg-12">
								<form id="reg-form" action="RegisterServlet" method="POST">
									<div class="mb-3">
										<textarea name="news" class="form-control" rows="5"
											placeholder="Enter Message"></textarea>
									</div>
									<button id="submit-btn" type="submit" class="btn btn-primary">Send</button>
								</form>
							</div>
						</div>
					</div>

					<!-- profile edit -->
					<div id="profile-edit" style="display: none;">
						<br> <br> <br> <br> <br>
						<h6 class="nt-2" style="color: red;">Please edit carefully</h6>
						<form action="EditServlet" method="POST"
							enctype="multipart/form-data">
							<div class="form=group">
								<input type="number" name="ptitle" placeholder="Enter News id  "
									class="form-control">
							</div>
							<div class="mb-3">
								<textarea name="news" class="form-control" rows="5"
									placeholder="Enter something about News"></textarea>
							</div>

							<div class="container ">
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
						</form>

					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>

			</div>

		</div>
	</div>






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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="https://kit.fontawesome.com/5eb391e4c9.js"
		crossorigin="anonymous"></script>

	<!--  profile   edit button toggle -->

	<script>

$(document).ready(function(){
	
	<!--     edit button toggle  logic-->
	
	let editStatus=false;
	
	$('#Aedit-profile-btn').click(function(){
	
	if(editStatus == false){
		
		$('#profile-details').hide()
		
		$('#admin-profile-edit').show()
		editStatus = true;
		/*It change the text edit to back*/
		$(this).text("Back")
	}
	else{
		
		$('#profile-details').show()
		
		$('#admin-profile-edit').hide()
		editStatus = false;
		/*It change the text back to edit*/
		$(this).text("Edit")
	}
	
	})
	});

</script>

	<!--  post  edit button toggle -->

	<script>

$(document).ready(function(){
	
	<!--     edit button toggle  logic-->
	
	let editStatus=false;
	
	$('#Aedit-post-btn').click(function(){
	
	if(editStatus == false){
		
		$('#post-details').hide()
		
		$('#admin-post-edit').show()
		
		$('#Adelete-post-btn').hide();
		
		editStatus = true;
		/*It change the text edit to back*/
		$(this).text("Back")
	}
	else{
		
		$('#post-details').show()
		
		$('#admin-post-edit').hide()
		
		$('#Adelete-post-btn').show();
		editStatus = false;
		/*It change the text back to edit*/
		$(this).text("Edit")
	}
	
	})
	});

</script>


	<!--  post delete button toggle -->

	<script>

$(document).ready(function(){
	
	<!--     delete button toggle  logic-->
	
	let editStatus=false;
	
	$('#Adelete-post-btn').click(function(){
	
	if(editStatus == false){
		
		$('#post-details').hide()
		
		$('#post-delete').show()
		
		$('#Aedit-post-btn').hide();
		
		editStatus = true;
		/*It change the text edit to back*/
		$(this).text("Back")
	}
	else{
		
		$('#post-details').show()
		
		$('#post-delete').hide()
		
		$('#Aedit-post-btn').show();
		
		editStatus = false;
		/*It change the text back to edit*/
		$(this).text("Remove")
	}
	
	})
	});

</script>


	<!--  news delete button toggle -->

	<script>

$(document).ready(function(){
	
	<!--     delete button toggle  logic-->
	
	let editStatus=false;
	
	$('#delete-news-btn').click(function(){
	
	if(editStatus == false){
		
		$('#news-profile').hide()
		
		$('#delete-news').show()
		
		
		editStatus = true;
		/*It change the text edit to back*/
		$(this).text("Back")
	}
	else{
		
		$('#news-profile').show()
		
		$('#delete-news').hide()
		
		
		editStatus = false;
		/*It change the text back to edit*/
		$(this).text("Delete")
	}
	
	})
	});

</script>

	<!--  Event edit button toggle -->

	<script>

$(document).ready(function(){
	
	<!--     delete button toggle  logic-->
	
	let editStatus=false;
	
	$('#edit-event-btn').click(function(){
	
	if(editStatus == false){
		
		$('#event-details').hide()
		
		$('#event-edit').show()
		
		
		editStatus = true;
		/*It change the text edit to back*/
		$(this).text("Back")
	}
	else{
		
		$('#event-details').show()
		
		$('#event-edit').hide()
		
		
		editStatus = false;
		/*It change the text back to edit*/
		$(this).text("Edit")
	}
	
	})
	});

</script>
	<!-- student -->

	<script>
    
    $(document).ready(function(){
    	
    	console.log("loaded ....")
    	
    	$('#stu-reg-form').on('submit' , function(event){
    		
    		//when we click on submit btn then it prevent to go studentregisterservlet
    		event.preventDefault();
    		
    		let form=new FormData(this);
    		
    		$('#stu-submit-btn').hide();
    		$('#loader').show();
    		
    		//send registerservlet
    		
    		$.ajax({
    			
    			url:"StudentRegisterServlet",
    			type:'POST',
    			data:form,
    			success: function(data , textStatus, jqXHR){
    				
    				console.log(data)
    				$('#stu-submit-btn').show();
    	    		$('#loader').hide();
    	    		
    	    		if(data.trim() === 'Student Registration is Done  ...')
    	    			{
    	    			swal("Registered successfully  . we redirecting to Admin profile page  .....")
        	    		.then((value) => {
        	    		  swal("Thank you for registration ..");
        	    		});
    	    			}
    	    		else{
    	    			swal(data);
    	    		}
    	    		
    			},
    			error:  function(jqXHR,  textStatus, errorThrown){
    				
    				$('#stu-submit-btn').show();
    	    		$('#loader').hide();
    	    		
    				swal("Something went wrong . try again  .....");
    	    		
    			},
    			processData: false,
    			contentType:false
    			
    			
    		});
    		
    		
    		
    	});
    	
    	
   
    });
    
    </script>

	<!--     faculty -->


	<script>
    
    $(document).ready(function(){
    	
    	console.log("loaded ....")
    	
    	$('#fac-reg-form').on('submit' , function(event){
    		
    		//when we click on submit btn then it prevent to go studentregisterservlet
    		event.preventDefault();
    		
    		let form=new FormData(this);
    		
    		$('#fac-submit-btn').hide();
    		$('#loader').show();
    		
    		//send registerservlet
    		
    		$.ajax({
    			
    			url:" FacultyRegisterServlet ",
    			type:'POST',
    			data:form,
    			success: function(data , textStatus, jqXHR){
    				
    				console.log(data)
    				$('#fac-submit-btn').show();
    	    		$('#loader').hide();
    	    		
    	    		if(data.trim() === 'Faculty Registration is Done  ...')
    	    			{
    	    			swal("Registered successfully  . we redirecting to Admin profile page  .....")
        	    		.then((value) => {
        	    		  swal("Thank you for registration ..");
        	    		});
    	    			}
    	    		else{
    	    			swal(data);
    	    		}
    	    		
    			},
    			error:  function(jqXHR,  textStatus, errorThrown){
    				
    				$('#fac-submit-btn').show();
    	    		$('#loader').hide();
    	    		
    				swal("Something went wrong . try again  .....");
    	    		
    			},
    			processData: false,
    			contentType:false
    			
    			
    		});
    		
    		
    		
    	});
    	
    	
   
    });
    
    </script>

	<!--   staff -->

	<script>
    
    $(document).ready(function(){
    	
    	console.log("loaded ....")
    	
    	$('#staff-reg-form').on('submit' , function(event){
    		
    		//when we click on submit btn then it prevent to go studentregisterservlet
    		event.preventDefault();
    		
    		let form=new FormData(this);
    		
    		$('#staff-submit-btn').hide();
    		$('#loader').show();
    		
    		//send registerservlet
    		
    		$.ajax({
    			
    			url:" StaffRegisterServlet",
    			type:'POST',
    			data:form,
    			success: function(data , textStatus, jqXHR){
    				
    				console.log(data)
    				$('#staff-submit-btn').show();
    	    		$('#loader').hide();
    	    		
    	    		if(data.trim() === 'Staff Registration is Done  ...')
    	    			{
    	    			swal("Registered successfully  . we redirecting to Admin profile page  .....")
        	    		.then((value) => {
        	    		  swal("Thank you for registration ..");
        	    		});
    	    			}
    	    		else{
    	    			swal(data);
    	    		}
    	    		
    			},
    			error:  function(jqXHR,  textStatus, errorThrown){
    				
    				$('#staff-submit-btn').show();
    	    		$('#loader').hide();
    	    		
    				swal("Something went wrong . try again  .....");
    	    		
    			},
    			processData: false,
    			contentType:false
    			
    			
    		});
    		
    		
    		
    	});
    	
    	
   
    });
    
    </script>

	<!-- now add post js -->
	<script>
$(document).ready(function(e){
	
	$('#add-post-form').on("submit",function(event){
		
		//this code gets called when form is submitted..... 
		event.preventDefault();
		console.log("you have clicked on submit....");
		
		let form=new FormData(this);
		
		
		//now requesting to server
		$.ajax({
			
			url:"AddPostServlet",
			type:'POST',
			data:form,
			success:function(data, textStatus,jqXHR){
				//success...
				console.log(data);
				
				if(data.trim() == 'Successfully post Blog ....'){
					
					swal("Good job!", "Saved successfully", "success");
					
				}
				else{
					
					swal(data);
					
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				//error...
				swal("Error!...", "Something went wrong try again!", "error");
			},
			processData:false,
			contentType:false
		})
	})
})
</script>





	<script>
  var el = document.getElementById("wrapper");
  var toggleButton = document.getElementById("menu-toggle");

  toggleButton.onclick = function () {
      el.classList.toggle("toggled");
  };
    </script>

</body>

</html>