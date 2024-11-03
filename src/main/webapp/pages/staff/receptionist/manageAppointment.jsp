<!-- Doctor Imports -->

<%@ page import="com.Appointment.Model.Appointment" %>
<%@ page import="com.Appointment.DBUtil.AppointmentDBUtil" %>

<%@ page import="java.util.List" %>

<%	
	List<Appointment> Appointments = AppointmentDBUtil.getAllAppointments();
    request.setAttribute("appointments", Appointments);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Dashboard</title>

<style>



.table-primary {
    background-image: linear-gradient(to bottom, #2c00ab ,#0b00ec); /* Change the header row background color */
    color:  #00ffe7;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    font-size:17px;
    font-family:sans-serif;
    
     /* Change the header row text color */
}

.table-light {
    background-image: linear-gradient(to bottom, #1c01a1, #002fff); /* Change the row background color */
    color: #ffffff; /* Change the row text color */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    font-size:15px;
    font-family:Helvetica;
    font-weight:bold;	
    border-bottom: 1px solid #ffffff;
	border-radius:20px;
}    
.table-bordered {
    border: none;
}

.table {
	border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
}    

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/repbg.jpg')">
	<%@ include file="/pages/staff/includes/header.jsp" %>

	<h1 style="color:white; font-size:45px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Manage All Appointments</h1>
    
    <!-- Search Bar -->
	<div class="input-group" style="text-align: center; margin-top: 20px; display: flex; margin-left:600px; gap:10px; ">
  		<input type="text" id="search-input" class="form-control" placeholder="Search by Doctor's Name or Speciality" style="width: 300px; height: 40px; font-size: 16px; border-radius: 20px;">
  		<div class="input-group-append">
    		<button id="search-btn" class="btn btn-primary" style="height: 40px; font-size: 16px; border-radius: 20px;">Search</button>
  		</div>
	</div>

<!-- Modify the table to display filtered appointments -->
<table id="appointment-table" class="table" style="margin: 0 auto; width:1350px; margin-top:20px;">
    <tr class="table-primary">
        <th>ID</th>
        <th>Patient Name</th>
        <th>Patient Age</th>
        <th>Phone No</th>
        <th>Patient Allergies</th>
        <th>Doctor & Specilaity</th>
        <th>Appointment Date</th>
        <th>Time Hours</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${appointments}" var="appoint">
    <tr class="table-light">
        <td>${appoint.appointmentId}</td>
        <td>${appoint.patientName}</td>
        <td>${appoint.patientAge}</td>
        <td>${appoint.patientPhone}</td>
        <td>${appoint.patientAllergies}</td>
        <td>${appoint.selectDoctor}</td>
        <td>${appoint.date}</td>
        <td>${appoint.time}</td>
        <td>
            <a href="${pageContext.request.contextPath}/deleteAppointment?appointmentId=${appoint.appointmentId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this appointment?')">Delete</a>
        </td>
    </tr>
</c:forEach>
</table>

<!-- Add JavaScript code to filter appointments based on search input -->
<script>
    $(document).ready(function() {
        $("#search-btn").click(function() {
            var searchInput = $("#search-input").val().toLowerCase();
            var rows = $("#appointment-table tr");
            rows.hide();
            rows.filter(function() {
                var doctorName = $(this).find("td:eq(5)").text().toLowerCase();
                return doctorName.indexOf(searchInput) !== -1 || $(this).hasClass("table-primary");
            }).show();
        });
    });
</script>

</body>
</html>