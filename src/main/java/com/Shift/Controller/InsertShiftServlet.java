package com.Shift.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
 
import com.Shift.DBUtil.ShiftDBUtil;
import com.Shift.Model.Shift;

@WebServlet("/InsertShiftServlet")
public class InsertShiftServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String details = request.getParameter("details");
        String date = request.getParameter("date");
        String shift = request.getParameter("shift");

        Shift sft = new Shift(0, details, date, shift);
        if (ShiftDBUtil.insertShift(sft)) {
            response.sendRedirect("pages/staff/nurse/allShifts.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
	}

}
