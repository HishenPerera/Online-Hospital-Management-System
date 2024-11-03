<%@ page import="com.Shift.Model.Shift" %>
<%@ page import="com.Shift.DBUtil.ShiftDBUtil" %>
<%@ page import="java.util.List" %>

<%	
	List<Shift> shifts = ShiftDBUtil.getAllShifts();
    request.setAttribute("shifts", shifts);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nurse Dashboard</title>
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
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 70px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    height: 200px; /* set a fixed height */
    width: 320px; /* set a fixed width */
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
    margin-top: 10px;
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

<body style="background-image: url('${pageContext.request.contextPath}/assets/images/nrb.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>
	<h1>All Shifts</h1>
	
	<div class="row" style="max-width:80%; margin: 40px auto;">
    <c:forEach items="${shifts}" var="shift">
        <div class="col-md-4">
            <div class="card hovercard">
                <div class="card-body info">
                	<i class="fa fa-user" aria-hidden="true"></i>
                    <h4> ${shift.details}</h4>
                    <h4>${shift.shift}</h4>
                    <p>${shift.date} </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
	
</body>
</html>