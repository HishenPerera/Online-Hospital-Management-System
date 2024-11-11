//IT23163218 M.H.S.Perera
package com.AdminContent.Pharmacist.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Pharmacist.DBUtil.PharmacistDBUtil;
import com.AdminContent.Pharmacist.Model.Pharmacist;

@WebServlet("/UpdatePharmacistServlet")
public class UpdatePharmacistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Pharmacist pharmacist = PharmacistDBUtil.selectSpecificPharmacist(id);
        request.setAttribute("pharmacist", pharmacist);
        request.getRequestDispatcher("/updatePharmacist.jsp").forward(request, response);
    }
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        Pharmacist pharmacist = new Pharmacist(id, name, phone, username, password);
        pharmacist.setId(id);
        pharmacist.setName(name);
        pharmacist.setPhone(phone);
        pharmacist.setUsername(username);
        pharmacist.setPassword(password);

    
        if (PharmacistDBUtil.updatePharmacist(pharmacist)) {
            
            response.sendRedirect(request.getContextPath() + "/pages/staff/admin/pharmacistContent/managePharmacists.jsp");
        } else {
            
            System.out.println("Error updating pharmacist");
            
        }
	}

}
