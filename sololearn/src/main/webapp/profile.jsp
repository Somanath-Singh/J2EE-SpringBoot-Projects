<%@page import="com.nt.javabeans.Message"%>
<%@page import="com.nt.javabeans.UserData"%>
<%@page import="com.nt.javabeans.Category"%>
<%@page import="com.nt.dao.PostDao"%>
<%@page import="com.nt.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>

<!-- if any error then it open error page -->
<%@page errorPage="error-page.jsp"%>

<%
UserData user = (UserData) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login-page.jsp");
}
%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

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
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="profile.jsp"><span
				class="fa fa-cogs">SoloLearn</span></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="sololearn.jsp"><span
							class="fa fa-500px"> Learn with Somanath</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#contactForm"><span
							class="fa fa-address-book">Contacts</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#addPostModel"><span
							class="fa fa-asterisk">Post</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.programiz.com/c-programming/online-compiler/"><span
							class="fa">{/} Code here</span></a></li>
				</ul>

				<ul class="navbar-nav mr-right">

					<li class="nav-item"><img alt="image not supported"
						src="./pictures/<%=user.getVerification()%>" width="28px"
						class="mt-2"></li>

					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#profile-model"><img
							alt="image not supported" src="./pictures/<%=user.getProfile()%>"
							width="28px" style="border-radius: 24px;"> <%=user.getName()%></a></li>

					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#contactsection"><span
							class="fa fa-child"></span> Logout </a></li>


				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
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


	<%-- 
    <%= user.getName()  %>
    <br>
    <%= user.getEmail() %>
    <br>
    <%= user.getAbout() %> --%>

	<!-- main body of the page -->

	<main>

		<div class="container">

			<div class="row mt-4">

				<!-- first column -->
				<div class="col-lg-4">
					<!-- categories -->
					<div class="list-group">
						<a href="#" onclick="getPosts(0 , this)"
							class="c-link list-group-item list-group-item-action active "
							aria-current="true">All Posts..</a>
						<!-- categories -->
						<%
						PostDao p = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = p.getAllCategories();
						for (Category cc : list1) {
						%>
						<a href="#" onclick="getPosts(<%=cc.getCid()%> , this)"
							class="c-link list-group-item list-group-item-action "><%=cc.getName()%></a>
						<%
						}
						%>

					</div>

				</div>

				<!-- second column -->
				<div class="col-lg-8 col-12" id="post-container">
					<!-- posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>


				</div>

			</div>

		</div>

	</main>



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
						<img src="./pictures/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 110px"> <img
							alt="image not supported"
							src="./pictures/<%=user.getVerification()%>" width="36px"
							class="mt-2">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th>ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><%=user.getAbout()%></td>
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
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" class="form-control"
											name="user-email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" class="form-control"
											name="user-password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<th>Profile Pic</th>
										<td><input type="file" class="form-control" name="image"></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><textarea class="form-control" name="user-about"
												rows="3">
    								 									 		<%=user.getAbout()%>
    								 									 </textarea></td>
									</tr>

								</table>

								<div class="container ">
									<button type="submit" class="btn btn-outline-primary hero_btn">Save</button>
								</div>
							</form>


						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button"
						class="btn btn-primary hero_btn">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- end of profile model -->

	<!-- add profile model -->

	<!-- Modal -->
	<div class="modal fade" id="addPostModel" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details ......</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="POST"
						enctype="multipart/form-data">

						<div class="form=group">
							<select class="form-control" name="cid">
								<option selected disabled>-----Select Cetagry-----</option>

								<%
								PostDao post = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = post.getAllCategories();
								for (Category c : list) {
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
							<textarea rows="5" name="pcode"
								placeholder="Enter Your Program(if any ..)   ."
								class="form-control" required></textarea>
						</div>
						<br>
						<div class="form=group">
							<label for="pic">Select your pic...</label><br> <input
								type="file" class="form-control" name="pPic" id="pic" required>
						</div>
						<br>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary hero_btn">Post</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- end profile model -->

	<!-- logout model -->

	<div class="modal fade" id="contactsection" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Logout ......</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to logout ....</p>
					<a href="LogoutServlet" type="button"
						class="btn btn-primary hero_btn">Logout</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- contact model -->
	<!-- Modal -->
	<div class="modal fade" id="contactForm" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header  primary-background text-white text-center">
					<h5 class="modal-title">... Connect with us ...</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-12">
								<form id="frm">

									<input type="text" id="fn" class="form-control" required
										placeholder="Enter your first Name .."> <br> <span
										id="sp1"></span> <input type="text" id="ln"
										class="form-control" required
										placeholder="Enter your last Name .."> <br> <span
										id="sp2"></span> <input type="text" id="cn"
										class="form-control" maxlength="10" required
										placeholder="Enter your contact Number .."> <br>
									<span id="sp3"></span> <input type="email" id="eid"
										class="form-control" required
										placeholder="Enter your Email id .."> <br> <span
										id="sp4"></span>
									<textarea id="sub" cols="25" rows="5" class="form-control"
										placeholder="Enter your Subject .."></textarea>
									<br> <br>
									<button type="submit" id="submit" onclick="sendEmail()"
										class="hero_btn">Submit</button>
								</form>
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
				
				if(data.trim() == 'done'){
					swal("Good job!", "Saved successfully", "success");
				}
				else{
					swal("Error!", "Something went wrong try again!", "error");
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


	<!-- loading post using ajax -->
	<script>

function getPosts(catId , temp){
	
	$("#loader").show();
	$('#post-container').hide()
	
	 $(".c-link").removeClass('active')
	
$.ajax({
		
		url:"load-post.jsp",
		data:{cid : catId}, 
		success:function(data, textStatus,jqXHR){
			//success...
			console.log(data);
			$("#loader").hide();
			$('#post-container').show();
			$('#post-container').html(data)
			$(temp).addClass('active')
		}
   })
}
$(document).ready(function(e){
	//call the function
	let allPostref=$('.c-link')[0]
	getPosts(0,allPostref)

})
</script>

	<script>
        //first name
        const fn = document.querySelector("#fn");
        const sp1 = document.querySelector("#sp1");
        fn.onkeypress = function (fna) {
            let ch1 = fna.which;
            console.log(ch1);
            if (!((ch1 >= 65 && ch1 <= 90) || (ch1 >= 97 && ch1 <= 122) || (ch1 == 32))) {
                sp1.innerText = "Please enter only character .";
                sp1.style.color = "red";
                fn.style.color = "red";
                fna.preventDefault();
            }
            else {
                sp1.innerText = "";
                fn.style.color = "black";
            }
        }
        //last name
        const ln = document.querySelector("#ln");
        const sp2 = document.querySelector("#sp2");
        ln.onkeypress = function (lna) {
            let ch2 = lna.which;
            console.log(ch2);
            if (!((ch2 >= 65 && ch2 <= 90) || (ch2 >= 97 && ch2 <= 122) || (ch2 == 32))) {
                sp2.innerText = "Please enter only character .";
                sp2.style.color = "red";
                ln.style.color = "red";
                lna.preventDefault();
            }
            else {
                sp2.innerText = "";
                ln.style.color = "black";
            }
        }
        //contact no
        const cn = document.querySelector("#cn");
        const sp3 = document.querySelector("#sp3");
        cn.onkeypress = function (cna) {
            let ch3 = cna.which;
            console.log(ch3);
            if (!(ch3 >= 48 && ch3 <= 57)) {
                sp3.innerText = "Please enter only number .";
                sp3.style.color = "red";
                cn.style.color = "red";
                cna.preventDefault();
            }
            else {
                sp3.innerText = "";
                cn.style.color = "black";
            }
        }

        //password
        const sp5 = document.querySelector("#sp5");
        const sp6 = document.querySelector("#sp6");
        document.forms[0].onsubmit = function (frm) {
            const pws = document.querySelector("#pws");
            let ch, upper = false, lower = false, dig = false, sym = false;
            let pw = pws.value;
            for (let i = 0; i < pw.length; i++) {
                ch = pw[i];
                if (ch >= '0' && ch <= '9')
                    dig = true;
                else if (ch >= 'A' && ch <= 'Z')
                    upper = true;
                else if (ch >= 'a' && ch <= 'z')
                    lower = true;
                else
                    sym = true;
            }

            if (upper === false || lower === false || dig === false || sym === false || pw.length < 8) {
                sp5.innerText = "please set valid password ";
                sp5.style.color = "red";
                pws.style.border = "1px solid red";
                frm.preventDefault();
            }

            //conform password
            const cpws = document.querySelector("#cpws");
            let cpw = cpws.value;
            if (!(pw === cpw)) {
                sp6.innerText = "password should be match. ";
                sp6.style.color = "red";
                cpws.style.border = "1px solid red";
                frm.preventDefault();
            }

            //phone number
            const cn = document.querySelector("#cn");
            let contactno = cn.value;
            if ((contactno.length < 10)) {
                sp3.innerText = "phone no should be ten digit no.";
                sp3.style.color = "red";
                cn.style.border = "1px solid red";
                frm.preventDefault();
            }
        }

        // form validation end
        function sendEmail(){

            let firstname = fn.value;
            let lasttname = ln.value;
            let contactno = cn.value;
            let emailid = document.querySelector("#eid").value;
            let password = pws.value;
            let subject = document.querySelector("#sub").value;
           
            let body = "Name :" + firstname + lasttname + "<br/> Email :" + emailid + "<br/> Contact No :" +  contactno + "<br/> Password :" + password + "<br/> Subject :" + subject ;
            // console.log(body);

                Email.send({
                Host: "smtp.elasticemail.com",
                Username: "somanathsingh531@gmail.com",
                Password: "0752CC5D942D96D0D992598B4980F281321F",
                To: 'somanathsingh531@gmail.com',
                From: "somanathsingh531@gmail.com",
                Subject: "Messages from contact form ",
                Body: body
                    }).then(message => alert("sent successfully ."));
        }
    </script>

	<br>
	<br>

	<!-- footer -->
	<%@include file="footer.jsp"%>



</body>
</html>