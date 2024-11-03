<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.Shift.DBUtil.ShiftDBUtil" %>
<%@ page import="com.Shift.Model.Shift" %>
<%@ page import="java.util.List" %>
        
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Shift shift = ShiftDBUtil.getShiftById(id);
    request.setAttribute("shift", shift);
%>

<%
    java.util.Date today = new java.util.Date();
    String todayStr = String.format("%tF", today);  
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Dashboard</title>
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
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/repbg.jpg')">
  <%@ include file="/pages/staff/includes/header.jsp" %>
  
  	<h1 style="color: white;">Update Shift</h1>	
  	
	<div class="form-center" style="margin-top:40px;">
  	<form action="${pageContext.request.contextPath}/updateShift" method="POST" class="form-horizontal">
  	<input type="hidden" name="action" value="update">
  	<input type="hidden" name="id" value="${shift.id}">
	<div class="form-group">
  	<label class="control-label label-color">Details:</label><br>
  		<input type="text" name="details" class="input-field form-control" value="${shift.details}" required/>
	</div>
    <div class="form-group" style="margin-top:40px;">
      <label class="control-label label-color">Shift Date:</label><br>
      <input type="date" name="date" class="input-field form-control" value="${shift.date}" required min="<%= todayStr %>"/>
    </div>
    <div class="form-group" style="margin-top:40px;">
  	<label class="control-label label-color">Working Shift/s</label><br>
  	<select name="shift" class="input-field form-control" required>
    	<option value="${shift.shift}" selected>${shift.shift}</option>
      	<option value="Day Shift">Day Shift</option>
      	<option value="Night Shift">Night Shift</option>
      	<option value="Full Shift">Full Day</option>
  	</select>
	</div>
    <div class="form-group" style="margin-top:40px;">
      <div class="col-sm-12 text-center">
        <input type="submit" value="Update Shift" class="btn btn-primary"/>
      </div>
    </div>
  </form>
</div>
</body>
</html>