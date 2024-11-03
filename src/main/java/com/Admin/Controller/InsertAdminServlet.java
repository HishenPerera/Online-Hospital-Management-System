// IT23163218 M.H.S. Perera
package com.Admin.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Admin.DBUtil.AdminDBUtil;
import com.Admin.Model.Admin;

@WebServlet("/InsertAdminServlet")
public class InsertAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        //creating an Admin object that encapsulates the admin user's data
        Admin admin = new Admin(0,name, phone, email, username, password);

        boolean isInserted = AdminDBUtil.insertAdmin(admin);

        if (isInserted) {
            response.sendRedirect("pages/staff/admin/adminContent/manageAdmins.jsp"); // redirect to success page
        } else {
            response.sendRedirect("error.jsp"); // redirect to error page
        }
		
	}

}
