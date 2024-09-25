<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css">
		
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap');
    </style>
</head>
<body>

<section class="header" style="background-image:linear-gradient(to left,rgba(0, 81, 195, 0.776),rgba(141, 203, 139, 0.753)), url(../media/banner4.jpg); ">
        <div class="sub-header">
            <div class="mt-4"><img src="../media/logo.png" alt="" class="img-fluid"></div>
            <div style="text-align: center;">
                <p> DEPARTMENT OF COMPUTER SCIENCE ENGINEERING & APPLICATION </p>
                <h4 class="nav_head">INDIRA GANDHI INSTITUTE OF TECHNOLOGY, SARANG</h4>
                <h5>An Autonomous Institute of Govt. of Odisha</h5>
            </div>
            <div class="mt-4"><img src="../media/logo.png" alt="" class="img-fluid"></div>
        </div>
      </section>
      
      
    <nav class="navbar navbar-expand-lg navbar-light bg-light banner-background nav-bar" >
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="../media/logo.png" alt="" width="46px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../home.jsp">Home</a>
                    </li>
               
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../about.jsp">About us</a>
                    </li>
                    
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Gallery</a>
                    </li>
                    
                     <li class="nav-item dropdown">
                       
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false"> Academics</a>
                            
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        
                            <li><a class="dropdown-item" href="../course.jsp">Course</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Placement</a></li>
                            
                        </ul>
                        
                    </li>
                    
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Programs
                        </a>
                        
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../btechprogram.jsp">Btech</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                                <li><a class="dropdown-item" href="../mcaprogram.jsp">Mca</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../mtechprogram.jsp">Mtech</a></li>
                             <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../phdprogram.jsp">Phd</a></li>
                            
                        </ul>
                        
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Activity
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../blog.jsp">Blog</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../event.jsp">Event</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            People
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../facultypage.jsp">Faculty</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../staffpage.jsp">Staff</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../studentpage.jsp">Students</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Login
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../login.jsp">Student & Faculty</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../admin.jsp">Admin</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../contactus.jsp">Contact us</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>
    

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5eb391e4c9.js" crossorigin="anonymous"></script>
</body>
</html>