<!-- PERERA M.H.S - IT23163218 -->

<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- Character encoding for the document -->
    <meta name="viewport" content="width=device-width , initial-scale=1.0"> <!-- Responsive design -->
    <title>CurePlus Hospitals | Home</title> <!-- Page title -->
    
    <style>
        /* CSS for card hover effect */
        .card.manage:hover {
            transform: translateY(-16px); /* Moves card up on hover */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.8); /* Adds shadow effect */
            filter: brightness(0.9); /* Slightly darkens the card */
        }
        .card-title{
        	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
        }
    </style>
    
    <!-- Linking Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Linking Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Linking custom CSS files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css"> 
</head>

<body style="background-image: url('${pageContext.request.contextPath}/assets/images/homepage8.jpg')"> <!-- Background image for body -->
    <header>
        <%@ include file="/pages/user/includes/header.jsp" %> <!-- Including header JSP -->
    </header>
    
    <section class="jumbotron text-center" style="background-image: url('${pageContext.request.contextPath}/assets/images/homecover.jpeg'); background-size: cover; height: 783px; border-radius: 0px;">
        <h1 class="display-4">Welcome to CurePlus Hospitals</h1> <!-- Main heading -->
        <p class="lead">We Provide Good and Quality Health Care Services to our Patients.</p> <!-- Subheading -->
        <p><a class="btn btn-light" href="#target-aboutus" role="button" style="border-radius:30px;"> Know About Us</a></p> <!-- Button to navigate to About Us section -->
        <img src="${pageContext.request.contextPath}/assets/images/doctors.png"> <!-- Image of doctors -->
    </section>

    <div id="target-services">
        <section class="container" style="margin-top: 40px;">
            <h2 class="text-center" style="color: white; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); margin-bottom:30px; text-align: center;">Our Services</h2> <!-- Services heading -->
            <div class="row" style="justify-content: center; height: 100%;"> <!-- Row for services cards -->

                <!-- Card for Channeling Doctors -->
                <div class="col-md-4">
                    <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/hm1.jpg'); background-size: cover; height: 500px; width: 350px; border-radius:40px; margin: 0 auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                        <div class="card-body" style="padding-top: 0; display: flex; flex-direction: column; justify-content: flex-end; height: 100%;">
                            <div style="text-align: center;">
                                <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3, 0.9); font-size: 50px; font-weight: bold;">Channeling Doctors</h5>
                                <p class="card-text" style="color:#aefffb; font-size: 18px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);">Conveniently book and manage appointments with our easy-to-use online scheduling system, 24/7, from anywhere.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card for Online Medicines -->
                <div class="col-md-4">
                    <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/hm7.jpg'); background-size: cover; height: 500px; width: 350px; border-radius:40px; margin: 0 auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                        <div class="card-body" style="padding-top: 0; display: flex; flex-direction: column; justify-content: flex-end; height: 100%;">
                            <div style="text-align: center;">
                                <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3, 0.9); font-size: 50px; font-weight: bold;">Online Medicines</h5>
                                <p class="card-text" style="color:#aefffb; font-size: 18px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);">Experience convenient online pharmacy services with discounted medicines, free shipping, and 24/7 customer assistance.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card for Online Consultation -->
                <div class="col-md-4">
                    <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/hm2.jpg'); background-size: cover; height: 500px; width: 350px; border-radius:40px; margin: 0 auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                        <div class="card-body" style="padding-top: 0; display: flex; flex-direction: column; justify-content: flex-end; height: 100%;">
                            <div style="text-align: center;">
                                <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3, 0.9); font-size: 50px; font-weight: bold;">Online Consultation</h5>
                                <p class="card-text" style="color:#aefffb; font-size: 18px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);">Schedule virtual consultations with doctors, share medical records, and receive personalized advice and treatment plans from the comfort of home.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Statistics section -->
            <div class="container" style="margin-top:40px">
                <div class="row">
                    <div class="col-md-3 text-center">
                        <i class="fas fa-hospital fa-7x mb-3" style="color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);"></i>
                        <h4 style="color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">Hospital Rooms</h4>
                        <div class="badge badge-pill badge-custom-secondary" style="font-size: 36px; color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">100+</div>
                    </div>
                    <div class="col-md-3 text-center">
                        <i class="fas fa-user-md fa-7x mb-3" style="color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);"></i>
                        <h4 style="color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">Specialist Doctors</h4>
                        <div class="badge badge-pill badge-custom-success" style="font-size: 36px; color :#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">50+</div>
                    </div>
                    <div class="col-md-3 text-center">
                        <i class="fas fa-users fa-7x mb-3" style="color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);"></i>
                        <h4 style="color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">Medical Staff</h4>
                        <div class="badge badge-pill badge-custom-primary" style="font-size: 36px; color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">200+</div>
                    </div>
                    <div class="col-md-3 text-center">
                        <i class="fas fa-clock fa-7x mb-3" style="color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);"></i>
                        <h4 style="color: white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">Years of Experience</h4>
                        <div class="badge badge-pill badge-custom-warning" style="font-size: 36px; color:#00ffd8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);">20+</div>
                    </div>
                </div>
            </div>

            <!-- More services cards -->
            <div class="row" style="justify-content: center; height: 100%; margin-top:50px">
                <!-- Card for Laboratory Services -->
                <div class="col-md-4">
                    <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/hm6.jpg'); background-size: cover; height: 500px; width: 350px; border-radius:40px; margin: 0 auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                        <div class="card-body" style="padding-top: 0; display: flex; flex-direction: column; justify-content: flex-end; height: 100%;">
                            <div style="text-align: center;">
                                <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3, 0.9); font-size: 50px; font-weight: bold;">Laboratory Services</h5>
                                <p class="card-text" style="color:#aefffb; font-size: 18px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);">Accurate and reliable laboratory testing services with fast turnaround times and secure online results access.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card for Medical Workshops -->
                <div class="col-md-4">
                    <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/hm5.jpg'); background-size: cover; height: 500px; width: 350px; border-radius:40px; margin: 0 auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                        <div class="card-body" style="padding-top: 0; display: flex; flex-direction: column; justify-content: flex-end; height: 100%;">
                            <div style="text-align: center;">
                                <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3, 0.9); font-size: 50px; font-weight: bold;">Medical Workshops</h5>
                                <p class="card-text" style="color:#aefffb; font-size: 18px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);">Interactive online medical workshops and training sessions led by experienced healthcare professionals and industry experts .</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Card for Emergency Services -->
                <div class="col-md-4">
                    <div class="card manage" style="background-image: url('${pageContext.request.contextPath}/assets/images/hm10.jpg'); background-size: cover; height: 500px; width: 350px; border-radius:40px; margin: 0 auto; box-shadow: 0 0 10px rgba(0, 0, 0, 0.8); transition: transform 0.3s ease-in-out;">
                        <div class="card-body" style="padding-top: 0; display: flex; flex-direction: column; justify-content: flex-end; height: 100%;">
                            <div style="text-align: center;">
                                <h5 class="card-title" style="color:white; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3, 0.9); font-size: 50px; font-weight: bold;">Emergency Services</h5>
                                <p class="card-text" style="color:#aefffb; font-size: 18px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);">Rapid response emergency medical services with 24/7 availability, expert care, and timely transportation solutions.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div id="target-aboutus">
        <section class="container" style="margin-top: 70px; background-image: url('assets/images/about-us-bg.jpg'); background-size: cover;">
            <h2 class="text-center" style="color: white; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);">About Us</h2>
            <div class="row">
                <div class="col-md-12">
                    <p style="font-size: 18px; text-align:center; color:white;">Cure Plus Hospital is a leading healthcare provider dedicated to delivering exceptional patient care and innovative medical solutions. With a team of experienced doctors and state-of-the-art facilities, we strive to improve the health and well-being of our patients. Our mission is to provide personalized care, cutting-edge treatments, and unparalleled service to our patients. We are committed to excellence and strive to make a positive impact on the lives of those we serve.</p>
                </div>
            </div>
        </section>
    </div>

    <section class="map-container" style="margin-top: 70px;">
        <h2 class="text-center" style="color: white; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);">Our Location</h2>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d409.5227258986588!2d79.88755827467448!3d6.889074797909335!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2slk!4v1727524846363!5m2!1sen!2slk" width="100%" height="250" style="border:0;"></iframe>
        </div>
    </section>

    <%@ include file="/pages/user/includes/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="assets/js/index.js"></script>
</body>
</html>