<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    	int adm=(int)session.getAttribute("CurrentAdmin");
   		 if(adm == 0){
    			response.sendRedirect("Adminlogin.jsp");
   				 }
    %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <section class="profile-body" height="100vh">
        <div class="header">
            <div>
            <ul>
                <li><a href="AdminProfile.jsp" style="background-color:white;color:black;">Home</a></li>
                <li><a href="addNewDonor.jsp">Add New Donor</a></li>
                <li><a href="editDeleteDonor.jsp">Edit,Delete & List of Donor Details</a></li>
                <li><a href="manageStock.jsp">Manage Stock</a></li>
                <li><a href="requestForBlood.jsp">Request for Blood</a></li>
                <li><a href="requestCompleted.jsp">Request Completed</a></li>
            </ul>
            </div>
            <div>
                <h3><a href="AdminLogoutServlet">Logout</a></h3>
            </div>
        </div>

        <header class="section">
     
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
    </section>
</body>
</html>