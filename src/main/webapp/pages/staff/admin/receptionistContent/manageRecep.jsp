<%@ page import="com.AdminContent.Recep.Model.Recep" %>
<%@ page import="com.AdminContent.Recep.DBUtil.RecepDBUtil" %>

<%@ page import="java.util.List" %>

<%	
	List<Recep> Receps = RecepDBUtil.viewAllReceps();
    request.setAttribute("receps", Receps);
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
    background-image: linear-gradient(to bottom, #1c01a1,#001984); 
    color: #00ffe7;
    font-size:17px;
    font-family:sans-serif;
     
}

.table-light {
    background-image: linear-gradient(to bottom, #1c01a1, #002fff); 
    color: #ffffff; 
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

	<h1 style="color:white; font-size:45px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Manage System All Receptionist</h1>
    <table class="table" style="margin: 0 auto; width:1250px; margin-top:20px;">
    <tr class="table-primary">
        <th>ID</th>
        <th>Receptionist Name</th>
        <th>Phone No</th>
        <th>RCP @Username</th>
        <th>RCP @Password</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${receps}" var="recep">
        <tr class="table-light">
            <td>${recep.id}</td>
            <td>${recep.name}</td>
            <td>${recep.phone}</td>
            <td>${recep.username}</td>
            <td>${recep.password}</td>
            <td>
                <a href="${pageContext.request.contextPath}/pages/staff/admin/receptionistContent/updateRecep.jsp?id=${recep.id}" class="btn btn-primary btn-sm">Update</a>
                <a href="${pageContext.request.contextPath}/deleteRecep?id=${recep.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this receptionist?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>