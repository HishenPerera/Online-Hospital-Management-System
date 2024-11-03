<%@ page import="com.AdminContent.Doctor.Model.Doctor" %>
<%@ page import="com.AdminContent.Doctor.DBUtil.DoctorDBUtil" %>
<%@ page import="java.util.List" %>

<%	
    // Fetching the list of doctors from the database
	List<Doctor> Doctors = DoctorDBUtil.viewAllDoctors();
    // Setting the list of doctors as a request attribute for use in the JSP
    request.setAttribute("doctors", Doctors);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <!-- Including Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <!-- Including Bootstrap JS for interactivity -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!-- Including jQuery for DOM manipulation -->
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Custom CSS for header -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">

    <style>
        /* Styling for the main heading */
        h1 {
            font-size: 40px;
            font-weight: bold;
            color: #ecc900;
            text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
            text-align:center;
        }

        /* Card styling for management actions */
        .card.manage {
            position: relative;
        }

        .card-body {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding-top: 0;
            text-align: center;
        }	

        /* Hover effect for cards */
        .card.manage:hover {
            transform: translateY(-10px);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
            filter: brightness(0.8);
        }

        /* Styling for the edit profile button */
        .edit-profile-btn {
            background-color: #1c01a1;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }

        /* Hover effect for the edit profile button */
        .edit-profile-btn:hover {
            background-color: #001984;
        }
    </style>

    <script>
        // Function to show a popup message
        function showPopup(message) {
            alert(message);
        }
    </script>
</head>

<body style="background-image: url('${pageContext.request.contextPath}/assets/images/patbg.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>
    <h1>Patient Dashboard</h1>
	
    <%
        // Check if there is a message to display
        String message = request.getParameter("message");
        if (message != null) {
    %>
        <script>
            // Show the popup with the message
            showPopup("<%= message %>");
        </script>
    <%
        }
    %>
	
    <div style="text-align: center;">
        <!-- Button to edit user profile -->
		<button class="edit-profile-btn" onclick="location.href='${pageContext.request.contextPath}/pages/user/patientProfile.jsp'">Edit Profile</button>
	</div>
    
    <div class="row" style="margin-top:40px; width:90%; margin:75px auto;">
        <!-- Card for adding appointment -->
        <div class="col-md-3">
            <a href="${pageContext.request.contextPath}/pages/user/addAppointment.jsp" style="text-decoration: none; color: inherit;">
                <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/usd2.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:280px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                    <div class="card-body">
                        <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0. 5); font-size: 40px; font-weight: bold; margin-bottom:40px">Add Appointment</h5>
                    </div>
                </div>
            </a>
        </div>
        <!-- Card for viewing available doctors -->
        <div class="col-md-3">
            <a href="${pageContext.request.contextPath}/pages/user/availableDoc.jsp" style="text-decoration: none; color: inherit;">
                <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/usd1.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:280px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                    <div class="card-body">
                        <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">Doctors Attendance</h5>
                    </div>
                </div>
            </a>
        </div>
        <!-- Card for viewing all doctors -->
        <div class="col-md-3">
            <a href="${pageContext.request.contextPath}/pages/user/allDocs.jsp" style="text-decoration: none; color: inherit;">
                <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/dc1.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:280px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                    <div class="card-body">
                        <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">All Doctors</h5>
                    </div>
                </div>
            </a>
        </div>
        <!-- Card for viewing medicine inventory -->
        <div class="col-md-3">
            <a href="${pageContext.request.contextPath}/pages/user/medicineInventory.jsp" style="text-decoration: none; color: inherit;">
                <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/usd3.jpg'); background-size: cover; height: 400px; border-radius:40px; margin: 0 auto; width:280px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                    <div class="card-body">
                        <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; margin-bottom:40px">Medinices Inventory</h5>
                    </div>
                </div>
            </a>
        </div>
    </div>
    
</body>

</html>