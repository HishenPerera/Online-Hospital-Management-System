<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pharmacist Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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

<h1 style="color: white;">Add Medicine to Inventory</h1>	

<div class="form-center" style="margin-top:20px;">
    <form id="medicineForm" action="${pageContext.request.contextPath}/InsertMed" method="POST" class="form-horizontal" onsubmit="return validateForm()">
        <div class="form-group" style="margin-top:20px;">
            <label class="control-label label-color">Medicine Name : </label><br>
            <input type="text" name="name" class="input-field form-control" required/>
        </div>
        <div class="form-group" style="margin-top:40px;">
            <label class="control-label label-color">Medicine Description : </label><br>
            <textarea name="description" class="input-field form-control" required maxlength="255"></textarea>
        </div>
        <div class="form-group" style="margin-top:40px;">
            <label class="control-label label-color">Quantity (Cards/Bottles) : </label><br>
            <input type="text" name="qty" class="input-field form-control" required/>
        </div>
        <div class="form-group" style="margin-top:40px;">
            <label class="control-label label-color">Unit Price : </label><br>
            <input type="text" name="price" class="input-field form-control" oninput="RsPrefix(this)" required/>
        </div>
        <div class="form-group" style="margin-top:40px;">
            <div class="col-sm-12 text-center">
                <input type="submit" value="Add Medicine" class="btn btn-primary"/>
            </div>
        </div>
    </form>
</div>

<script>
function RsPrefix(inputField) {
    var value = inputField.value.replace("Rs. ", "").trim(); // Clean previous Rs. prefix
    if (!value.startsWith("Rs. ")) {
        inputField.value = "Rs. " + value;
    }
}

function validateForm() {
    const qtyField = document.querySelector('input[name="qty"]');
    const priceField = document.querySelector('input[name="price"]');

    // Check if quantity is a valid number
    if (isNaN(qtyField.value) || qtyField.value <= 0) {
        alert("Please enter a valid quantity.");
        return false;
    }

    // Check if price is a valid number (removing the Rs. prefix for validation)
    const priceValue = priceField.value.replace("Rs. ", "").trim();
    if (isNaN(priceValue) || priceValue < 0) {
        alert("Please enter a valid price.");
        return false;
    }

    return true; // If all validations pass
}
</script>
</body>
</html>
