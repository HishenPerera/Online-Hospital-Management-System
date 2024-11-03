package com.Attend.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Attend.DBUtil.AttendDBUtil;
import com.Attend.Model.Attend;

@WebServlet("/UpdateAttendServlet")
public class UpdateAttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String attendDetails = request.getParameter("attendDetails");
		String date = request.getParameter("date");
		String morning = request.getParameter("morning");
		String night = request.getParameter("night");
		
		Attend attend = new Attend(id, attendDetails, date, morning, night);
		if (AttendDBUtil.updateAttend(attend)) {
			response.sendRedirect("pages/staff/receptionist/manageAttend.jsp");  
		} else {
			response.sendRedirect("error.jsp");  
		}
	}
}