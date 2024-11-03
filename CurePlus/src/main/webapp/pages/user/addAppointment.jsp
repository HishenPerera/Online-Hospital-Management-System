<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.AdminContent.Doctor.Model.Doctor" %>
<%@ page import="com.AdminContent.Doctor.DBUtil.DoctorDBUtil" %>
<%@ page import="java.util.List" %>

<%
    java.util.Date today = new java.util.Date();
    String todayStr = String.format("%tF", today); // Format: yyyy-MM-dd
%>

<%
    List<Doctor> Doctors = DoctorDBUtil.viewAllDoctors();
    request.setAttribute("doctors", Doctors);
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
        h1 {
            font-size: 40px;
            font-weight: bold;
            color: white;
            text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
            text-align: center;
        }
        
        p {
            font-size: 20px;
            font-weight: bold;
            color: white;
            text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
            text-align: center;    
        }
        
        .form-center {
            margin: 0 auto;
            width: 30%;
            background-color: rgba(5.9, 5.7, 3.9, 0.4); 
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .label-color {
            color: white;
        }
        
        .input-field {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        
        .form-horizontal .control-label {
            text-align: left;
        }
    </style>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/patbg.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>
    <h1>Appointment Form</h1>
    <p style="color:yellow;">Please Check the Doctors Attendance Before make an Appointment.</p>
  
    <div class="form-center">
        <form action="${pageContext.request.contextPath}/InsertAppointment" method="post" class="form-horizontal" onsubmit="return validateForm()">
            <!-- Patient Name -->
            <div class="form-group">
                <label class="control-label label-color">Patient Name:</label><br>
                <input type="text" name="patientName" class="input-field form-control" required pattern="[A-Za-z\s]+" 
                       title="Please enter a valid name (letters and spaces only)."/>
                <span class="error-message" id="nameError"></span>
            </div>
            
            <!-- Patient Age -->
            <div class="form-group">
                <label class="control-label label-color">Patient Age:</label><br>
                <input type="number" name="patientAge" class="input-field form-control" required min="1" max="120" 
                       oninput="this.setCustomValidity(''); if (this.value < 1 || this.value > 120) { this.setCustomValidity('Please enter a valid age between 1 and 120.'); }" 
                       oninvalid="this.setCustomValidity('Please enter a valid age between 1 and 120.')" />
                <span class="error-message" id="ageError"></span>
            </div>
            
            <!-- Phone Number -->
            <div class="form-group">
                <label class="control-label label-color">Phone No:</label><br>
                <input type="tel" name="patientPhone" class="input-field form-control" required pattern="[0-9]{10}" 
                       title="Please enter a valid 10-digit phone number."
                       oninvalid="this.setCustomValidity('Please enter a valid 10-digit phone number.')" 
                       oninput="this.setCustomValidity('')" />
                <span class="error-message" id="phoneError"></span>
            </div>
            
            <!-- Allergies -->
            <div class="form-group">
                <label class="control-label label-color">Allergies:</label><br>
                <input type="text" name="patientAllergies" class="input-field form-control" required />
                <span class="error-message" id="allergiesError"></span>
            </div>
            
            <!-- Select Doctor -->
            <div class="form-group">
                <label class="control-label label-color">Select a Doctor:</label><br>
                <select name="selectDoctor" class="input-field form-control" required>
                    <option value="" disabled selected>Choose a Doctor</option>
                    <c:forEach items="${doctors}" var="doctor">
                        <option value="${doctor.name} - ${doctor.speciality}">${doctor.name} - ${doctor.speciality}</option>
                    </c:forEach>
                </select>
                <span class="error-message" id="doctorError"></span>
            </div>
            
            <!-- Appointment Date -->
            <div class="form-group">
                <label class="control-label label-color">Appointment Date:</label><br>
                <input type="date" name="date" class="input-field form-control" required min="<%= todayStr %>" />
                <span class="error-message" id="dateError"></span>
            </div>
            
            <!-- Time Selection -->
            <div class="form-group">
                <label class="control-label label-color">Time Hours:</label><br>
                <select name="time" class="input-field form-control" required>
                    <option value="" disabled selected>Choose Time Hours</option>
                    <option value="Morning Hours (6.00 a.m - 8.00 a.m)">Morning Hours (6.00 a.m - 8.00 a.m)</option>
                    <option value="Night Hours (6.00 p.m - 9.00 p.m)">Night Hours (6.00 p.m - 9.00 p.m)</option>
                </select>
                <span class="error-message" id="timeError"></span>
            </div>
            
            <!-- Submit Button -->
            <div class="form-group">
                <div class="col-sm-12 text-center">
                    <input type="submit" value="Book Appointment" class="btn btn-primary"/>
                </div>
            </div>
        </form>
    </div>
    
    <script>
        function validateForm() {
            let isValid = true;

            // Clear previous error messages
            document.getElementById("ageError").textContent = "";
            document.getElementById("phoneError").textContent = "";

            // Validate Patient Age
            const ageInput = document.querySelector('input[name="patientAge"]');
            if (!ageInput.checkValidity()) {
                document.getElementById("ageError").textContent = "Please enter a valid age between 1 and 120.";
                isValid = false;
            }

            // Validate Phone Number
            const phoneInput = document.querySelector('input[name="patientPhone"]');
            if (!phoneInput.checkValidity()) {
                document.getElementById("phoneError").textContent = "Please enter a valid 10-digit phone number.";
                isValid = false;
            }


            return isValid; // Allow or prevent form submission
        }
    </script>
</body>
</html>
