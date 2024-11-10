// IT23163218 M.H.S.Perera 
package com.AdminContent.Nurse.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Nurse.DBUtil.NurseDBUtil;
import com.AdminContent.Nurse.Model.Nurse;


@WebServlet("/InsertNurseServlet")
public class InsertNurseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Nurse nurse = new Nurse(0,name, phone, username, password);

        boolean isInserted = NurseDBUtil.insertNurse(nurse);

        if (isInserted) {
            response.sendRedirect("pages/staff/admin/nurseContent/manageNurse.jsp"); 
        } else {
            response.sendRedirect("error.jsp"); 
        }
		
	}

}
