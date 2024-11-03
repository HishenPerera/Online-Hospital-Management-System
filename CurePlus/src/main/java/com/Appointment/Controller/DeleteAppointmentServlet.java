package com.Appointment.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Appointment.DBUtil.AppointmentDBUtil;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String appointmentIdParam = req.getParameter("appointmentId");
	    if (appointmentIdParam != null) {
	        int id = Integer.parseInt(appointmentIdParam);
	        if (AppointmentDBUtil.deleteAppointment(id)) {
	            resp.sendRedirect("pages/staff/receptionist/manageAppointment.jsp"); 
	        } else {
	            resp.sendError(500, "Error deleting appointment"); // send error response
	        }
	    } else {
	        resp.sendError(400, "Missing id parameter"); // send error response
	    }
	}

}
