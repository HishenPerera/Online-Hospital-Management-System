package com.Patient.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Patient.DBUtil.PatientDBUtil;
import com.Patient.Model.Patient;

@WebServlet("/InsertPatientServlet")
public class InsertPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String allergies = request.getParameter("allergies");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Patient patient = new Patient(0, name, age, address, phone, allergies, username, password) ;
		
        boolean isInserted = PatientDBUtil.insertPatient(patient);
        
        if (isInserted) {
            response.sendRedirect("pages/user/login.jsp?message=You're+Successfully+Registered+with+CurePlus+Hospitals,+Please+Login");
            
            // redirect to success page
        } else {
            response.sendRedirect("error.jsp"); // redirect to error page
        }
	}

}
