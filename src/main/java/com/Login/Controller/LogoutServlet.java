//PERERA M.H.S - IT23163218

package com.Login.Controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LogoutServlet")
//LogoutServlet.java
public class LogoutServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
     HttpSession session = request.getSession();
     session.invalidate();
     response.sendRedirect("pages/user/index.jsp");
 }
}
