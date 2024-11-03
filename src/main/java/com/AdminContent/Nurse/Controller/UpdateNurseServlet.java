package com.AdminContent.Nurse.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Nurse.DBUtil.NurseDBUtil;
import com.AdminContent.Nurse.Model.Nurse;

@WebServlet("/UpdateNurseServlet")
public class UpdateNurseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Nurse nurse = NurseDBUtil.selectSpecificNurse(id);
        request.setAttribute("nurse", nurse);
        request.getRequestDispatcher("/updateNurse.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        Nurse nurse = new Nurse(id, name, phone, username, password);
        nurse.setId(id);
        nurse.setName(name);
        nurse.setPhone(phone);
        nurse.setUsername(username);
        nurse.setPassword(password);

    
        if (NurseDBUtil.updateNurse(nurse)) {
            
            response.sendRedirect(request.getContextPath() + "/pages/staff/admin/nurseContent/manageNurse.jsp");
        } else {
            
            System.out.println("Error updating nurse");
            
        }
	}

}
