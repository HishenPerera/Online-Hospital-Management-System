<%@ page import="com.Patient.Model.Patient" %>
<%@ page import="com.Patient.DBUtil.PatientDBUtil" %>

<%@ page import="java.util.List" %>

<%	
	List<Patient> Patients = PatientDBUtil.viewAllPatients();
    request.setAttribute("patients", Patients);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
 h1 {
    font-size: 40px;
    font-weight: bold;
    color: #ecc900;
    text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
    text-align:center;
}

/* Modified CSS styles */
.hovercard {
    position: relative;
    padding: 0;
    margin: 0;
    background-color: rgba(0, 0, 0.7, 0.8);
    border-radius: 40px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    height: 190px; /* set a fixed height */
    width: 260px; /* set a fixed width */
    transition: all 0.3s ease-in-out;
}

.hovercard .card-body {
	margin-top:40px;
    padding: 20px;
    text-align: center;
    height: 100%; 
    justify-content: center; /* add this line to center the content horizontally */
    align-items: center; /* add this line to center the content vertically */
}

.hovercard .card-body h4 {
    margin-top: 6px;
    font-size: 18px;
    color: #fff;
    text-align: center; /* add this line to center the heading */
}

.hovercard .card-body i {
    font-size: 40px;
    color: #fff;
    margin-top: 2px;
}

.hovercard .card-body p {
    font-size: 14px;
    color: #fff;
}

.hovercard:hover {
    transform: translateY(-10px);
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease-in-out;
}
</style>
</head>

<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>
	<h1>All Registered Patients</h1>
	
	<div class="row" style="max-width:80%; margin: 40px auto;">
    <c:forEach items="${patients}" var="patient">
        <div class="col-md-3">
            <div class="card hovercard">
                <div class="card-body info">
                	<i class="fa fa-user-plus" aria-hidden="true"></i>
                    <h4> ${patient.name}</h4>
                    <p>${patient.age}</p>
                    <p>${patient.address}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
	
</body>
</html>