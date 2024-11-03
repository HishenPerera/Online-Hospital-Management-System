<!-- Doctor Imports -->

<%@ page import="com.AdminContent.Doctor.Model.Doctor" %>
<%@ page import="com.AdminContent.Doctor.DBUtil.DoctorDBUtil" %>

<%@ page import="java.util.List" %>

<%	
	List<Doctor> Doctors = DoctorDBUtil.viewAllDoctors();
    request.setAttribute("doctors", Doctors);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard </title>

<style>



.table-primary {
    background-image: linear-gradient(to bottom, #1c01a1,#001984); /* Change the header row background color */
    color: #00ffe7;
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
    
.table-bordered {
    border: none;
}

.table {
	border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
}    
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">
	<%@ include file="/pages/staff/includes/header.jsp" %>

	<h1 style="color:white; font-size:45px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Manage System All Doctors</h1>
    <table class="table" style="margin: 0 auto; width:1250px; margin-top:20px;">
    <tr class="table-primary">
        <th>Doctor ID</th>
        <th>Doctor Name</th>
        <th>Speciality</th>
        <th>Phone No</th>
        <th>DOC @Username</th>
        <th>DOC @Password</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${doctors}" var="doctor">
    <tr class="table-light">
        <td>${doctor.docId}</td>
        <td>${doctor.name}</td>
        <td>${doctor.speciality}</td>
        <td>${doctor.phone}</td>
        <td>${doctor.username}</td>
        <td>${doctor.password}</td>
        <td>
            <a href="${pageContext.request.contextPath}/pages/staff/admin/doctorContent/updateDoctor.jsp?docId=${doctor.docId}" class="btn btn-primary btn-sm">Update</a>
            <a href="${pageContext.request.contextPath}/deleteDoctor?id=${doctor.docId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this doctor?')">Delete</a>
        </td>
    </tr>
</c:forEach>
</table>

</body>
</html>