<!--IT23163218 M.H.S.Perera-->
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Add CSS for flex container -->
<style>
  .flex-container {
    display: flex;
    flex-direction: row;
    margin: 0 auto;
  }
  
  .card.manage:hover {
  transform: translateY(-10px);
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
  filter: brightness(0.8);
  
}
.admin-dashboard-text {
    text-align: center;
    margin-bottom: 40px;
  }
  .admin-dashboard-text h1 {
    font-size: 40px;
    font-weight: bold;
    color: #ecc900;
    text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
  }
  .admin-dashboard-text p {
    font-size: 14px;
    color: #0eff8e;
    text-shadow: 2px 4px 8px rgba(0, 0, 0, 0.9);
  }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">

</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/adm.jpg')">
    <%@ include file="/pages/staff/includes/header.jsp" %>

<div class="admin-dashboard-text">
  <h1>Admin Dashboard</h1>
  <%
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMMM dd, yyyy hh:mm a");
    String currentDate = sdf.format(new Date());
  %>
  <p>Today is <%= currentDate %></p>
</div>
	
<!-- Flex container 1 -->
<div class="flex-container" style="justify-content:center; gap:70px; margin-top:60px">

<!-- Patient Section -->
<div class="row">
  <div class="col-md-12 text-center" style="width:720px;">
    <div class="panel panel-default" style="width: 100%; margin: 0 auto; background-image: url('${pageContext.request.contextPath}/assets/images/patsec.jpg'); background-size: cover; background-position: center; border-radius:30px; border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 1);">
      <div class="heading" style="border-radius:40px; font-size:50px; font-weight:bold; color:#a5ff8b ; text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9);	">System Patients</div>
      <div class="panel-body">
        <div class="row" style="justify-content: center; height: 100%;">
 
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/patientContent/allPatients.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/pat1.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">    
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 45px; font-weight: bold; position: absolute; bottom: 30px; left: 10px;">Registered Patients</h5>
                </div>
              </div>
            </a>
          </div>
          
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/patientContent/managePatients.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/pat2.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
               
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 54px; font-weight: bold; position: absolute; bottom: 30px; left: 20px;">Manage Patients</h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

  <!-- Doctor Section -->
  <div class="row">
  <div class="col-md-12 text-center" style="width:720px;">
    <div class="panel panel-default" style="width: 100%; margin: 0 auto; background-image: url('${pageContext.request.contextPath}/assets/images/docsecbg.jpg'); background-size: cover; background-position: center; border-radius:30px; border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 1);">
      <div class="heading" style="border-radius:40px; font-size:50px; font-weight:bold; color:#ffc38b; text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9);">System Doctors</div>
      <div class="panel-body">
        <div class="row" style="justify-content: center; height: 100%;">
          <!-- Add Doctor Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/doctorContent/insertDoctor.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/doc2.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <!-- You can add more card content here -->
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 50px; font-weight: bold; position: absolute; bottom: 30px; left: 40px; right:30px">Add Doctors</h5>
                </div>
              </div>
            </a>
          </div>
          <!-- Manage Doctor Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/doctorContent/manageDoctors.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/doc1.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <!-- You can add more card content here -->
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 54px; font-weight: bold; position: absolute; bottom: 30px; left: 20px;">Manage Doctors</h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>

<!-- Flex container 2 -->
<div class="flex-container" style="justify-content:center; gap:70px; margin:60px auto;">

<!-- Nurse Section -->
  <div class="row">
  <div class="col-md-12 text-center" style="width:720px;">
    <div class="panel panel-default" style="width: 100%; margin: 0 auto; background-image: url('${pageContext.request.contextPath}/assets/images/nursebg.jpg'); background-size: cover; background-position: center; border-radius:30px; border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 1);">
      <div class="heading" style="border-radius:40px; font-size:50px; font-weight:bold; color:#ddbefc  ; text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9);">System Nurses</div>
      <div class="panel-body">
        <div class="row" style="justify-content: center; height: 100%;">
          <!-- Add Nurse Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/nurseContent/insertNurse.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/nurse1.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 50px; font-weight: bold; position: absolute; bottom: 30px; left: 40px; right:30px">Add Nurses</h5>
                </div>
              </div>
            </a>
          </div>
          <!-- Manage Nurse Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/nurseContent/manageNurse.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/nurse2.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.7); font-size: 54px; font-weight: bold; position: absolute; bottom: 30px; left: 20px;">Manage Nurses</h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Pharmacist Section -->
