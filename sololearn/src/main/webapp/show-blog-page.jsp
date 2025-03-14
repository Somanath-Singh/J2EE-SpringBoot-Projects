<%@page import="com.nt.javabeans.UserData"%>
<%@page import="com.nt.javabeans.Post"%>
<%@page import="com.nt.helper.ConnectionProvider"%>
<%@page import="com.nt.dao.PostDao"%>
<%@page import="com.nt.dao.UserDao"%>
<%@page import="com.nt.dao.ReplyDao"%>
<%@page import="com.nt.javabeans.Message"%>
<%@page import="com.nt.javabeans.Category"%>
<%@page import="com.nt.javabeans.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>


<!-- if any error the it open error page -->
<%@page errorPage="error-page.jsp"%>


<!-- it validate the user is login or not -->
<%

UserData user=(UserData)session.getAttribute("currentUser");
if(user==null)
{
	response.sendRedirect("login-page.jsp");
}

%>

<%
		String post_id=request.getParameter("post-id");
		System.out.println(post_id);
		int postId = Integer.parseInt(post_id);
		PostDao d=new PostDao(ConnectionProvider.getConnection());

		//store all the post details into post class using creating object of it 
		Post p= d.getPostByPostId(postId);




%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle()%> ||SoloLearn by learn with Somanath</title>
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


	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><span class="fa fa-cogs"></span>
				SoloLearn</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="profile.jsp"><span
							class="fa fa-500px"></span> Learn with Somanath</a></li>
					<li class="nav-item"><a class="nav-link" href="sololearn.jsp"><span
							class="fa"></span> SoloLearn</a></li>
				</ul>

				<ul class="navbar-nav mr-right">

					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#profile-model"><span
							class="fa fa-user-circle"></span> <%= user.getName() %></a></li>

					<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
							class="fa fa-child"></span> Logout </a></li>


				</ul>
			</div>
		</div>
	</nav>


	<!-- navbar end -->

	<!-- message shown in webpage -->
	<%
	Message m = (Message) session.getAttribute("message");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%> " role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("message");
	}
	%>
	<!-- main content of the body -->

	<div class="container">

		<div class="row my-4">

			<div class="col-lg-8 col-12 offset-lg-2">

				<div class="card  main-content">

					<div class="card-header primary-background text-white">

						<h4 class="post-title"><%=p.getpTitle() %></h4>

					</div>


					<div class="card-body">

						<img src="post-pics/<%= p.getpPic() %>" class="card-img-top my-2"
							alt="Card image cap" style="width: 100%; height: 18rem;">

						<div class="row my-3 row-user">

							<div class=col-md-8>
								<!-- create the object of userdao -->
								<% UserDao ud=new UserDao(ConnectionProvider.getConnection());%>
								<p>
									<a class="text-primary" href="#!"><%=ud.getUserByUserId(p.getUserId()).getName() %>
									</a>has posted :
								</p>

							</div>

							<div class=col-md-4>

								<p class="post-date"><%=    DateFormat.getDateTimeInstance().format(p.getpDate())  %></p>

							</div>

						</div>


						<p class="post-content"><%=p.getpContent() %></p>
						<br> <br>

						<div class="post-code">

							<pre><%= p.getpCode() %></pre>

						</div>

					</div>

					<div class="card-footer">
						<div class="container">
							<%
							ReplyDao rdao = new ReplyDao(ConnectionProvider.getConnection());
							ArrayList<Reply> rlist = rdao.getAllReplys(postId);
							for (Reply r : rlist) {
							%>
							<div class="row">
								<div class="col-lg-12">
									<p>
										<b>Ans =></b><%=r.getAnswer() %></p>
									<br>
									<p class="post-date" style="text-align: right;"><%= DateFormat.getDateTimeInstance().format(r.getDate())  %></p>
									<br>
									<hr>
								</div>
							</div>
							<%
                                                                            }
                                                                            %>

						</div>
						<hr>
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<% UserDao ud1=new UserDao(ConnectionProvider.getConnection());%>
									<form
										action="ReplyServlet?pid=<%=postId %>&uid=<%=ud1.getUserByUserId(p.getUserId()).getId() %>"
										method="POST">
										<div class="mb-3">
											<label for="comment" class="form-label">Leave your
												reply ...</label>
											<textarea name="reply" class="form-control" id="comment"
												rows="3" required></textarea>
										</div>
										<div class="mb-3" style="text-align: right;">
											<button type="submit" class="btn btn-primary hero_btn">Submit</button>
											<button type="reset" class="btn btn-primary hero_btn">Reset</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>


		</div>


	</div>

	<div class="fb-comments"
		data-href="https://localhost:3031/TechBlog_Project/show-blog-page.jsp?post-id=14"
		data-width="" data-numposts="6"></div>


	<!-- end of main content of the body -->

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
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">SoloLearn</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pictures/<%= user.getProfile() %>" class="img-fluid"
							style="border-radius: 50%; max-width: 110px">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th>ID</th>
										<td><%= user.getId()  %></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><%= user.getEmail()  %></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><%= user.getGender()  %></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><%= user.getAbout()  %></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<br>
							<h6 class="nt-2" style="color: red;">Please edit carefully</h6>
							<form action="EditServlet" method="POST"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th>ID</th>
										<td><%= user.getId()  %></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" class="form-control"
											name="user-email" value="<%= user.getEmail()  %>"></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" class="form-control"
											name="user-password" value="<%= user.getPassword()  %>"></td>
									</tr>
									<tr>
										<th>Profile Pic</th>
										<td><input type="file" class="form-control" name="image"></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><textarea class="form-control" name="user-about"
												rows="3">
    								 									 		<%= user.getAbout()  %>
    								 									 </textarea></td>
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
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- end of profile model -->


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
	<script src="js/logic.js" type="text/javascript"></script>

	<script>
$(document).ready(function(){
	
	/*Edit button toggle logic*/
	
	let editStatus = false;
	
	
	$('#edit-profile-btn').click(function(){
		/* alert("button clicked") */
		
		if(editStatus == false){
			
			$('#profile-details').hide()
			
			$('#profile-edit').show()
			editStatus = true;
			/*It change the text edit to back*/
			$(this).text("Back")
		}
		else{
			
			$('#profile-details').show()
			
			$('#profile-edit').hide()
			editStatus = false;
			/*It change the text back to edit*/
			$(this).text("Edit")
		}
		
	})
});
</script>

	<!-- footer -->
	<%@include file="footer.jsp"%>

</body>
</html>