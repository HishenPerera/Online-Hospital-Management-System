<!-- PERERA M.H.S - IT23163218 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light navigationBar position-sticky sticky-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/pages/user/index.jsp">
    <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="CurePlus Hospitals Logo" width="40" height="40">
    CurePlus Hospitals
	</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/pages/user/index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#target-aboutus">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#target-services">Services</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact Us</a>
            </li>
           <% if (session.getAttribute("username") != null) { %>
    <li class="nav-item" style="margin-top:8px; margin-left:3px">
        <% 
            String username = (String) session.getAttribute("username");
            char letter1 = username.charAt(0);
            char letter2 = username.charAt(1);
            char letter3 = username.charAt(2);
        %>
        
        <% if (letter1 == 'D' && letter2 == 'O' && letter3 == 'C') { %>
            <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/doctor/doctordashboard.jsp" 
               style="color: #008fff; transition: color 0.2s ease-in-out; font-weight: bold; display: inline;"><%= session.getAttribute("username") %></a>
        <% } else if (letter1 == 'R' && letter2 == 'C' && letter3 == 'P') { %>
            <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/receptionist/receptionistdashboard.jsp" 
               style="color: #7400ff ; transition: color 0.2s ease-in-out; font-weight: bold; display: inline;"><%= session.getAttribute("username") %></a>
        <% } else if (letter1 == 'P' && letter2 == 'M' && letter3 == 'C') { %>
            <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/pharmacist/pharmacistdashboard.jsp" 
               style="color:#ff9e00; transition: color 0.2s ease-in-out; font-weight: bold; display: inline;"><%= session.getAttribute("username") %></a>
        <% } else if (letter1 == 'N' && letter2 == 'R' && letter3 == 'S') { %>
            <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/nurse/nursedashboard.jsp" 
               style="color: #3cc7ff; transition: color 0.2s ease-in-out; font-weight: bold; display: inline;"><%= session.getAttribute("username") %></a>
        <% } else if (letter1 == 'A' && letter2 == 'D' && letter3 == 'M') { %>
            <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/admin/admindashboard.jsp" 
               style="color: #97085f ; transition: color 0.2s ease-in-out; font-weight: bold;display: inline;"><%= session.getAttribute("username") %></a>       
        <% } else { %>
            <a class="nav-link" href="${pageContext.request.contextPath}/pages/user/userDashboard.jsp" 
               style="color: #01a289; transition: color 0.2s ease-in-out; font-weight: bold; display: inline;"><%= session.getAttribute("username") %></a>
        <% } %>
        
        <a class="nav-link" href="${pageContext.request.contextPath}/logout" 
   						style="background-color: #01a289; color: #ffffff; padding: 8px 16px; border: none; border-radius: 15px; display:inline; cursor: pointer; transition: background-color 0.2s ease-in-out;" 
   						onmouseover="this.style.background='red'" 
   						onmouseout="this.style.background='#01a289'">Logout</a>
    </li>
<% } else { %>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/pages/user/login.jsp" 
           style="color: #01a289; transition: color 0.2s ease-in-out;" 
           onmouseover="this.style.color='red'" 
           onmouseout="this.style.color='#01a289'">Log In</a>
    </li>
<% } %>
        </ul>
    </div>
</nav>