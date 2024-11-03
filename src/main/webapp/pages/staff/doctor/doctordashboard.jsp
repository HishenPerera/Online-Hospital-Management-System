<!-- PERERA M.H.S - IT23163218 -->
<%@ page import="com.AdminContent.Doctor.Model.Doctor" %>
<%@ page import="com.AdminContent.Doctor.DBUtil.DoctorDBUtil" %>

<%@ page import="java.util.List" %>
   
<!--Retriving Details Using Scriplets!-->
<%	
	List<Doctor> Doctors = DoctorDBUtil.viewAllDoctors();
    request.setAttribute("doctors", Doctors);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
    
    <style>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
   
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/docbg.jpg')">

    <%@ include file="/pages/staff/includes/header.jsp" %>
	
	<h1 style="color: #ecc900; font-size: 50px; font-weight: bold; text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9); text-align:center;">Doctor Dashboard</h1>
   
     <div class="row" style="margin-top:40px; width:80%; margin:95px auto;">
    	<div class="col-md-4">
    		<a href="${pageContext.request.contextPath}/pages/staff/doctor/addAttend.jsp" style="text-decoration: none; color: inherit; ">
        		<div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/dc1.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:300px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
            		<div class="card-body" style="padding-top: 0; text-align: center;">
                		<h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">Add Attendance</h5>
            		</div>
        		</div>
    		</a>
		</div>
		<div class="col-md-4">
    		<a href="${pageContext.request.contextPath}/pages/staff/doctor/allAttend.jsp" style="text-decoration: none; color: inherit; ">
        		<div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/dc2.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:300px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
            		<div class="card-body" style="padding-top: 0; text-align: center;">
                		<h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">All Doctors Attendance</h5>
            		</div>
        		</div>
    		</a>
		</div>
		<div class="col-md-4">
    		<a href="${pageContext.request.contextPath}/pages/staff/doctor/addAttend.jsp" style="text-decoration: none; color: inherit; ">
        		<div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/dc3.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:300px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
            		<div class="card-body" style="padding-top: 0; text-align: center;">
                		<h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">Online Sessions</h5>
            		</div>
        		</div>
    		</a>
		</div>
		
    
</div>
    
</body>
</html>