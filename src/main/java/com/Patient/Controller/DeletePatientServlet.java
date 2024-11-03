package com.Patient.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Patient.DBUtil.PatientDBUtil;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        if (PatientDBUtil.deletePatient(id)) {
            response.sendRedirect("pages/staff/admin/patientContent/managePatients.jsp"); 
        } else {
            response.sendError(500, "Error deleting patient"); 
        }
	}

}
