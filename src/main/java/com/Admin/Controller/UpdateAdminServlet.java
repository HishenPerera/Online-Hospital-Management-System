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

@WebServlet("/UpdateAdminServlet")

//Inheritance: UpdateAdminServlet extends HttpServlet
public class UpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Admin admin = AdminDBUtil.selectSpecificAdmin(id);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/updateAdmin.jsp").forward(request, response);
    }
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
     // Encapsulation
        Admin admin = new Admin(0,name, phone, email, username, password);
        admin.setId(id);
        admin.setName(name);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setUsername(username);
        admin.setPassword(password);

        
        if (AdminDBUtil.updateAdmin(admin)) {
            
            response.sendRedirect(request.getContextPath() + "/pages/staff/admin/adminContent/manageAdmins.jsp");
        } else {
            // Handle the case where the update fails
            System.out.println("Error updating admin");
            // You can also redirect to an error page or display an error message
        }
	}

}
