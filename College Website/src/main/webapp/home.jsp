<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="com.clgw.javabeans.PostNews" %>
<%@page import="com.clgw.dao.NewsDao" %>
<%@page import="com.clgw.helper.ConnectionProvider" %>
<%@page import="java.util.List" %>

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

    <section>
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active carousel-img">
                    <img src="./media/igit2.jpg" class="d-block w-100" alt="..." height="500px">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Some representative placeholder content for the first slide.</p>
                    </div>
                </div>
                <div class="carousel-item carousel-img">
                    <img src="./media/background.jpg" class="d-block w-100" alt="..." height="500px">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
                    </div>
                </div>
                <div class="carousel-item carousel-img">
                    <img src="./media/cafeteria.png" class="d-block w-100" alt="..." height="500px">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
                <div class="carousel-item carousel-img">
                    <img src="./media/igit2.jpg" class="d-block w-100" alt="..." height="500px">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
                <div class="carousel-item carousel-img">
                    <img src="./media/igit2.jpg" class="d-block w-100" alt="..." height="500px">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <section>
        <div class="container mt-5 intro-page">
            <div class="row justify-content-around text-center">
                <div class="col-lg-9 pt-5">
                    <h2 class="head">WELCOME TO IGIT, SARANG</h2>
                    <p  class="para">Indira Gandhi Institute of Technology (IGIT), Sarang was established in the year of 1982 and was managed directly by the
                    Govt. of Odisha in the name of Odisha College of Engineering (OCE). Prior to this, since 1981, the institute in the name
                    of Modern Polytechnic (MPT) was offering Diploma Courses in Civil, Electrical, Mechanical, Mining Survey Engineering.In
                    the year 1987, both OCE & MPT were merged and renamed as IGIT, Sarang and the management was transferred to an
                    Autonomous Society.</p>
                </div>
                <div class="col-lg-3">
                    <div class="card">
                        <img src="./media/director.jpg" class="card-img-top" alt="..." height="210px">
                        <div class="card-body">
                            <p class="card-text"><b>Dr. Satyabrata Mohanta</b>

                               <br> Director Of IGIT,Sarang</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
     <section>
        <div class="container mt-5 intro-page">
            <div class="row justify-content-around text-center">
               <div class="col-lg-3">
                    <div class="card">
                        <img src="./media/SasmitaMam.JPG" class="card-img-top" alt="..." height="210px">
                        <div class="card-body">
                            <p class="card-text"><b>Prof. Dr. Sasmita Mishra</b>
                            <br>HOD Of CSEA</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 pt-5">
                    <h2 class="head">WELCOME TO MYCOMP SOCIETY </h2>
                    <p  class="para">Indira Gandhi Institute of Technology (IGIT), Sarang was established in the year of 1982 and was managed directly by the
                    Govt. of Odisha in the name of Odisha College of Engineering (OCE). Prior to this, since 1981, the institute in the name
                    of Modern Polytechnic (MPT) was offering Diploma Courses in Civil, Electrical, Mechanical, Mining Survey Engineering.In
                    the year 1987, both OCE & MPT were merged and renamed as IGIT, Sarang and the management was transferred to an
                    Autonomous Society.</p>
                </div>
            </div>
        </div>
    </section>

   <section>
        <div class="container mt-5 p-4 intro-page" >
            <div class="row justify-content-center">
                
                <div class="col-lg-9 pt-4">
                <h3 class="head">Mission</h3>
                <ul class="para">
                    <li>To produce well trained technical graduates with innovative thinking, knowledge and skills to meet the requirement of the changing society.</li>
                    <li>To foster promote and sustain scientific research in emerging fields of technology with a futuristic outlook.</li>
                    <li>To establish interactive linkages with leading technological institutions, research centres and industries.</li>
                    <li>To provide service to the community through continuing education and technology transfer.</li>
                </ul>
                </div>
                <div class="col-lg-3" id="vission" style=" background-image: url(./media/vission.avif);">
                    <h3>Vission</h3>
                    <p>To be an academic institution of excellence striving continuously for advancement of technical education and research in
                    service to society.</p>
                </div>
            </div>
            </div>
    </section>
	
	
	 <!-- event -->
    <section>
        <div class="container pt-5">
            <div class="row justify-content-center">
                <div class="col-lg-12 news">
                    <p class="header-background">Latest news</p>
                    <marquee direction="up" width="100%">
                        <ul>
                            <!-- jsp code -->
                        
                        <%
                        
                        NewsDao d=new NewsDao(ConnectionProvider.getConnection());
                        List<PostNews> news=d.getAllNews();
                        for(PostNews n:news)
                        {
                        %>
                        
                        <li> <%=n.getNewsContent() %> <b>[<%=n.getNdate() %>]</b><img src="./media/new.jpg" alt="" width="34px"></li>
                        
                        <%
                        }
                        %>
                        </ul>
                    </marquee>
                </div>
        
            </div>
        </div>
    </section>
    
    
    <section>
        <div class="container mt-5">
            <h3>GALLERY</h3>
            <div class="row justify-content-center galary">
                <div class="col-lg-2 col-6 p-2">
                    <img src="./media/background.jpg" alt="" class="img-fluid">
                </div>
                <div class="col-lg-2 col-6 p-2">
                    <img src="./media/banner.png" alt="" class="img-fluid">
                </div>
                <div class="col-lg-2 col-6 p-2">
                    <img src="./media/basketball.png" alt="" class="img-fluid">
                </div>
                <div class="col-lg-2 col-6 p-2">
                    <img src="./media/cafeteria.png" alt="" class="img-fluid">
                </div>
                <div class="col-lg-2 col-6 p-2">
                    <img src="./media/library.png" alt="" class="img-fluid">
                </div>
                <div class="col-lg-2 col-6 p-2">
                    <img src="./media/london.png" alt="" class="img-fluid">
                </div>
                
                
            </div> 
        </div>
    </section>
    
<!--     footer section -->
<%@include file="footer.jsp" %>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5eb391e4c9.js" crossorigin="anonymous"></script>

</body>
</html>