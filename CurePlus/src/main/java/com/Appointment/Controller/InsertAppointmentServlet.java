package com.Appointment.Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.Appointment.DBUtil.AppointmentDBUtil;
import com.Appointment.Model.Appointment;



@WebServlet("/InsertAppointmentServlet")
public class InsertAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientName = request.getParameter("patientName");
        String patientAge = request.getParameter("patientAge");
        String patientPhone = request.getParameter("patientPhone");
        String patientAllergies = request.getParameter("patientAllergies");
        String selectDoctor = request.getParameter("selectDoctor");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        Appointment appoint = new Appointment(0,patientName, patientAge, patientPhone, patientAllergies, selectDoctor, date, time);

        boolean isInserted = AppointmentDBUtil.insertAppointment(appoint);

        if (isInserted) {
            response.sendRedirect("pages/user/userDashboard.jsp?message=Appointment+Successfully+Added,+Please+Check+the+Appointment+Status+From+Receptionist"); // redirect to appointments page
        } else {
            response.sendRedirect("error.jsp"); // redirect to error page
        }
    }
}