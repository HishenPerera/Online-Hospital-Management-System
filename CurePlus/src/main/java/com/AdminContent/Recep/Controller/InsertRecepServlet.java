package com.AdminContent.Recep.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
 
import com.AdminContent.Recep.DBUtil.RecepDBUtil;
import com.AdminContent.Recep.Model.Recep;

@WebServlet("/InsertRecepServlet")
public class InsertRecepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Recep recep = new Recep(0,name, phone, username, password);

        boolean isInserted = RecepDBUtil.insertRecep(recep);

        if (isInserted) {
            response.sendRedirect("pages/staff/admin/receptionistContent/manageRecep.jsp"); 
        } else {
            response.sendRedirect("error.jsp"); 
        }
		
	}

}
