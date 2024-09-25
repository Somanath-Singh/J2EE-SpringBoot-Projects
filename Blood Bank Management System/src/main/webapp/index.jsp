<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <header class="section">
        <div class="nav">
            <div>
                <img src="./media/logo1.png" alt="" width="50px">
            </div>
            <div>
                <ul>
                    <li><a href="./index.jsp">Home</a></li>
                    <li><a href="#Request-info">Request</a></li>
                    <li><a href="#Reading-info">Read</a></li>
                    <li><a href="./AdminLogin.jsp">Admin</a></li>
                </ul>
            </div>
        </div>
    
        <p>Welcome to Blood Bank ..</p>
        <hr>
    
        <div class="description">
           <p>A blood bank is a center where blood gathered as a result of blood donation is stored and preserved for later use in
        blood transfusion. The term "blood bank" typically refers to a department of a hospital usually within a clinical
        pathology laboratory where the storage of blood product occurs and where pre-transfusion and blood compatibility testing
        is performed. However, it sometimes refers to a collection center, and some hospitals also perform collection. Blood
        banking includes tasks related to blood collection, processing, testing, separation, and storage.</p>
        </div>
    
        <hr>
        <p>Donate Blood Save life .</p>
        <h4>
            A blood donation occurs when a person voluntarily has blood drawn and used for transfusions and/or made into
            biopharmaceutical medications by a process called fractionation (separation of whole blood components). Donation may be
            of whole blood, or of specific components directly (apheresis). Blood banks often participate in the collection process
            as well as the procedures that follow it.
        </h4>
    </header>

    <section class="read" id="Reading-info">

        <div class="read-sub">
            <div>
                <img src="./media/thakyou.jpeg" alt="">
            </div>
            <div>
                <p>Today in the developed world, most blood donors are unpaid volunteers who donate blood for a community supply. In some
                countries, established supplies are limited and donors usually give blood when family or friends need a transfusion
                (directed donation). Many donors donate for several reasons, such as a form of charity, general awareness regarding the
                demand for blood, increased confidence in oneself, helping a personal friend or relative, and social pressure. Despite
                the many reasons that people donate, not enough potential donors actively donate. However, this is reversed during
                disasters when blood donations increase, often creating an excess supply that will have to be later discarded. In
                countries that allow paid donation some people are paid, and in some cases there are incentives other than money such as
                paid time off from work. People can also have blood drawn for their own future use (autologous donation). Donating is
                relatively safe, but some donors have bruising where the needle is inserted or may feel faint.
                
                Potential donors are evaluated for anything that might make their blood unsafe to use. The screening includes testing
                for diseases that can be transmitted by a blood transfusion, including HIV and viral hepatitis. The donor must also
                answer questions about medical history and take a short physical examination to make sure the donation is not hazardous
                to their health. How often a donor can donate varies from days to months based on what component they donate and the
                laws of the country where the donation takes place. For example, in the United States, donors must wait 56 days (eight
                weeks) between whole-blood donations but only seven days between platelet apheresis donations[1] and twice per seven-day
                period in plasmapheresis.
                
                The amount of blood drawn and the methods vary. The collection can be done manually or with automated equipment that
                takes only specific components of the blood. Most of the components of blood used for transfusions have a short shelf
                life, and maintaining a constant supply is a persistent problem. This has led to some increased interest in
                autotransfusion, whereby a patient's blood is salvaged during surgery for continuous reinfusion—or alternatively, is
                self-donated prior to when it will be needed.</p>
            </div>
        </div>

    </section>

    <section class="information" id="Request-info">
        <div>
                <fieldset>
                	<%
                		String msg=request.getParameter("msg");
                		if("Valid".equals(msg)){
                	%>
                		<center><font color="green" size="5">Form submitted successfully. you will get notified with in 24 hours .</font></center>
                	<%
                		}
                	%>
                <% 
                if("InValid".equals(msg))
                	{
                	%>
                		<center><font color="red" size="5">Invalid Details ! Try again ..</font></center>
                	<%
                	}
                	%>
                	
                    <legend>Enter your details to request for blood  </legend>
                    <form action="indexFormAction.jsp" method="POST">
                        <div>
                            <label for="name">Enter your Name :</label>
                            <br>
                            <input type="text" id="name" name="uname" required>
                        </div>
                        <div>
                            <label for="email">Enter Email id :</label>
                            <br>
                            <input type="email" id="email" name="uemail" required>
                        </div>
                        <div>
                            <label for="mob">Enter Mobile No :</label>
                            <br>
                            <input type="text" id="mob" name="umobile" required>
                        </div>
                        <div>
                            <label for="gen">Select Gender :</label>
                            <input type="radio" value="Male" id="gen" name="gender" required>Male
                            <input type="radio" value="Female" id="gen" name="gender" required>Female
                        </div>
                        <div>
                            <label for="branch">Select Blood group :</label>
                            <br>
                            <select name="group" id="branch" required>
                                <option selected disabled>Select Group ...</option>
                                <option value="A+">A+</option>
                                <option value="B+">B+</option>
                                <option value="AB+">AB+</option>
                                <option value="O+">O+</option>
                                <option value="A-">A-</option>
                                <option value="B-">B-</option>
                                <option value="AB-">AB-</option>
                                <option value="O-">O-</option>
                            </select>
                        </div>
                        <div>
                            <button type="submit">Request</button>
                        </div>
                    
                    </form>
                </fieldset>
        </div>
    </section>
</body>
</html>