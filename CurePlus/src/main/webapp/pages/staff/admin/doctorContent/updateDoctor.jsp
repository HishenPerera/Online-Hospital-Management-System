<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.AdminContent.Doctor.DBUtil.DoctorDBUtil" %>
<%@ page import="com.AdminContent.Doctor.Model.Doctor" %>

<%
    int docId = Integer.parseInt(request.getParameter("docId"));
    Doctor doctor = DoctorDBUtil.selectSpecificDoctor(docId);
    request.setAttribute("doctor", doctor);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
        .form-group {
            width: 80%; /* adjust the width to your preference */
            margin: 0 auto; /* center the form */
            margin-top:30px;
        }
        
        label, button {
            color: #ffffff; /* change text color to white */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            font-size:18px;
        }
        
        button[type="submit"] {
        margin: 0 auto;
        display: block;
        font-size: 18px;
        padding: 8px 60px;
        border-radius:20px;
        
    </style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">

    <%@ include file="/pages/staff/includes/header.jsp" %>
    
    <h1 style="color:white; font-size:30px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Update Doctor</h1>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="${pageContext.request.contextPath}/updateDoc" method="POST">
                    <input type="hidden" name="docId" value="${doctor.docId}">
                    <div class="form-group">
                        <label for="name">Doctor Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${doctor.name}">
                    </div>
                    <div class="form-group">
                        <label for="speciality">Speciality:</label>
                        <select class="form-control" id="speciality" name="speciality" required>
                            <option value="${doctor.speciality}">${doctor.speciality}</option>
    						<option value="Cardiologist">Cardiologist</option>
    						<option value="Neurologist">Neurologist</option>
    						<option value="Orthopedic">Orthopedic</option>
    						<option value="Pediatrician">Pediatrician</option>
    						<option value="General Practitioner">General Practitioner</option>
    						<option value="Dermatologist">Dermatologist</option>
    						<option value="Gastroenterologist">Gastroenterologist</option>
    						<option value="Psychiatrist">Psychiatrist</option>
    						<option value="Endocrinologist">Endocrinologist</option>
    						<option value="Oncologist">Oncologist</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone No:</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${doctor.phone}">
                    </div>
                    <div class="form-group">
                        <label for="username">DOC @Username:</label>
                        <input type="text" class="form-control" id="username" name="username" value="${doctor.username}">
                    </div>
                    <div class="form-group">
                        <label for="password">DOC @Password:</label>
                        <input type="password" class="form-control" id="password" name="password" value="${doctor.password}">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Update Doctor Details"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>

</html>