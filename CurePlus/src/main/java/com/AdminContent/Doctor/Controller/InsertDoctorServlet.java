package com.AdminContent.Doctor.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Doctor.DBUtil.DoctorDBUtil;
import com.AdminContent.Doctor.Model.Doctor;

@WebServlet("/InsertDoctorServlet")
public class InsertDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String name = request.getParameter("name");
	        String speciality = request.getParameter("speciality");
	        String phone = request.getParameter("phone");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        Doctor doctor = new Doctor(0,name, speciality, phone, username, password);

	        boolean isInserted = DoctorDBUtil.insertDoctor(doctor);

	        if (isInserted) {
	            response.sendRedirect("pages/staff/admin/doctorContent/manageDoctors.jsp"); // redirect to success page
	        } else {
	            response.sendRedirect("error.jsp"); // redirect to error page
	        }
	}

}
