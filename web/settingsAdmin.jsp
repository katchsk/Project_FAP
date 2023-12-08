<%-- 
    Document   : settingsAdmin
    Created on : Dec 7, 2023, 4:42:48 PM
    Author     : Ian Cariaga
--%>

<%@ page session="false" %>

<%
    HttpSession initialSession = request.getSession(false);

    if (initialSession == null) {
        response.sendRedirect("index.jsp");
    } else {
        boolean isAdmin = false;

        if (initialSession.getAttribute("Admin") != null) {
            isAdmin = (Boolean) initialSession.getAttribute("Admin");
        }

        if (!isAdmin) {
            response.sendRedirect("index.jsp");
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
        <title>User Settings</title>
    </head>
    <body>
         <div class="header">
            <div class="left-header">
                <img src="images/logo.png" alt="Flashwiz Logo">
                <p id='websiteName'><%= getServletContext().getInitParameter("WebsiteTitle") %></p>
            </div>
            <p id='userType'>Admin</p>
        </div>


        <div id="settings">
            <h1>Website Settings</h1>
            <form action="SaveAdminSettings" method="post">
                <label for="quizDuration">Quiz Duration (in minutes)</label>
                <select id="quizDuration" name="duration">
                    <option value="0">Default</option>
                    <option value="5">5 minutes</option>
                    <option value="10">10 minutes</option>
                    <option value="15">15 minutes</option>  
                </select><br>

                <label for="questionRandomness">Question Randomness</label>
                <select id="questionRandomness" name="questionRandomness">
                    <option value="-1">Default</option>
                    <option value="0">Sorted</option>
                    <option value="1">Randomized</option>
                </select><br>

                <input type="submit" value="Save">
            </form>
            <div id="warning">
                <img src="images/warning.png" alt="Warning Icon">
                <h3>Warning! Saving this will update the Deployment Descriptor of the website.</h3>
            </div>
        </div>
         <div class="footer">
             <p><%= getServletContext().getInitParameter("Copyright") %></p>
            <form action="Logout" method="post">
                <button type="submit" class="logout">Logout</button>
            </form>
        </div>
    </body>
</html>

