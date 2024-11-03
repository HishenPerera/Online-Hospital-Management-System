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
    
    label, button {
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
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">
	
	<%@ include file="/pages/staff/includes/header.jsp" %>
    <h1 style="color:white; font-size:30px; font-weight:bold; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); text-align:center;">Add New Receptionist to the System</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form action="${pageContext.request.contextPath}/InsertRecep" method="POST">
                    <div class="form-group">
                        <label for="name">Receptionist's Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Receptionist's Phone No:</label>
                        <input type="text" class="form-control" id="phone" name="phone" required/>
                    </div>
                    <div class="form-group">
                        <label for="username">Login Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required oninput="addNRSPrefix(this)"/>
                    </div>
                    <div class="form-group">
                        <label for="password">Login Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required/>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Insert Receptionist"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>      
        function addNRSPrefix(inputField) {
            var value = inputField.value;
            if (!value.startsWith("RCP@")) {
                inputField.value = "RCP@" + value;
            }
        }
    </script>
</body>
</html>