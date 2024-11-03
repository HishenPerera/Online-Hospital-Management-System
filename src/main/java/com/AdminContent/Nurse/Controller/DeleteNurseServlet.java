package com.AdminContent.Nurse.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Nurse.DBUtil.NurseDBUtil;

@WebServlet("/DeleteNurseServlet")
public class DeleteNurseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        if (NurseDBUtil.deleteNurse(id)) {
            resp.sendRedirect("pages/staff/admin/nurseContent/manageNurse.jsp"); 
        } else {
            resp.sendError(500, "Error deleting nurse"); 
        }
    
	}

}
