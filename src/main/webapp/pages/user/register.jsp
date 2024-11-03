<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register CurePlus</title>
    <!-- Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/header.css">

    <style>
        /* Custom styles for card body and card */
        .card-body {
            border: none; /* Remove border from card body */
        }
        .card {
            border: none; /* Remove border from card */
        }
        body {
            color: black; /* Set body text color */
        }
        label {
            font-size: 20px; /* Set label font size */
            text-shadow: 6px 6px 8px rgba(0.3, 0.4, 0.6, 0.7); /* Add text shadow to labels */
            font-weight: bold; /* Make labels bold */
            font-family: Arial; /* Set font family for labels */
            color: #f9f5e0; /* Set label text color */
        }
        .container {
            margin-top: 50px; /* Add top margin to container */
        }
        .form-control {
            background-color: #f0ebd5; /* Set background color for form controls */
            color: black; /* Set text color for form controls */
        }
    </style>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/regbg.jpg')">
    <%@ include file="/pages/user/includes/header.jsp"%> <!-- Include header JSP file -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center" style="text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9); font-size:40px; color: white;">
                    Register as a Patient
                </h2>
                <form name="registrationForm" action="${pageContext.request.contextPath}/insertPatient" method="POST" onsubmit="return validateForm()">
                    <!-- Patient's Name -->
    				<div class="form-group" style="margin-top:45px;">
        				<label for="name">Patient's Name:</label>
        				<input type="text" name="name" required class="form-control"/>
        				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
                    <!-- Patient's Age -->
    				<div class="form-group">
        				<label for="age">Patient's Age:</label>
        				<input type="number" name="age" required class="form-control"/>
       	 				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
   					</div>
                    <!-- Patient's Address -->
    				<div class="form-group">
        				<label for="address">Patient's Address:</label>
        				<input type="text" name="address" required class="form-control"/>
        				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
                    <!-- Patient's Phone Number -->
   					<div class="form-group">
       					<label for="phone">Patient's Phone No:</label>
        				<input type="text" name="phone" required class="form-control"/>
        				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
    				<!-- Patient's Allergies -->
    				<div class="form-group">
        				<label for="allergies">Patient's Allergies:</label>
        				<textarea name="allergies" required class="form-control"></textarea>
        				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
    				<!-- Username -->
    				<div class="form-group">
        				<label for="username">Username:</label>
        				<input type="text" name="username" required class="form-control"/>
        				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
    				<!-- Password -->
   			 		<div class="form-group">
        				<label for="password">Password:</label>
        				<input type="password" name="password" required class="form-control"/>
       			 		<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
    				<!-- Confirm Password -->
    				<div class="form-group">
        				<label for="confirmPassword">Confirm Password:</label>
        				<input type="password" name="confirmPassword" required class="form-control"/>
        				<span class="error-message" style="color: #00ffe7;"></span> <!-- Error message span -->
    				</div>
    				<!-- Register Button -->
    				<div class="text-center">
        				<input type="submit" value="Register" class="btn btn-primary btn-block" style="margin:0 auto; width:40%; font-weight:bold; border-radius:30px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.9);"/>
    				</div>
				</form>
                <!-- Links to login and homepage -->
                <div class="text-center" style="margin-top: 20px; color: white;">
                    <p>Already Registered? <a href="${pageContext.request.contextPath}/pages/user/login.jsp">Login</a></p>
                    <p >Back to <a href="${pageContext.request.contextPath}/pages/user/index.jsp">Homepage</a></p>
                </div>
            </div>
        </div>
    </div>
</body>

<!-- JavaScript validation function -->
<script>
    function validateForm() {
        // Clear previous error messages
        var errorMessages = document.querySelectorAll('.error-message');
        errorMessages.forEach(function(msg) {
            msg.textContent = '';
        });

        var password = document.forms["registrationForm"]["password"].value; 
        var confirmPassword = document.forms["registrationForm"]["confirmPassword"].value; 
        var age = document.forms["registrationForm"]["age"].value; 
        var phone = document.forms["registrationForm"]["phone"].value; 
        var username = document.forms["registrationForm"]["username"].value; 

        let isValid = true;

        // Check if passwords match
        if (password !== confirmPassword) {
            document.querySelector('input[name="confirmPassword"]').nextElementSibling.textContent = "Passwords do not match.";
            isValid = false;
        }

        // Validate age
        if (age < 1 || age > 120) {
            document.querySelector('input[name="age"]').nextElementSibling.textContent = "Please enter a valid age between 1 and 120.";
            isValid = false;
        }

        // Validate phone number
        var phonePattern = /^\d{10}$/; 
        if (!phonePattern.test(phone)) {
            document.querySelector('input[name="phone"]').nextElementSibling.textContent = "Please enter a valid 10-digit phone number.";
            isValid = false;
        }

        // Validate username length
        if (username.length < 5) {
            document.querySelector('input[name="username"]').nextElementSibling.textContent = "Username must be at least 5 characters long.";
            isValid = false;
        }

        // Validate password length
        if (password.length < 8) {
            document.querySelector('input[name="password"]').nextElementSibling.textContent = "Password must be at least 8 characters long.";
            isValid = false;
        }

        return isValid;
    }
</script>

<%@ include file="includes/footer.jsp"%>	
</html>