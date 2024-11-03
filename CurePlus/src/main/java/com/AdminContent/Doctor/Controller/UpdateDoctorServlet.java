package com.AdminContent.Doctor.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Doctor.DBUtil.DoctorDBUtil;
import com.AdminContent.Doctor.Model.Doctor;

@WebServlet("/UpdateDoctorServlet")
public class UpdateDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int docId = Integer.parseInt(request.getParameter("docId"));
        Doctor doctor = DoctorDBUtil.selectSpecificDoctor(docId);
        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher("/updateDoctor.jsp").forward(request, response);
    }
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int docId = Integer.parseInt(request.getParameter("docId"));
        String name = request.getParameter("name");
        String speciality = request.getParameter("speciality");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a Doctor object
        Doctor doctor = new Doctor(docId, name, speciality, phone, username, password);

        // Update the doctor data in the database using DoctorDBUtil
        if (DoctorDBUtil.updateDoctor(doctor)) {
            // Redirect to the original JSP file
            response.sendRedirect(request.getContextPath() + "/pages/staff/admin/doctorContent/manageDoctors.jsp");
        } else {
            // Handle the case where the update fails
            System.out.println("Error updating doctor");
            // You can also redirect to an error page or display an error message
        }
	}
}