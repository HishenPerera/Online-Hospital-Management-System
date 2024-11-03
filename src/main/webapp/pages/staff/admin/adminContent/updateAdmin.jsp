<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.Admin.DBUtil.AdminDBUtil" %>
<%@ page import="com.Admin.Model.Admin" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Admin admin = AdminDBUtil.selectSpecificAdmin(id);
    request.setAttribute("admin", admin);
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
        
        label, input, button {
            color: #ffffff; /* change text color to white */
            font-size:20px;
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
    
    <h1 style="color:white; font-size:30px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Update Administrator</h1>
    
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="${pageContext.request.contextPath}/updateAdmin" method="POST">
                    <input type="hidden" name="id" value="${admin.id}">
                    <div class="form-group">
                        <label for="name">Administrator Name:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${admin.name}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone No:</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${admin.phone}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Email:</label>
                        <input type="text" class="form-control" id="email" name="email" value="${admin.email}">
                    </div>
                    <div class="form-group">
                        <label for="username">ADM @Username:</label>
                        <input type="text" class="form-control" id="username" name="username" value="${admin.username}">
                    </div>
                    <div class="form-group">
                        <label for="password">ADM @Password:</label>
                        <input type="password" class="form-control" id="password" name="password" value="${admin.password}">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Update Administrator Details"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>

</html>