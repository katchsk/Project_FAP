<%-- 
    Document   : index
    Created on : 12 4, 23, 10:14:39 PM
    Author     : Dodge Lapis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato&family=Poppins:wght@500&display=swap" rel="stylesheet">
        <title>Flashwiz</title>
    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="loginContainer">
            <div id="logoWeb">
                <img src="images/logo.png" alt="Flashwiz Logo">
                <p id="websiteName">Flashwiz</p>
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
                    <p id="guestButton">Login as <a href="dashboard.jsp">Guest</a>?</p>
                    <button type="submit">
                        Login
                        <img src="images/loginbutton.png" alt="Login" class="button-icon">
                    </button>
                </form>
            </div>
        </div>
        <div id="footer">
            
        </div>
    </body>
</html>
