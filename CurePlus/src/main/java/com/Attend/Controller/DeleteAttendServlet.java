package com.Attend.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Attend.DBUtil.AttendDBUtil;

@WebServlet("/DeleteAttendServlet")
public class DeleteAttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		if (AttendDBUtil.deleteAttend(id)) {
			response.sendRedirect("pages/staff/receptionist/manageAttend.jsp");  
		} else {
			response.sendRedirect("error.jsp");  
		}
	}
}