<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Dashboard</title>
<style>
.dashboard-text {
    text-align: center;
    margin-bottom: 40px;
}
.dashboard-text h1 {
    font-size: 40px;
    font-weight: bold;
    color: #ecc900;
    text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
}
  .card.manage {
    position: relative; /* Add this */
}

.card-body {
    position: absolute; /* Add this */
    bottom: 0; /* Add this */
    width: 100%; /* Add this */
    padding-top: 0; /* Remove this */
    text-align: center;
}	
.card.manage:hover {
  	transform: translateY(-10px);
  	box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
  	filter: brightness(0.8);
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/repbg.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>

<div class="dashboard-text">
  <h1>Receptionist Dashboard</h1>
</div>  
  	
  	<div class="row" style="margin-top:40px; width:90%; margin:75px auto;">
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/pages/staff/receptionist/manageAppointment.jsp" style="text-decoration: none; color: inherit; ">
            <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/usd2.jpg'); background-size: cover; height: 440px; border-radius:40px; margin: 0 auto; width:340px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <div class="card-body" style="padding-top: 0; text-align: center;">
                    <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">Received Appointments</h5>
                </div>
            </div>
        </a>
    </div>
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/pages/staff/receptionist/manageAttend.jsp" style="text-decoration: none; color: inherit; ">
            <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/usd1.jpg'); background-size: cover; height: 440px; border-radius:40px; margin: 0 auto; width:340px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <div class="card-body" style="padding-top: 0; text-align: center;">
                    <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">Manage Doctors Attendance</h5>
                </div>
            </div>
        </a>
    </div>
    <div class="col-md-4">
        <a href="${pageContext.request.contextPath}/pages/staff/receptionist/manageShifts.jsp" style="text-decoration: none; color: inherit; ">
            <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/nr2.jpg'); background-size: cover; height: 440px; border-radius:40px; margin: 0 auto; width:340px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <div class="card-body" style="padding-top: 0; text-align: center;">
                    <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9); font-size: 40px; font-weight: bold; margin-bottom:40px">Manage Nureses Working Shifts</h5>
                </div>
            </div>
        </a>
    </div>s
 </div>   

</body>
</html>