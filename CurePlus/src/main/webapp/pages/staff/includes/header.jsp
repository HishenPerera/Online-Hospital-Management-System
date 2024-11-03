<!-- PERERA M.H.S - IT23163218 -->



<% if (session.getAttribute("username") != null) { %>

<% 
                        String username = (String) session.getAttribute("username");
                        char letter1 = username.charAt(0);
                        char letter2 = username.charAt(1);
                        char letter3 = username.charAt(2);
                    %>


<nav class="navbar navbar-expand-lg navbar-light bg-light navigationBar position-sticky sticky-top" style="background-color: #f8f9fa; border-bottom: 1px solid #e7e7e7;">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/pages/user/index.jsp" style="font-size: 25px; font-weight: bold; color: #01a289; padding: 0.5rem 1rem; margin-top:10px; display: flex; align-items: center;">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="CurePlus Hospitals Logo" width="40" height="40" style="margin-right: 10px;">
        CurePlus Hospitals
    </a>
        <ul class="navbar-nav ml-auto" style="float:right; margin-right:15px;">
                <li class="nav-item" style="margin-top:8px; margin-left:3px; list-style-type:none">
                    
                     <a class="nav-link" href="${pageContext.request.contextPath}/logout" 
   						style="background-color: #01a289; color: #ffffff; padding: 5px 16px; border: none; border-radius: 15px; cursor: pointer;float:right; margin-top:9px; margin-left:6px; transition: background-color 0.2s ease-in-out;text-decoration: none;" 
   						onmouseover="this.style.background='red'" 
   						onmouseout="this.style.background='#01a289'">Logout</a>
                    
                    <% if (letter1 == 'D' && letter2 == 'O' && letter3 == 'C') { %>
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/doctor/doctordashboard.jsp" 
                           style="color: #008fff; transition: color 0.2s ease-in-out; font-weight: bold; font-style: italic; font-size:20px; display: inline; float:right; margin-bottom:8px; text-decoration: none;"><%= session.getAttribute("username") %></a>
                    <% } else if (letter1 == 'R' && letter2 == 'C' && letter3 == 'P') { %>
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/receptionist/receptionistdashboard.jsp" 
                           style="color: #7400ff ; transition: color 0.2s ease-in-out; font-weight: bold; font-style: italic; font-size:20px; display: inline; float:right; margin-bottom:8px; text-decoration: none;"><%= session.getAttribute("username") %></a>
                    <% } else if (letter1 == 'P' && letter2 == 'M' && letter3 == 'C') { %>
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/pharmacist/pharmacistdashboard.jsp" 
                           style="color:#ff9e00 ; transition: color 0.2s ease-in-out; font-weight: bold; font-style: italic; font-size:20px; display: inline; float:right; margin-bottom:8px; text-decoration: none;"><%= session.getAttribute("username") %></a>
                    <% } else if (letter1 == 'N' && letter2 == 'R' && letter3 == 'S') { %>
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/nurse/nursedashboard.jsp" 
                           style="color: #3cc7ff ; transition: color 0.2s ease-in-out; font-weight: bold; font-style: italic; font-size:20px; display: inline; float:right; margin-bottom:8px; text-decoration: none;"><%= session.getAttribute("username") %></a>
                    <% } else if (letter1 == 'A' && letter2 == 'D' && letter3 == 'M') { %>
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/staff/admin/admindashboard.jsp" 
                           style="color: #97085f ; transition: color 0.2s ease-in-out; font-weight: bold; font-style: italic; font-size:20px; display: inline; float:right; margin-bottom:8px; text-decoration: none;"><%= session.getAttribute("username") %></a>
                    <% } else { %>
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/user/userDashboard.jsp" 
                           style="color: #01a289; transition: color 0.2s ease-in-out; font-weight: bold; font-style: italic; font-size:20px; display: inline; float:right; margin-bottom:8px; text-decoration: none;"><%= session.getAttribute("username") %></a>
                    <% } %>
                    
                </li>
            <% } else { %>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/pages/user/login.jsp" 
                       style="color: #01a289; transition: color 0.2s ease-in-out; " 
                       onmouseover="this.style.color='red'" 
                       onmouseout="this.style.color='#01a289'">Log In</a>
                </li>
            <% } %>
        </ul>
</nav>