<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.AdminContent.Doctor.DBUtil.DoctorDBUtil" %>
<%@ page import="com.AdminContent.Doctor.Model.Doctor" %>
<%@ page import="java.util.List" %>
        
<%	
	List<Doctor> Doctors = DoctorDBUtil.viewAllDoctors();
    request.setAttribute("doctors", Doctors);
%>

<%
    java.util.Date today = new java.util.Date();
    String todayStr = String.format("%tF", today);  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>
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
      text-align:center;
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
    
    .form-horizontal .control-label {
      text-align: left;
    }
  </style>

</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/docbg.jpg')">
  <%@ include file="/pages/staff/includes/header.jsp" %>
  
  	<h1 style="color: white;">Add Your Attendance Dr.</h1>	
  	
	<div class="form-center" style="margin-top:40px;">
  	<form action="${pageContext.request.contextPath}/InsertAttend" method="POST" class="form-horizontal">
	<div class="form-group">
  	<label class="control-label label-color">Your Name & Speciality:</label><br>
  		<select name="attendDetails" class="input-field form-control" required>
    		<option value="" disabled selected>Choose your Doctor Name & Speciality</option>
    		<c:forEach items="${doctors}" var="doctor">
      		<option value="${doctor.name} - ${doctor.speciality} ">${doctor.name} - ${doctor.speciality}</option>
    		</c:forEach>
  		</select>
	</div>
    <div class="form-group" style="margin-top:40px;">
      <label class="control-label label-color">Attending Date:</label><br>
      <input type="date" name="date" class="input-field form-control" required min="<%= todayStr %>"/>
    </div>
    <div class="form-group" style="margin-top:40px;">
  	<label class="control-label label-color">Morning Hours (6.00 a.m - 8.00 a.m)</label><br>
  	<select name="morning" class="input-field form-control" required>
    	<option value="" disabled selected>Choose your Attendance</option>
      	<option value="Attend">Attend</option>
      	<option value="Not Attend">Not Attend</option>
  	</select>
	</div>
	<div class="form-group" style="margin-top:40px;">
  	<label class="control-label label-color">Night Hours (6.00 p.m - 9.00 p.m)</label><br>
  	<select name="night" class="input-field form-control" required>
    	<option value="" disabled selected>Choose your Attendance</option>
      	<option value="Attend">Attend</option>
      	<option value="Not Attend">Not Attend</option>
  	</select>
	</div>
    <div class="form-group" style="margin-top:40px;">
      <div class="col-sm-12 text-center">
        <input type="submit" value="Add Attendance" class="btn btn-primary"/>
      </div>
    </div>
  </form>
</div>
</body>
</html>