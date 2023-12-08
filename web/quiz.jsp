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
        <script src="script.js"></script>
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
                            <h2 id="questionText"><%= request.getParameter("questions") != null ? request.getParameter("questions") : "Question here"%></h2>
                        </div>
                    </div>
                    <div class="answer-side">
                        <div id="answerBlock">
                            <h2 id="answerText"><%= request.getParameter("answers") != null ? request.getParameter("answers") : "Answer here"%></h2>
                        </div>
                    </div>
                </div>
            </div>

            <div id="controlButtons">
                <form id="quizForm" action="quiz.jsp" method="post">
                    <input type="hidden" name="action" id="actionInput" value="">
                    <button type="button" class="buttonPrevious" onclick="changeQuestion('previous');">Previous</button>
                    <button type="button" class="buttonNext" onclick="changeQuestion('next');">Next</button>
                </form>
            </div>
        </div>

        <div id="footer">
            <button class="home">Home</button>
        </div>
        <script>
            // Initialize cardList with empty arrays
            var cardList = [];

            // Check if the questions and answers parameters exist
            var questionsParam = <%= request.getParameterValues("questions") != null ? request.getParameterValues("questions") : null%>;
            var answersParam = <%= request.getParameterValues("answers") != null ? request.getParameterValues("answers") : null%>;

            // Populate cardList with questions and answers if the parameters exist
            if (questionsParam && answersParam && questionsParam.length === answersParam.length) {
                for (var i = 0; i < questionsParam.length; i++) {
                    cardList.push({question: questionsParam[i], answer: answersParam[i]});
                }
            }

            var currentCardIndex = <%= request.getParameter("currentCardIndex") != null ? Integer.parseInt(request.getParameter("currentCardIndex")) : 0%>;

            // Display the current question and answer in the quiz box
            updateQuizBox();
        </script>
    </body>
</html>
