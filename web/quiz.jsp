<%-- 
    Document   : quiz.jsp
    Created on : 12 7, 23, 1:01:02 AM
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
            <img src="images/logo.png" alt="Flashwiz Logo">
            <p id="websiteName">Flashwiz</p>
        </div>
        <div id="quizContainer">
            <div id="quizBox" onclick="flipCard()">
                <div class="quizCard">
                    <div class="question-side">
                        <div id="questionBlock">
                            <h2 id="questionText">Question here</h2>
                        </div>
                    </div>
                    <div class="answer-side">
                        <div id="answerBlock">
                            <h2 id="answerText">Answer here</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div id="controlButtons">
                <form id="quizForm" action="quiz" method="post">
                    <input type="hidden" name="action" id="actionInput" value="">
                    <button type="button" class="buttonPrevious" onclick="changeQuestion('previous');">Previous</button>
                    <button type="button" class="buttonNext" onclick="changeQuestion('next');">Next</button>
                </form>
            </div>
            
            <script src="script.js"></script>
        </div>

        <div id="footer">
            <button class="home">Home</button>
        </div>
        
    </body>
</html>
