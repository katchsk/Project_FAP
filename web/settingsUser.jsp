<%-- 
    Document   : settingsUser
    Created on : Dec 6, 2023, 11:38:39 PM
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
        <title>User Settings</title>
    </head>
    <body>
        <div id="header">
            <div id="left-header">
                <img src="images/logo.png" alt="Flashwiz Logo">
                <p id='websiteName'>FlashWiz</p>
            </div>
            <p id='userType'>User</p>
        </div>


        <div id="settings">
            <h1>Website Settings</h1>
            <form action="save-settings" method="post">
                <label for="quizDuration">Quiz Duration (in minutes)</label>
                <select id="quizDuration" name="quizDuration">
                    <option value="5">5 minutes</option>
                    <option value="10">10 minutes</option>
                    <option value="15">15 minutes</option>  
                </select><br>

                <label for="questionRandomness">Question Randomness</label>
                <select id="questionRandomness" name="questionRandomness">
                    <option value="sorted">Sorted</option>
                    <option value="randomized">Randomized</option>
                </select><br>

                <input type="submit" value="Save">
            </form>
        </div>
        <div id="footer">

        </div>
    </body>
</html>
