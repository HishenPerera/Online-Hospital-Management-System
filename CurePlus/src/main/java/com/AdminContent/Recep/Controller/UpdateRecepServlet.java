package com.AdminContent.Recep.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.AdminContent.Recep.DBUtil.RecepDBUtil;
import com.AdminContent.Recep.Model.Recep;

@WebServlet("/UpdateRecepServlet")
public class UpdateRecepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Recep recep = RecepDBUtil.selectSpecificRecep(id);
        request.setAttribute("recep", recep);
        request.getRequestDispatcher("/updateRecep.jsp").forward(request, response);
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        Recep recep = new Recep(id, name, phone, username, password);
        recep.setId(id);
        recep.setName(name);
        recep.setPhone(phone);
        recep.setUsername(username);
        recep.setPassword(password);

    
        if (RecepDBUtil.updateRecep(recep)) {
            
            response.sendRedirect(request.getContextPath() + "/pages/staff/admin/receptionistContent/manageRecep.jsp");
        } else {
            
            System.out.println("Error updating receptionist");
            
        }
		
	}

}
