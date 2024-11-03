package com.Shift.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Shift.DBUtil.ShiftDBUtil;

@WebServlet("/DeleteShiftServlet")
public class DeleteShiftServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (ShiftDBUtil.deleteShift(id)) {
            response.sendRedirect("pages/staff/receptionist/manageShifts.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}