<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    label, input, button {
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
    
    .error-message {
        color: #00ffe7;
    }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">
	
	<%@ include file="/pages/staff/includes/header.jsp" %>
    <h1 style="color:white; font-size:30px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Add New Doctor to the System</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form id="doctorForm" action="${pageContext.request.contextPath}/InsertDoctor" method="POST" onsubmit="return validatePasswords()">
                    <div class="form-group">
                        <label for="name">Doctor's Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required oninput="addDrPrefix(this)"/>
                    </div>
                    
                    <div class="form-group">
                        <label for="speciality">Doctor's Speciality:</label>
                        <select class="form-control" id="speciality" name="speciality" required>
                            <option value="">Select Speciality</option>
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
                        <label for="phone">Doctor's Phone No:</label>
                        <input type="text" class="form-control" id="phone" name="phone" required pattern="\d{10}" title="Please enter a 10-digit phone number."/>
                        <span class="error-message"></span>
                    </div>
                    
                    <div class="form-group">
                        <label for="username">Login Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required oninput="addDocPrefix(this)"/>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Login Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required pattern=".{8,}" title="Password must be at least 8 characters long."/>
                        <span class="error-message"></span>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password:</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required/>
                        <span class="error-message" id="passwordError"></span>
                    </div>
                    
                    <input type="submit" class="btn btn-primary" value="Insert Doctor"/>
                </form>
            </div>
        </div>
    </div>

    <script>
        function addDrPrefix(inputField) {
            var value = inputField.value;
            if (!value.startsWith("Dr. ")) {
                inputField.value = "Dr. " + value;
            }
        }

        function addDocPrefix(inputField) {
            var value = inputField.value;
            if (!value.startsWith("DOC@")) {
                inputField.value = "DOC@" + value;
            }
        }
        
        document.getElementById("phone").addEventListener("input", function() {
            const phoneInput = this;
            const errorMessage = phoneInput.nextElementSibling; // Get the next sibling (error message span)

            if (phoneInput.value.length !== 10 || isNaN(phoneInput.value)) {
                errorMessage.textContent = "Phone number must be exactly 10 digits.";
            } else {
                errorMessage.textContent = ""; // Clear error message
            }
        });

        function validatePasswords() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const passwordError = document.getElementById("passwordError");

            if (password !== confirmPassword) {
                passwordError.textContent = "Passwords do not match!";
                return false; // Prevent form submission
            }

            passwordError.textContent = ""; // Clear error message
            return true; // Allow form submission
        }
        
        
    </script>
</body>
</html>
