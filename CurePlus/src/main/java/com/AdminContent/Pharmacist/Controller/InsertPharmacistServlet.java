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

@WebServlet("/InsertPharmacistServlet")
public class InsertPharmacistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Pharmacist pharmacist = new Pharmacist(0,name, phone, username, password);

        boolean isInserted = PharmacistDBUtil.insertPharmacist(pharmacist);

        if (isInserted) {
            response.sendRedirect("pages/staff/admin/pharmacistContent/managePharmacists.jsp"); 
        } else {
            response.sendRedirect("error.jsp"); 
        }
		
	}

}
