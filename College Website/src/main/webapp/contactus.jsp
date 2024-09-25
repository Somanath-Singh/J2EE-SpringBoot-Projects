<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@500&display=swap');
    </style>
</head>
<body>
    
    <!--     navbar -->
<%@include file="navbar.jsp" %>

  <section>
        <div class="container mt-5 intro-page">
            <div class="row justify-content-around text-center">
                <div class="col-lg-9 pt-5">
                    <h2 class="head">WELCOME TO MYCOMP SOCIETY </h2>
                    <p  class="para">Indira Gandhi Institute of Technology (IGIT), Sarang was established in the year of 1982 and was managed directly by the
                    Govt. of Odisha in the name of Odisha College of Engineering (OCE). Prior to this, since 1981, the institute in the name
                    of Modern Polytechnic (MPT) was offering Diploma Courses in Civil, Electrical, Mechanical, Mining Survey Engineering.In
                    the year 1987, both OCE & MPT were merged and renamed as IGIT, Sarang and the management was transferred to an
                    Autonomous Society.</p>
                </div>
                 <div class="col-lg-3">
                    <div class="card">
                        <img src="./media/SasmitaMam.JPG" class="card-img-top" alt="..." height="210px">
                        <div class="card-body">
                            <p class="card-text"><b>Prof. Dr. Sasmita Mishra</b>
                            <br>HOD Of CSEA</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--location-->
    <section>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3726.4348499826197!2d85.2633077!3d20.935045199999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a18b5e2246737db%3A0x464c86301dac34cb!2sIndira%20Gandhi%20Institute%20Of%20Technology%2C%20Sarang!5e0!3m2!1sen!2sin!4v1686379739849!5m2!1sen!2sin"
                        width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
        </div>
    </section>
        
    <section>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-6 text-center contact_col">
                    <div>
                        <i class="fa-solid fa-house"></i>
                        <span>
                            <h5>xyz Road ,ABC Building</h5>
                            <p>Dhenkanal,Odisha</p>
                        </span>
                    </div>
                    <div>
                        <i class="fa-solid fa-phone"></i>
                        <span>
                            <h5>+91 98564-63214</h5>
                            <p>Monday to Saturday, 10AM to 6PM</p>
                        </span>
                    </div>
                    <div>
                        <i class="fa-solid fa-envelope"></i>
                        <span>
                            <h5>helloome@learn.com</h5>
                            <p>Email us your query</p>
                        </span>
                    </div>
                </div>
                <div class="col-lg-6 contact">
                
                 <form>
            <h4>Contact Form</h4>
            <div class="mb-3">
              <input type="text" class="form-control" id="name" placeholder="Enter Your Name" required>
            </div>
            <div class="mb-3">
              <input type="email" class="form-control" id="email" placeholder="Enter Your Email" required>
            </div>
            <div class="mb-3">
              <input type="email" class="form-control" id="subject" placeholder="Enter Subject" required>
            </div>
            <div class="mb-3">
              <textarea class="form-control" id="message" rows="3" required></textarea>
            </div>
            <input type="button" class="btn btn-primary" value="Send" onclick="sendMail()">
          </form>
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
    
    
    <!-- //script for sending mail -->
    <script src="https://smtpjs.com/v3/smtp.js"></script>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
      function sendMail(){
        console.log("function call");
        
        var Name=document.getElementById("name").value;
        var mail=document.getElementById("email").value;
        var sub=document.getElementById("subject").value;
        var mess=document.getElementById("message").value;

        var body="Name : "+Name+"<br/>Email : "+mail+"<br/>Subject : "+sub+"<br/>Message : "+mess;

        Email.send({
          SecureToken : "6d1b05a2-a876-40d3-911d-58f8d015b64c",
          To : "sanjaykumarpanda54@gmail.com",
          From : "sanjaykumarpanda54@gmail.com",
          Subject : sub,
          Body : body
        }).then(
          message =>{
            if(message=='OK'){
              swal("Successful", "Your data successfull Received", "success");
            }
            else{
              swal("Something Wrong", "Your data not Received", "error")
            }
          }
        );
      }
    </script>
    
    
</body>
</html>