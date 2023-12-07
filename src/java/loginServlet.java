/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dodge Lapis
 */
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the username and password from servlet initialization parameters
        String username = getServletConfig().getInitParameter("username");
        String password = getServletConfig().getInitParameter("password");

        // Check if the entered username and password match
        String enteredUsername = request.getParameter("username");
        String enteredPassword = request.getParameter("password");

        if (username.equals(enteredUsername) && password.equals(enteredPassword)) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("loggedIn", true);
            response.sendRedirect("dashboard.jsp");
        } 
    }
}
