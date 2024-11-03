<%@ page import="com.Attend.Model.Attend" %>
<%@ page import="com.Attend.DBUtil.AttendDBUtil" %>
<%@ page import="java.util.List" %>

<%
    java.util.Date today = new java.util.Date();
    String todayStr = String.format("%tF", today); // Format: yyyy-MM-dd
%>

<%	
	List<Attend> Attends = AttendDBUtil.getAllAttendance();
    request.setAttribute("attends", Attends);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
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

h3 {
    font-size: 20px;
    font-weight: bold;
    color: white;
    text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
    text-align:center;
}

 
.hovercard {
    position: relative;
    padding: 0;
    margin: 0;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 40px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    height: 250px; /* set a fixed height */
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
    font-size: 50px;
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
<script>
function filterCards() {
    const input = document.getElementById("dateInput").value;
    const cards = document.getElementsByClassName("hovercard");

    for (let card of cards) {
        const cardDate = card.getAttribute("data-date");
        if (cardDate === input || input === "") {
            card.style.display = "block"; // Show card
        } else {
            card.style.display = "none"; // Hide card
        }
    }
}
</script>
</head>

<body style="background-image: url('${pageContext.request.contextPath}/assets/images/patbg.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>
    <h1>Doctors Attendance for Appointments</h1>

	<h3>Search by Date</h3>
    <div style="text-align: center; margin: 20px;">
    	<input type="date" id="dateInput" onchange="filterCards()" min="<%= todayStr %>" class="form-control" style="border-radius: 20px; width: 200px; display: inline-block;" />
	</div>


    <div class="row" style="max-width:80%; margin: 20px auto;">
        <c:forEach items="${attends}" var="attend">
            <div class="col-md-3">
                <div class="card hovercard" data-date="${attend.date}">
                    <div class="card-body info">
                        <i class="fa fa-user-md" aria-hidden="true"></i>
                        <h4>${attend.attendDetails}</h4>
                        <p>Date : ${attend.date}</p>
                        <p>Morning Hours : ${attend.morning}</p>
                        <p>Night Hours : ${attend.night}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
