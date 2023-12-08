<%-- 
    Document   : quiz.jsp
    Created on : 12 7, 23, 1:01:02 AM
    Author     : Dodge Lapis
--%>

<%@ page session="false" %>

<%
    HttpSession initialSession = request.getSession(false);

    if (initialSession == null) {
        response.sendRedirect("index.jsp");
    } else {
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
            isGuest= (Boolean) initialSession.getAttribute("Guest");
        }

        if (isAdmin) {
            response.sendRedirect("settingsAdmin.jsp");
            return;
        }
        
        if (isGuest){
            response.sendRedirect("dashboard.jsp");
            return;
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
         <div class="header">
            <div class="left-header">
                <img src="images/logorevised.png" alt="Flashwiz Logo">
                <p id='websiteName'><%= getServletContext().getInitParameter("WebsiteTitle") %></p>
            </div>
            <p id='userType'><%= initialSession.getAttribute("UserType")%></p>
        </div>

        <div id="countdown-container">
            <p id="countdown">5:00</p>
        </div>

        <div id="quizContainer">
            <div id="quizBox" onclick="flipCard()">
                <div class="quizCard">
                    <div class="question-side">
                        <div id="questionBlock">
                            <div id="question-answer"><h2 id="questionText"></h2></div>
                        </div>
                    </div>
                    <div class="answer-side">
                        <div id="answerBlock">
                            <div id="question-answer"><h2 id="answerText"></h2></div>
                        </div>
                    </div>
                </div>
            </div>
            <form id="quizForm" action="quiz.jsp" method="post">
                <div id="controlButtons">
                    <button type="button" class="buttonPrevious" onclick="prevFlashcard();">Previous</button>
                    <button type="button" class="buttonNext" onclick="nextFlashcard();">Next</button>
                </div>
            </form>
            
        </div>

         <div class="footer">
             <p><%= getServletContext().getInitParameter("Copyright") %></p>
            <form action="dashboard.jsp" method="post">
                <button type="submit" class="home">Home</button>
            </form>
        </div>
        <script>
            <%@ page import="java.util.ArrayList" %>

            <%                ArrayList<ArrayList<String>> arrayFromServer = null;
                if (initialSession != null) {
                    arrayFromServer = (ArrayList<ArrayList<String>>) initialSession.getAttribute("CardList");
                }
                if (arrayFromServer == null) {
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

            let arrayString = '<%= jsArray.toString()%>';
            let cardList = null;

            if (arrayString != '[') {
                let jsonArray = arrayString.replace(/'/g, '"'); // Replace single quotes with double quotes
                cardList = JSON.parse(jsonArray);

                console.log(cardList);
            }
            
            const countdownElem = document.getElementById("countdown");
            
            let defaultCountdown = <%= initialSession.getAttribute("duration") %>
            let questionRandomness = <%= initialSession.getAttribute("questionRandomness") %>
         
            if (defaultCountdown == null){
                defaultCountdown = 30;
            } else {
                defaultCountdown *= 60;
            }
            
            if (questionRandomness == null){
                questionRandomness = 0;
            }
            
            if (questionRandomness == 1) {
                for (var i = cardList.length - 1; i > 0; i--) {
                    var j = Math.floor(Math.random() * (i + 1));
                    var temp = cardList[i];
                    cardList[i] = cardList[j];
                    cardList[j] = temp;
                }
            }

            let cardIndex = 0;
            let currentCard = null;

            updateVisibleCard();

            function updateVisibleCard() {
                resetCardFlip();
                currentCard = cardList[cardIndex];
                const questionElem = document.getElementById("questionText");
                const answerElem = document.getElementById("answerText");
                questionElem.textContent = currentCard[0];
                answerElem.textContent = currentCard[1];
            }

            function nextFlashcard() {
                cardIndex = clamp(cardIndex + 1, 0, cardList.length - 1);
                updateVisibleCard();
            }

            function prevFlashcard() {
                cardIndex = clamp(cardIndex - 1, 0, cardList.length - 1);
                updateVisibleCard();
            }

            function clamp(value, minimum, maximum) {
                return Math.min(Math.max(value, minimum), maximum);
            }
            
            countdownElem.textContent = defaultCountdown;
            
            let t = setInterval(function() {
                
                defaultCountdown -= 1;
                countdownElem.textContent = defaultCountdown;
                if (defaultCountdown < 0) {
                    alert("You ran out of time!");
                    window.location.href= "quiz.jsp";
                    
                    clearInterval(t);
                }
               
            }, 1000);

        </script>
    </body>
</html>
