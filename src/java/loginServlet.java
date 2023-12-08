/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Initialize a HashSet to store username-password pairs
    private Set<User> users = new HashSet<>();

    @Override
    public void init() {
        // Add sample username-password pairs to the HashSet
        users.add(new User("user1", "password1"));
        users.add(new User("user2", "password2"));
        users.add(new User("user3", "password3"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the username and password from servlet initialization parameters
        String adminUsername = getServletConfig().getInitParameter("adminUsername");
        String adminPassword = getServletConfig().getInitParameter("adminPassword");

        // Retrieve the entered username and password
        String enteredUsername = request.getParameter("username");
        String enteredPassword = request.getParameter("password");

        try {
            if (enteredUsername == null || enteredUsername.trim().isEmpty() || enteredPassword == null || enteredPassword.trim().isEmpty()) {
                throw new NullValueException("Username or password cannot be blank");
            }

            if (adminUsername.equals(enteredUsername) && adminPassword.equals(enteredPassword)) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("Admin", true);
                session.setAttribute("UserType", "Admin");
                response.sendRedirect("settingsAdmin.jsp");
            } else {
                authenticateUser(enteredUsername, enteredPassword);

                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("User", true);
                session.setAttribute("UserType", "User");
                response.sendRedirect("dashboard.jsp");
            }
        } catch (NullValueException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.sendRedirect("nullValueError.jsp");
        } catch (AuthenticationException e) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.sendRedirect("authenticationError.jsp");
        }
    }

    private void authenticateUser(String enteredUsername, String enteredPassword) throws AuthenticationException {
        for (User user : users) {
            if (user.getUsername().equals(enteredUsername) && user.getPassword().equals(enteredPassword)) {
                return;
            }
        }
        throw new AuthenticationException("AuthenticationFailed");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the entered username and password
        String isGuest = request.getParameter("isGuest");
        if (isGuest != null) {
            HttpSession session = request.getSession();
            session.setAttribute("UserType", "Guest");
            session.setAttribute("Guest", true);
            response.sendRedirect("dashboard.jsp");
        }
    }

    public class User {

        private String username;
        private String password;

        public User(String username, String password) {
            this.username = username;
            this.password = password;
        }

        public String getUsername() {
            return username;
        }

        public String getPassword() {
            return password;
        }
    }

    public class AuthenticationException extends Exception {

        public AuthenticationException(String message) {
            super(message);
        }
    }
    
    public class NullValueException extends Exception {
        
        public NullValueException (String message) {
            super(message);
        }
    }
}
