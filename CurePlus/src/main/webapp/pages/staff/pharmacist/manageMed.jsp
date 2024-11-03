<!-- Medicine Imports -->

<%@ page import="com.Medicine.Model.Medicine" %>
<%@ page import="com.Medicine.DBUtil.MedicineDBUtil" %>

<%@ page import="java.util.List" %>

<%	
	List<Medicine> medicines = MedicineDBUtil.getAllMedicine();
    request.setAttribute("medicines", medicines);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharmacist Dashboard </title>

<style>

.table-primary {
    background-image: linear-gradient(to bottom, #1c01a1,#001984); /* Change the header row background color */
    color: #00ffe7;
    font-size:17px;
    font-family:sans-serif;
     /* Change the header row text color */
}

.table-light {
    background-image: linear-gradient(to bottom, #1c01a1, #002fff); /* Change the row background color */
    color: #ffffff; /* Change the row text color */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    font-size:15px;
    font-family:Helvetica;
    font-weight:bold;	
    
.table-bordered {
    border: none;
}

.table {
	border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
}    
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/pmcb.png')">
	 <%@ include file="/pages/staff/includes/header.jsp" %>

	<h1 style="color:white; font-size:45px; font-weight:bold; text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9); text-align:center;">Manage All Medicines</h1>
	
	<!-- Search Bar -->
	<div class="input-group" style="text-align: center; margin-top: 20px; display: flex; margin-left:600px; gap:10px; ">
  		<input type="text" id="search-input" class="form-control" placeholder="Search by Medicine's Name" style="width: 300px; height: 40px; font-size: 16px; border-radius: 20px;">
  		<div class="input-group-append">
    		<button id="search-btn" class="btn btn-primary" style="height: 40px; font-size: 16px; border-radius: 20px;">Search</button>
  		</div>
	</div>
	
    <table class="table" style="margin: 0 auto; width:1250px; margin-top:20px; margin-bottom:70px;">
    <tr class="table-primary">
        <th>ID</th>
        <th>Medicine Name</th>
        <th>Description</th>
        <th>Quantity (Cards/Bottles)</th>
        <th>Unit Price</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${medicines}" var="medicine">
    <tr class="table-light">
        <td>${medicine.id}</td>
        <td>${medicine.name}</td>
        <td>${medicine.description}</td>
        <td>${medicine.qty}</td>
        <td>${medicine.price}</td>
        <td>
        	<a href="${pageContext.request.contextPath}/pages/staff/pharmacist/updateMed.jsp?id=${medicine.id}" class="btn btn-primary btn-sm">Update</a>
            <a href="${pageContext.request.contextPath}/deleteMedi?id=${medicine.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this medicine?')">Delete</a>
        </td>
    </tr>
</c:forEach>
</table>
<script>
    $(document).ready(function() {
        $("#search-btn").click(function() {
            var searchInput = $("#search-input").val().toLowerCase();
            var rows = $(".table-light"); // Select only the rows that contain medicine data
            rows.hide(); // Hide all rows initially
            rows.filter(function() {
                var medicineName = $(this).find("td:eq(1)").text().toLowerCase(); // Change the index to match the Medicine Name column
                return medicineName.indexOf(searchInput) !== -1 || $(this).hasClass("table-primary");
            }).show(); // Show the filtered rows
        });
    });
</script>
</body>
</html>