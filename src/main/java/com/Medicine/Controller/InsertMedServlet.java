package com.Medicine.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Medicine.DBUtil.MedicineDBUtil;
import com.Medicine.Model.Medicine;

@WebServlet("/InsertMedicineServlet")
public class InsertMedServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String qty = request.getParameter("qty");
        String price = request.getParameter("price");

        Medicine med = new Medicine(0, name, description, qty, price);
        if (MedicineDBUtil.insertMedicine(med)) {
            response.sendRedirect("pages/staff/pharmacist/manageMed.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}