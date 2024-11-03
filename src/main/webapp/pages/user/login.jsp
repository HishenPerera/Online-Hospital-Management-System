<!-- PERERA M.H.S - IT23163218 -->
	 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Log In</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/header.css">
  <style>
    body {
      background-image: url('your-background-image.jpg');
      background-size: cover;
      background-position: center;
    }
    .container-fluid {
      background-color: transparent !important;
    }
    .h-custom {
      background-color: transparent !important;
    }
    .form-outline {
      background-color: transparent !important;
    }
  </style>
  <script>
        // Function to show a popup message
        function showPopup(message) {
            alert(message);
        }
    </script>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/assets/images/regbg.jpg')">
  <%@ include file="/pages/user/includes/header.jsp"%>
  
  <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
        <script>
            showPopup("<%= message %>");
        </script>
    <%
        }
    %>
  <section class="vh-200">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-8 col-lg-5 col-xl-4">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
      
        <form action="${pageContext.request.contextPath}/login" method="POST">
  
          <!-- Email input -->
          <div data-mdb-input-init class="form-outline mb-4">
            <input type="text" id="form3Example3" class="form-control form-control-lg"
              placeholder="Enter a valid username" name="username" required="required"/>
            <label class="form-label" for="form3Example3"></label>
          </div>
  
          <!-- Password input -->
          <div data-mdb-input-init class="form-outline mb-3">
            <input type="password" id="form3Example4" class="form-control form-control-lg"
              placeholder="Enter password" name="password" required="required"/>
            <label class="form-label" for="form3Example4"></label>
          </div>
  
          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3" style="color:white;">
                Remember me
              </label>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>
  
          <div class="text-center text-lg-start mt-4 pt-2">
            <input type="submit" class="btn btn-primary btn-block" value="LOG IN">
            <p class="small fw-bold mt-2 pt-1 mb-0"  style="color:white;">Don't have an account? <a href="${pageContext.request.contextPath}/pages/user/register.jsp"
              class="link-danger">Register</a></p>
          </div>
  
        </form>
      </div>
    </ div>
  </div>
</section>
<%@ include file="includes/footer.jsp"%>
</body>
</html>