package com.Medicine.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Medicine.DBUtil.MedicineDBUtil;
import com.Medicine.Model.Medicine;

@WebServlet("/UpdateMedicineServlet")
public class UpdateMedServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String qty = request.getParameter("qty");
        String price = request.getParameter("price");

        Medicine med = new Medicine(id, name, description, qty, price);
        if (MedicineDBUtil.updateMedicine(med)) {
            response.sendRedirect("pages/staff/pharmacist/manageMed.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}