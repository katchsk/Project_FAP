<%-- 
    Document   : index
    Created on : 12 4, 23, 10:14:39 PM
    Author     : Dodge Lapis
--%>
<%@ page session="false" %>

<%
 
    HttpSession initialSession = request.getSession(false);
    
    if (initialSession != null){
        boolean isAdmin = false;
        boolean isUser = false;
        boolean isGuest = false;

        if (initialSession.getAttribute("Admin") != null) {
            isAdmin = (Boolean) initialSession.getAttribute("Admin");
        }

        if (initialSession.getAttribute("User") != null) {
            isUser = (Boolean) initialSession.getAttribute("User");
        }
        
        if (initialSession.getAttribute("Guest") != null) {
            isGuest = (Boolean) initialSession.getAttribute("Guest");
        }
        
        if (isAdmin){
            response.sendRedirect("settingsAdmin.jsp");
        } else if (isUser) {
            response.sendRedirect("dashboard.jsp");
        } else if (isGuest) {
            response.sendRedirect("dashboard.jsp");
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato&family=Poppins:wght@500&display=swap" rel="stylesheet">
        <title>Flashwiz</title>
    </head>
    <body>
        <div class="header">
            
        </div>
        <div id="loginContainer">
            <div id="logoWeb">
                <img src="images/logo.png" alt="Flashwiz Logo">
                <p id="websiteName"><%= getServletContext().getInitParameter("WebsiteTitle") %></p>
            </div>
            <div id="login">
                <div id="loginLabel">
                    <h1>Login</h1>
                </div>
                <form action="login" method="post">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required><br>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required><br><br>
                    <p id="guestButton">Login as <a href="login?isGuest=yes">Guest</a>?</p>
                    <button type="submit">
                        Login
                        <img src="images/loginbutton.png" alt="Login" class="button-icon">
                    </button>
                </form>
            </div>
        </div>
        <div class="footer">
            
        </div>
    </body>
</html>
