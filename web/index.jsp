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
        <title>JSP Page</title>
    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="logoWeb">
            <img src="/images/" alt="">
            <p id="websiteName">Website Name</p>
        </div>
        <div id="login">
            <h1>Login</h1>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br><br>
                <p id="guestButton">Login as <a href="home.jsp">Guest</a>?</p>
                <input type="submit" value="Login">
            </form>
        </div>
        <div id="footer">
            
        </div>
    </body>
</html>
