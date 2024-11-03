package com.AdminContent.Recep.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Recep.DBUtil.RecepDBUtil;

@WebServlet("/DeleteRecepServlet")
public class DeleteRecepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        if (RecepDBUtil.deleteRecep(id)) {
            resp.sendRedirect("pages/staff/admin/receptionistContent/manageRecep.jsp"); 
        } else {
            resp.sendError(500, "Error deleting receptionist"); 
        }
        
	}

}
