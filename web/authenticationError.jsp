<%-- 
    Document   : error
    Created on : Dec 8, 2023, 6:29:59 PM
    Author     : Ian Cariaga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato&family=Poppins:wght@500&display=swap" rel="stylesheet">
        <title>Authentication Error</title>
    </head>
    <body>
        <div class="header">
            <div class="left-header">
                <img src="images/logo.png" alt="Flashwiz Logo">
                <p id='websiteName'>FlashWiz</p>
            </div>
        </div>
             <div class="errorContainer">
                 <h2>Authentication Error!</h2>
                 <p>Username/Password is incorrect</p>
                 <button class="return" onclick="location.href='index.jsp'">Go back</button>
            </div>
        <div class="footer">
        </form>
    </div>
</body>