<div class="row">
  <div class="col-md-12 text-center" style="width:720px;">
    <div class="panel panel-default" style="width: 100%; margin: 0 auto; background-image: url('${pageContext.request.contextPath}/assets/images/pmcbg.jpg'); background-size: cover; background-position: center; border-radius:30px; border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 1);">
      <div class="heading" style="border-radius:40px; font-size:50px; font-weight:bold; color:#a5ff8b ; text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9);	">System Pharmacist</div>
      <div class="panel-body">
        <div class="row" style="justify-content: center; height: 100%;">
          <!-- Add Pharmacist Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/pharmacistContent/insertPharmacist.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/pmc1.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 45px; font-weight: bold; position: absolute; bottom: 30px; left: 3px;">Add Pharmacist</h5>
                </div>
              </div>
            </a>
          </div>
          <!-- Manage Pharmacists Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/pharmacistContent/managePharmacists.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/pmc2.jpeg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
               
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 45px; font-weight: bold; position: absolute; bottom: 30px; left: 3px;">Manage Pharmacist</h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>

<!-- Flex container 3 -->
<div class="flex-container" style="justify-content:center; gap:70px; margin-top:60px">

<!-- Admins Section -->
  <div class="row">
  <div class="col-md-12 text-center" style="width:720px;">
    <div class="panel panel-default" style="width: 100%; margin: 0 auto; background-image: url('${pageContext.request.contextPath}/assets/images/adminsecbg.jpg'); background-size: cover; background-position: center; border-radius:30px; border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 1);">
      <div class="heading" style="border-radius:40px; font-size:50px; font-weight:bold; color:#8bbeff; text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9);">System Administrators</div>
      <div class="panel-body">
        <div class="row" style="justify-content: center; height: 100%;">
          <!-- Add Admin Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/adminContent/insertAdmin.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/admin1.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <!-- You can add more card content here -->
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 35px; font-weight: bold; position: absolute; bottom: 30px; left: 2px;">Add New Administrators</h5>
                </div>
              </div>
            </a>
          </div>
          <!-- Manage Admin Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/adminContent/manageAdmins.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/admin2.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <!-- You can add more card content here -->
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 35px; font-weight: bold; position: absolute; bottom: 30px; left: 2px;">Manage Administrators</h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

  <!-- Receptionist Section -->
  <div class="row">
  <div class="col-md-12 text-center" style="width:720px;">
    <div class="panel panel-default" style="width: 100%; margin: 0 auto; background-image: url('${pageContext.request.contextPath}/assets/images/rpbg.jpg'); background-size: cover; background-position: center; border-radius:30px; border: none; box-shadow: 0 0 10px rgba(0, 0, 0, 1);">
      <div class="heading" style="border-radius:40px; font-size:50px; font-weight:bold; color:#ffc38b; text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.9);">System Receptionists</div>
      <div class="panel-body">
        <div class="row" style="justify-content: center; height: 100%;">
          <!-- Add Receptionist Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/receptionistContent/insertRecep.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/rp2.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                 
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; position: absolute; bottom: 30px; left: 4px;">Add Receptionists</h5>
                </div>
              </div>
            </a>
          </div>
          <!-- Manage Receptionist Card -->
          <div class="col-md-6">
            <a href="${pageContext.request.contextPath}/pages/staff/admin/receptionistContent/manageRecep.jsp" style="text-decoration: none; color: inherit; ">
              <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/rp1.jpg'); background-size: cover; height: 350px; border-radius:40px; margin: 0 auto; width:270px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                <!-- You can add more card content here -->
                <div class="card-body" style="padding-top: 0; ">
                  <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); font-size: 40px; font-weight: bold; position: absolute; bottom: 30px; left: 4px;">Manage Receptionists</h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>

</body>
</html>