// IT23163218 M.H.S. Perera
package com.Admin.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Admin.DBUtil.AdminDBUtil;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get the request parameter
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Use the AdminDBUtil class to delete the admin from the database
        if (AdminDBUtil.deleteAdmin(id)) {
            
            response.sendRedirect("pages/staff/admin/adminContent/manageAdmins.jsp"); 
        } else {
            
            response.sendError(500, "Error deleting admin"); 
        }
    }
}