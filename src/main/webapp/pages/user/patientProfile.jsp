<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.Patient.DBUtil.PatientDBUtil" %>
<%@ page import="com.Patient.Model.Patient" %>

<%
Patient loggedInPatient = (Patient) session.getAttribute("patient");
if (loggedInPatient != null) {
    String username = loggedInPatient.getUsername();
    Patient currentPatient = PatientDBUtil.selectSpecificPatient(username);
    request.setAttribute("patient", currentPatient);
} else {
    response.sendRedirect("login.jsp");
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<style>
    body {
        background-image: url('${pageContext.request.contextPath}/assets/images/patbg.jpg');
        background-size: cover;
    }
    .form-container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background-color: rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
    .form-container label {
        color: white;
    }
    .form-container input[type="text"], .form-container input[type="password"] {
        width: 80%;
    }
</style>

</head>
<body>
    <%@ include file="/pages/staff/includes/header.jsp" %>
    <div class="container">
        <div class="form-container">
            <h1 style="color: white;">Edit Your Profile</h1>
            <form action="${pageContext.request.contextPath}/profileUpdate" method="post">
                <div class="form-group">
                    <label for="id"></label>
                    <input type="hidden" name="id" value="${patient.id}">
                    <p>${patient.id}</p>
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" name="name" value="${patient.name}" class="form-control">
                </div>
                <div class="form-group">
                    <label for="age">Age:</label>
                    <input type="text" name="age" value="${patient.age}" class="form-control">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" name="address" value="${patient.address}" class="form-control">
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="phone" value="${patient.phone}" class="form-control">
                </div>
                <div class="form-group">
                    <label for="allergies">Allergies:</label>
                    <input type="text" name="allergies" value="${patient.allergies}" class="form-control">
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" value="${patient.username}" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" value="${patient.password}" class="form-control">
                </div>
                <div class="form-group">
    				<label for="confirmPassword">Confirm Password:</label>
    				<input type="password" name="confirmPassword" class="form-control">
				</div>
                <button type="submit" class="btn btn-primary">Update Profile</button>
            </form>
            <p style="color: red">${message}</p>
        </div>
    </div>
    
    <script>
    document.querySelector('form').addEventListener('submit', function(event) {
        var password = document.querySelector('input[name="password"]').value;
        var confirmPassword = document.querySelector('input[name="confirmPassword"]').value;

        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            event.preventDefault(); // Prevent form submission
        }
    });
</script>
</body>
</html>