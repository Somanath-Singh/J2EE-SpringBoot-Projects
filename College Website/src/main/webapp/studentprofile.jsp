<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="./css/profile.css" />
    <link rel="stylesheet" href="./css/style.css" />

    <script src="./js/script.js"></script>
    <title>Student Dashboard</title>
</head>

<body class="header-background">
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
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-project-diagram me-2"></i>Projects</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-chart-line me-2"></i>Analytics</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-paperclip me-2"></i>Reports</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
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
							aria-expanded="false">
							<img src="./picture/" class="img-fluid" style="border-radius: 60%; max-width: 40px">&nbsp;&nbsp;Somanath Singh</a>
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
                        <table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Customer</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Television</td>
                                    <td>Jonny</td>
                                    <td>$1200</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Laptop</td>
                                    <td>Kenny</td>
                                    <td>$750</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Cell Phone</td>
                                    <td>Jenny</td>
                                    <td>$600</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>Fridge</td>
                                    <td>Killy</td>
                                    <td>$300</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>Books</td>
                                    <td>Filly</td>
                                    <td>$120</td>
                                </tr>
                                <tr>
                                    <th scope="row">6</th>
                                    <td>Gold</td>
                                    <td>Bumbo</td>
                                    <td>$1800</td>
                                </tr>
                                <tr>
                                    <th scope="row">7</th>
                                    <td>Pen</td>
                                    <td>Bilbo</td>
                                    <td>$75</td>
                                </tr>
                                <tr>
                                    <th scope="row">8</th>
                                    <td>Notebook</td>
                                    <td>Frodo</td>
                                    <td>$36</td>
                                </tr>
                                <tr>
                                    <th scope="row">9</th>
                                    <td>Dress</td>
                                    <td>Kimo</td>
                                    <td>$255</td>
                                </tr>
                                <tr>
                                    <th scope="row">10</th>
                                    <td>Paint</td>
                                    <td>Zico</td>
                                    <td>$434</td>
                                </tr>
                                <tr>
                                    <th scope="row">11</th>
                                    <td>Carpet</td>
                                    <td>Jeco</td>
                                    <td>$1236</td>
                                </tr>
                                <tr>
                                    <th scope="row">12</th>
                                    <td>Food</td>
                                    <td>Haso</td>
                                    <td>$422</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
    </div>


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
						<img src="./picture/" class="img-fluid"
							style="border-radius: 50%; max-width: 110px">
						<h5 class="modal-title mt-3" id="exampleModalLabel">
							</h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th>ID</th>
										<td></td>
									</tr>
									<tr>
										<th>Email</th>
										<td></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td></td>
									</tr>
									<tr>
										<th>Status</th>
										<td></td>
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
										<td></td>
									</tr>
									<tr>
										<th>Name</th>
										<td><input type="text" class="form-control"
											name="admin-name" value=""required></td>
									</tr>
									<tr>
										<th>Gender</th>
										<td><input type="text" class="form-control"
											name="admin-gender" value="" required> </td>
									</tr>
									<tr>
										<th>Email</th>
										<td><input type="email" class="form-control"
											name="admin-email" value="" required></td>
									</tr>
									<tr>
										<th>Password</th>
										<td><input type="password" class="form-control"
											name="admin-password" value="" required></td>
									</tr>
									<tr>
										<th>Profile Pic</th>
										<td><input type="file" class="form-control"
											name="admin-image" required></td>
									</tr>
									<tr>
										<th>Status</th>
										<td><textarea class="form-control" name="admin-about"
												rows="3" required></textarea></td>
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
	<script src="https://kit.fontawesome.com/5eb391e4c9.js"
		crossorigin="anonymous"></script>

    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
</body>

</html>