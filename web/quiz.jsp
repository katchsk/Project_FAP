<%-- 
    Document   : quiz.jsp
    Created on : 12 7, 23, 1:01:02 AM
    Author     : Dodge Lapis
--%>

<%@ page session="false" %>

<%
    HttpSession initialSession = request.getSession(false);
    
    if (initialSession == null){
        response.sendRedirect("index.jsp");
    } else {
        boolean isAdmin = false;
        boolean isUser = false;

        if (initialSession.getAttribute("Admin") != null) {
            isAdmin = (Boolean) initialSession.getAttribute("Admin");
        }
        
        if (initialSession.getAttribute("User") != null){
            isUser = (Boolean) initialSession.getAttribute("User");
        }
        
        if (isAdmin){
            response.sendRedirect("settingsAdmin.jsp");
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
        <script src="scripts/script.js"></script>
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
                            <h2 id="questionText"></h2>
                        </div>
                    </div>
                    <div class="answer-side">
                        <div id="answerBlock">
                            <h2 id="answerText"></h2>
                        </div>
                    </div>
                </div>
            </div>

            <div id="controlButtons">
                <form id="quizForm" action="quiz.jsp" method="post">
                    <input type="hidden" name="action" id="actionInput" value="">
                    <button type="button" class="buttonPrevious" onclick="prevFlashcard();">Previous</button>
                    <button type="button" class="buttonNext" onclick="nextFlashcard();">Next</button>
                </form>
            </div>
        </div>

        <div id="footer">
            <button class="home">Home</button>
        </div>
        <script>
            <%@ page import="java.util.ArrayList" %>

            <% 
                ArrayList<ArrayList<String>> arrayFromServer = null;
                if (initialSession != null){
                    arrayFromServer = (ArrayList<ArrayList<String>>) initialSession.getAttribute("CardList");
                }
                if (arrayFromServer == null){
                    response.sendRedirect("dashboard.jsp");
                }
            %>

    //        <% 
                StringBuilder jsArray = new StringBuilder("[");
                if (arrayFromServer != null) {
                    for (int i = 0; i < arrayFromServer.size(); i++) {
                        jsArray.append("[");
                        ArrayList<String> innerList = arrayFromServer.get(i);
                        for (int j = 0; j < innerList.size(); j++) {
                            jsArray.append("\"").append(innerList.get(j)).append("\"");
                            if (j < innerList.size() - 1) {
                                jsArray.append(",");
                            }
                        }
                        jsArray.append("]");
                        if (i < arrayFromServer.size() - 1) {
                            jsArray.append(",");
                        }
                    }
                    jsArray.append("]");
                }
            %>

            let arrayString = '<%= jsArray.toString() %>';
            let cardList = null;

            if (arrayString != '[') {
                let jsonArray = arrayString.replace(/'/g, '"'); // Replace single quotes with double quotes
                cardList = JSON.parse(jsonArray);

                console.log(cardList);  
            }  
            
            let cardIndex = 0;
            let currentCard = null;
            
            updateVisibleCard();
            
            function updateVisibleCard(){
                resetCardFlip();
                currentCard = cardList[cardIndex];
                const questionElem = document.getElementById("questionText");
                const answerElem = document.getElementById("answerText");
                questionElem.textContent = currentCard[0];
                answerElem.textContent= currentCard[1];
            }
            
            function nextFlashcard(){
                cardIndex = clamp(cardIndex + 1, 0, cardList.length - 1);
                updateVisibleCard();
            }
            
            function prevFlashcard(){
                cardIndex = clamp(cardIndex - 1, 0, cardList.length - 1);
                updateVisibleCard();
            }
            
            function clamp(value, minimum, maximum) {
              return Math.min(Math.max(value, minimum), maximum);
            }

        </script>
    </body>
</html>
