<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.Medicine.DBUtil.MedicineDBUtil" %>
<%@ page import="com.Medicine.Model.Medicine" %>
<%@ page import="java.util.List" %>
        
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Medicine medicine = MedicineDBUtil.getMedicineById(id);
    request.setAttribute("medicine", medicine);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharmacist Dashboard</title>
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
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/pmcb.png')">
    <%@ include file="/pages/staff/includes/header.jsp" %>
  
    <h1 style="color: white;">Update This Medicine</h1>	
  	
    <div class="form-center" style="margin-top:40px;">
        <form action="${pageContext.request.contextPath}/updateMed" method="POST" class="form-horizontal">
            <input type="hidden" name="id" value="${medicine.id}">
            <div class="form-group">
                <label class="control-label label-color">Medicine Name:</label><br>
                <input type="text" name="name" class="input-field form-control" value="${medicine.name}" required/>
            </div>
            <div class="form-group" style="margin-top:40px;">
                <label class="control-label label-color">Description:</label><br>
                <textarea name="description" class="input-field form-control" required>${medicine.description}</textarea>
            </div>
            <div class="form-group" style="margin-top:40px;">
                <label class="control-label label-color">Quantity:</label><br>
                <input type="number" name="qty" class="input-field form-control" value="${medicine.qty}" required/>
            </div>
            <div class="form-group" style="margin-top:40px;">
                <label class="control-label label-color">Price:</label><br>
                <input type="text" name="price" class="input-field form-control" value="${medicine.price}" required/>
            </div>
            <div class="form-group" style="margin-top:40px;">
                <div class="col-sm-12 text-center">
                    <input type="submit" value="Update Medicine" class="btn btn-primary"/>
                </div>
            </div>
        </form>
    </div>
</body>
</html>