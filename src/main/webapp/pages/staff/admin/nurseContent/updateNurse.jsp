<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.AdminContent.Nurse.DBUtil.NurseDBUtil" %>
<%@ page import="com.AdminContent.Nurse.Model.Nurse" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
	Nurse nurse = NurseDBUtil.selectSpecificNurse(id);
    request.setAttribute("nurse", nurse);
%>



<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
    .form-group {
        width: 80%; /* adjust the width to your preference */
        margin: 0 auto; /* center the form */
        margin-top: 30px;
    }
    
    label, button {
        color: #ffffff; /* change text color to white */
        font-size: 18px;
    }
    
    button[type="submit"] {
        margin: 0 auto;
        display: block;
        font-size: 18px;
        padding: 8px 60px;
        border-radius: 20px;
    }
    
    h1 {
        color: white;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
    }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">
	
	<%@ include file="/pages/staff/includes/header.jsp" %>
    <h1 style="color:white; font-size:30px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Update Nurse Details</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="${pageContext.request.contextPath}/updateNurse" method="POST">
                <input type="hidden" name="id" value="${nurse.id}">
                    <div class="form-group">
                        <label for="name">Nurse Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${nurse.name}">
                    </div>
                     <div class="form-group">
                        <label for="phone">Phone No:</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${nurse.phone}">
                    </div>
                    <div class="form-group">
                        <label for="username">@Username:</label>
                        <input type="text" class="form-control" id="username" name="username" value="${nurse.username}">
                    </div>
                    <div class="form-group">
                        <label for="password">@Password:</label>
                        <input type="password" class="form-control" id="password" name="password" value="${nurse.password}">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Update Nurse Details"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>