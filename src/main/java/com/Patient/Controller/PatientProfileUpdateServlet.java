package com.Patient.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Patient.DBUtil.PatientDBUtil;
import com.Patient.Model.Patient;

@WebServlet("/PatientProfileUpdateServlet")
public class PatientProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String allergies = request.getParameter("allergies");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Patient patient = new Patient(id,name,age,address,phone,allergies,username,password);

            if (PatientDBUtil.updatePatient(patient)) {
                // Update the patient object in the session
                HttpSession session = request.getSession();
                session.setAttribute("patient", patient);
                
                request.setAttribute("message", "Profile updated successfully!");
                request.getRequestDispatcher("pages/user/userDashboard.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to update profile!");
                request.getRequestDispatcher("pages/user/patientProfile.jsp").forward(request, response);
            }
        } 
        
	

}