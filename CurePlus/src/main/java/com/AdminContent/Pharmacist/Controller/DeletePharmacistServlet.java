//IT23163218 M.H.S. Perera

package com.AdminContent.Pharmacist.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Pharmacist.DBUtil.PharmacistDBUtil;

@WebServlet("/DeletePharmacistServlet")
public class DeletePharmacistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		@Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        if (PharmacistDBUtil.deletePharmacist(id)) {
	            resp.sendRedirect("pages/staff/admin/pharmacistContent/managePharmacists.jsp"); 
	        } else {
	            resp.sendError(500, "Error deleting pharmacist"); 
	        }
	    
	}

}
