//IT23163218 M.H.S Perera
package com.AdminContent.Doctor.Controller;
	
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
	
import com.AdminContent.Doctor.DBUtil.DoctorDBUtil;
	
@WebServlet("/DeleteDoctorServlet")
	public class DeleteDoctorServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		if (DoctorDBUtil.deleteDoctor(id)) {
		        resp.sendRedirect("pages/staff/admin/doctorContent/manageDoctors.jsp"); // redirect to the manage doctors page
		} else {
		        resp.sendError(500, "Error deleting doctor"); // send error response
		}
		    
	}
	
}
