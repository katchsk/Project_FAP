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
        <link rel="stylesheet" type="text/css" href="Dashboard.css"
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato&family=Poppins:wght@500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <title>Flashwiz</title>
        
        <style>
            .inner-cards {
              display: grid;
              grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
              gap:20px;
              margin: 20px;
              width: 100%;
            }
            
            .main-cards {
                margin-top: 20px;
                width: 80%;
                height: 60vh;
                background-color: #D2EEF6;
                display: flex;
                overflow-y: scroll;
                border-radius: 20px;
            }
            
            .card {
              justify-content: space-around;
              padding: 25px;
              border-radius: 30px;
              color: white;
              height: 120px;
              background-color: #003050;
              box-shadow: 0 10px 10px rgba(0, 0, 0, 5);
              font-family: 'Poppins', sans-serif;
            }   
            
            .button-header-container{
                width: 100%;
                height: 120px;  
                display: flex;
                justify-content: space-around;
                align-items: center;
                margin-top:20px;
            }
            
            #dashboardContainer {
                display: flex;
                flex-direction: column;
                align-items: center;
                flex: 1;
            }
            
            .header-button {
                background-color: #4E92A5; /* Change to your preferred color */
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 25px; /* Increase font size for a more modern look */
                width: 150px;
                height: 70px; /* Adjust height as needed */
                border-radius: 10px; /* Increase border radius for rounded corners */
                font-family: 'Poppins', sans-serif;
                transition: background-color 0.3s ease-in-out; /* Add smooth transition effect */
            }

            .header-button:hover {
                background-color: #45a049; /* Change to a slightly darker shade on hover */
            }
            
            .card {
                cursor: pointer;
                transition: transform 0.3s ease-in-out; /* Add smooth transition effect */

                /* ... existing styles ... */
            }

            .card:hover {
                transform: scale(1.1); /* Adjust the scale factor as needed */
            }
            
            .card-title {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .card-question,
            .card-answer {
                font-size: 14px;
                /*margin-bottom: 5px;*/
                font-weight: bold;
            }
            
            .card-answer-text,
            .card-question-text {
                font-size: 13px
            }

            .card-spacing {
                margin-bottom: 10px;
            }
            
            .delete-icon-container {
                position: relative;
            }

            .delete-icon {
                position: absolute;
                top: -5px; /* adjust as needed */
                right: 5px; /* adjust as needed */
                cursor: pointer;
                color: white;
                transition: color 0.3s ease-in-out;
                font-size: 25px;
            }
    
        .delete-icon-container::before {
            content: "";
            position: absolute;
            top: -12px;
            right:-4px;
            width: 41px; /* adjust as needed */
            height: 41px; /* adjust as needed */
            border: 2px solid white;
            border-radius: 50%;
            box-sizing: border-box;
        }
        
        
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
        padding-top: 60px;
    }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Adjust the width as needed */
            height: 55%; /* Adjust the height as needed */
        }

        /* Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Modal Buttons */
    .modal-content {
        background-color: #4E92A5; /* Change to your preferred color */
        margin: 5% auto;
        padding: 20px;
        border-radius: 15px;
        width: 50%;
        height: auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        color: white;
    }

    /* Close Button */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #ddd;
        text-decoration: none;
        cursor: pointer;
    }

    /* Modal Buttons */
    .modal-content {
        background-color: #4E92A5; /* Change to your preferred color */
        margin: 5% auto;
        padding: 20px;
        border-radius: 15px;
        width: 40%;
        height: auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        color: white;
        font-family: 'Poppins', sans-serif;
    }

    /* Close Button */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #ddd;
        text-decoration: none;
        cursor: pointer;
    }

    /* Modal Buttons */
    .modal-buttons {
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
    }

    .modal-buttons button {
        background-color: #003050; /* Change to your preferred color */
        color: white;
        padding: 15px 30px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1vw; /* Adjust font size using vw units */
        transition: background-color 0.3s ease-in-out, transform 0.2s ease-in-out;
        font-family: 'Poppins', sans-serif;
    }

    .modal-buttons button:hover {
        background-color: #002040; /* Change to a slightly darker shade on hover */
        transform: scale(1.05);
    }

    .modal-content label {
        display: block;
        padding-top: 20px;
        margin-bottom: 10px;
        color: white;
        font-family: 'Poppins', sans-serif;
    }

    .modal-content input {
        width: 100%;
        height: 120px;
        padding: 15px; /* Increased height */
        margin-bottom: 20px;
        box-sizing: border-box;
        font-size: 16px;
        background-color: #ddd; /* Gray background */
        border: none;
        border-radius: 5px;
        color: #333;
        font-family: 'Poppins', sans-serif;

    }

        </style>
    </head>
    <body>
        <div id="header">
            <img src="images/logo.png" alt="Flashwiz Logo">
            <p id="websiteName">Flashwiz</p>
        </div>
        <div id="dashboardContainer">
            <div class ="button-header-container">
                 <button id="createButton" class="header-button">Create</button>
                 <button class="header-button">Play</button>
                 <button class="header-button">Settings</button>
            </div>
            
            <div class="main-cards">
                <div class="inner-cards">
 
                </div>

            </div>
        </div>
        
        <div id="footer">
            
        </div>
   
    <div id="myModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Create a Flashcard</h2>

            <!-- Add a form element -->
            <form id="flashcardForm" method="POST" action="CreateFlashcard">
                <label for="question">Question:</label>
                <input type="text" id="question" name="question" required>

                <label for="answer">Answer:</label>
                <input type="text" id="answer" name="answer" required>

                <!-- Move buttons inside a div for proper styling -->
                <div class="modal-buttons">
                    <button type="submit" onclick="saveFlashcard()">Save</button>
                    <button type="submit" onclick="addAnother()">One More?</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Function to display the modal
        function openModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }

        // Function to be called when the "Create" button is clicked
        function openCreateModal() {
            openModal();
        }

        // Attach a click event listener to the "Create" button
        document.getElementById("createButton").addEventListener("click", openCreateModal);

        // Attach a click event listener to the modal's close button (x)
        document.getElementsByClassName("close")[0].addEventListener("click", closeModal);
        
        // Function to be called when the "Save" button in the modal is clicked
        function saveFlashcard() {
            // Add logic to save the flashcard details
            // This is where you can handle form submission, save data, etc.
            // For now, let's just close the modal
            closeModal();
        }

        // Function to be called when the "One More?" button in the modal is clicked
        function addAnother() {
            // Add logic to handle adding another flashcard
            // This is where you can reset the form or take any other action
            // For now, let's just close the modal
//            closeModal();
        }
        
        function deleteCard(cardIndex){
            // Create a form element
            var form = document.createElement('form');
            form.method = 'POST';
            form.action = 'DeleteFlashcard';  // Specify the target URL

            // Create input elements for each parameter you want to send
            var input1 = document.createElement('input');
            input1.type = 'hidden';
            input1.name = 'CardIndex';
            input1.value = cardIndex;
            form.appendChild(input1);

            // Optionally, append the form to the document (hidden forms can be submitted)
            document.body.appendChild(form);

            // Submit the form
            form.submit();
        }
        
        function createCard(question, answer, index) {
            // Create the main div element with the "card" class
            const cardDiv = document.createElement("div");
            cardDiv.className = "card";

            // Create the delete icon container
            const deleteIconContainer = document.createElement("div");
            deleteIconContainer.className = "delete-icon-container";

            // Create the delete icon
            const deleteIcon = document.createElement("i");
            deleteIcon.className = "fas fa-trash delete-icon";

            // Append the delete icon to its container
            deleteIconContainer.appendChild(deleteIcon);
            deleteIconContainer.onclick = function(){
                console.log("hi");
                deleteCard(index);
            }

            // Create the card title
            const cardTitle = document.createElement("div");
            cardTitle.className = "card-title";
            cardTitle.textContent = "Flashcard #" + (index + 1);

            // Create the question section
            const cardQuestion = document.createElement("div");
            cardQuestion.className = "card-question";
            cardQuestion.textContent = "Question:";

            const cardQuestionText = document.createElement("div");
            cardQuestionText.className = "card-question-text truncate";
            cardQuestionText.textContent = question;

            // Create the card spacing
            const cardSpacing = document.createElement("div");
            cardSpacing.className = "card-spacing";

            // Create the answer section
            const cardAnswer = document.createElement("div");
            cardAnswer.className = "card-answer";
            cardAnswer.textContent = "Answer:";

            const cardAnswerText = document.createElement("div");
            cardAnswerText.className = "card-answer-text";
            cardAnswerText.textContent = answer;

            // Append all elements to the main card div
            cardDiv.appendChild(deleteIconContainer);
            cardDiv.appendChild(cardTitle);
            cardDiv.appendChild(cardQuestion);
            cardDiv.appendChild(cardQuestionText);
            cardDiv.appendChild(cardSpacing);
            cardDiv.appendChild(cardAnswer);
            cardDiv.appendChild(cardAnswerText);

            return cardDiv;
        }
       
       
        <%@ page import="java.util.ArrayList" %>

        <% 
           ArrayList<ArrayList<String>> arrayFromServer = (ArrayList<ArrayList<String>>) session.getAttribute("CardList");
           
           if (arrayFromServer != null) {
//             System.out.println(arrayFromServer);
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
 
        function updateBoard() {
            const innerCardsElement = document.querySelector(".inner-cards");
            if (cardList && innerCardsElement) {
                for (let i = 0; i < cardList.length; i++){
                    const question = cardList[i][0];
                    const answer = cardList[i][1];

                    const cardElem = createCard(question, answer, i);
                    innerCardsElement.appendChild(cardElem);
                }  
            }
        }
        
        
        updateBoard();
    </script>        
        
    </body>
</html>
