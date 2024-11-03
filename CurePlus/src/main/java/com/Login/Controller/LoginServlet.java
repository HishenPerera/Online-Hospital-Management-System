//PERERA M.H.S - IT23163218

package com.Login.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.Login.DBUtil.AdminLoginDBUtil;
import com.Login.DBUtil.DoctorLoginDBUtil;
import com.Login.DBUtil.NurseLoginDBUtil;
import com.Login.DBUtil.PatientLoginDBUtil;
import com.Login.DBUtil.PharmacistLoginDBUtil;
import com.Login.DBUtil.ReceptionistLoginDBUtil;
import com.Login.Model.Login;
import com.Patient.Model.Patient;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		Login lg = new Login(userName, password);
		
		// Getting the first 2 characters from username
		char letter1 = userName.charAt(0);
		char letter2 = userName.charAt(1);
		char letter3 = userName.charAt(2);
		
		boolean isTrue = false;
		
		if (letter1 == 'D' && letter2 == 'O' && letter3 == 'C') {
			isTrue = DoctorLoginDBUtil.validate(lg);
			
			if (isTrue == true) {
				
				// ...
				if (isTrue == true) {
				    //session token creating
				    HttpSession session = request.getSession();
				    session.setAttribute("username", userName); // Store the username in the session
				    // ...
				}
				// ...
				
				//session token creating
				HttpSession session = request.getSession();
				session.setAttribute("DOCUsername", userName);
				// Navigate to Doctor Dashboard page
				RequestDispatcher dis = request.getRequestDispatcher("/pages/staff/doctor/doctordashboard.jsp");
				dis.forward(request, response);

			} else {
				// Alert and Redirect to the login page
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type = 'text/javascript'> " + "alert('Your username or password is incorrect');"
						+ "location='pages/user/login.jsp'</script>");
			}
			
		}
		
		else if (letter1 == 'R' && letter2 == 'C' &&letter3 == 'P') {
			isTrue = ReceptionistLoginDBUtil.validate(lg);

			if (isTrue == true) {
				
				// ...
				if (isTrue == true) {
				    //session token creating
				    HttpSession session = request.getSession();
				    session.setAttribute("username", userName); // Store the username in the session
				    // ...
				}
				// ...
				
				//session token creating
				HttpSession session = request.getSession();
				session.setAttribute("RCPUsername", userName);
				RequestDispatcher dis = request.getRequestDispatcher("/pages/staff/receptionist/receptionistdashboard.jsp");
				dis.forward(request, response);

			} else {
				// Alert and redirect to the login page
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type = 'text/javascript'> " + "alert('Your username or password is incorrect');"
						+ "location='pages/user/login.jsp'</script>");
			}

		}
		
		else if (letter1 == 'P' && letter2 == 'M' &&letter3 == 'C') {
			isTrue = PharmacistLoginDBUtil.validate(lg);

			if (isTrue == true) {
				
				// ...
				if (isTrue == true) {
				    //session token creating
				    HttpSession session = request.getSession();
				    session.setAttribute("username", userName); // Store the username in the session
				    // ...
				}
				// ...
				
				//session token creating
				HttpSession session = request.getSession();
				session.setAttribute("PMCUsername", userName);
				RequestDispatcher dis = request.getRequestDispatcher("/pages/staff/pharmacist/pharmacistdashboard.jsp");
				dis.forward(request, response);

			} else {
				// Alert and redirect to the login page
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type = 'text/javascript'> " + "alert('Your username or password is incorrect');"
						+ "location='pages/user/login.jsp'</script>");
			}

		}
		
		else if (letter1 == 'N' && letter2 == 'R' &&letter3 == 'S') {
			isTrue = NurseLoginDBUtil.validate(lg);

			if (isTrue == true) {
				
				// ...
				if (isTrue == true) {
				    //session token creating
				    HttpSession session = request.getSession();
				    session.setAttribute("username", userName); // Store the username in the session
				    // ...
				}
				// ...
				
				//session token creating
				HttpSession session = request.getSession();
				session.setAttribute("NRSUsername", userName);
				RequestDispatcher dis = request.getRequestDispatcher("/pages/staff/nurse/nursedashboard.jsp");
				dis.forward(request, response);

			} else {
				// Alert and redirect to the login page
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type = 'text/javascript'> " + "alert('Your username or password is incorrect');"
						+ "location='pages/user/login.jsp'</script>");
			}

		}
		
		else if (letter1 == 'A' && letter2 == 'D' &&letter3 == 'M') {
			isTrue = AdminLoginDBUtil.validate(lg);

			if (isTrue == true) {
				
				// ...
				if (isTrue == true) {
				    //session token creating
				    HttpSession session = request.getSession();
				    session.setAttribute("username", userName); // Store the username in the session
				    // ...
				}
				// ...
				
				//session token creating
				HttpSession session = request.getSession();
				session.setAttribute("ADMUsername", userName);
				RequestDispatcher dis = request.getRequestDispatcher("/pages/staff/admin/admindashboard.jsp");
				dis.forward(request, response);

			} else {
				// Alert and redirect to the login page
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type = 'text/javascript'> " + "alert('Your username or password is incorrect');"
						+ "location='pages/user/login.jsp'</script>");
			}

		}
		
		
		else {
			isTrue = PatientLoginDBUtil.validate(lg);

			if (isTrue == true) {
				
				// ...
				if (isTrue == true) {
					
					// Create a Patient object
	                Patient patient = new Patient(); 
	                patient.setUsername(userName);
	                patient.setPassword(password);
					
				    //session token creating
				    HttpSession session = request.getSession();
				    session.setAttribute("username", userName); 
				    session.setAttribute("patient", patient);
				    // ...
				}
				// ...
				
				//session token creating
				HttpSession session = request.getSession();
				session.setAttribute("Username",userName);		
				// navigate to  customer portal
				request.setAttribute("username",userName);
				RequestDispatcher dis = request.getRequestDispatcher("pages/user/userDashboard.jsp");
				dis.forward(request, response);

			} else {
				// Alert and redirect to the login page
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("<script type = 'text/javascript'> " + "alert('Your username or password is incorrect');"
						+ "location='pages/user/login.jsp'</script>");
			}

		}
		
	}

}
