<!-- Admin Imports -->

<%@ page import="com.Admin.Model.Admin" %>
<%@ page import="com.Admin.DBUtil.AdminDBUtil" %>

<%@ page import="java.util.List" %>

<%	
	List<Admin> Admins = AdminDBUtil.viewAllAdmins();
    request.setAttribute("admins", Admins);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

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

	<h1 style="color:white; font-size:45px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Manage System All Administrators</h1>
    <table class="table" style="margin: 0 auto; width:1250px; margin-top:20px;">
    <tr class="table-primary">
        <th>Administrator ID</th>
        <th>Administrator Name</th>
        <th>Phone No</th>
        <th>Email</th>
        <th>ADM @Username</th>
        <th>ADM @Password</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${admins}" var="admin">
        <tr class="table-light">
            <td>${admin.id}</td>
            <td>${admin.name}</td>
            <td>${admin.phone}</td>
            <td>${admin.email}</td>
            <td>${admin.username}</td>
            <td>${admin.password}</td>
            <td>
                <a href="${pageContext.request.contextPath}/pages/staff/admin/adminContent/updateAdmin.jsp?id=${admin.id}" class="btn btn-primary btn-sm">Update</a>
                <a href="${pageContext.request.contextPath}/deleteAdmin?id=${admin.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this admin?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>