    /* 
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
     */

function flipCard() {
    const card = document.querySelector('.quizCard');
    card.style.transition = "transform 0.5s ease-in-out"
    card.classList.toggle('flipped');
}

function resetCardFlip() {
    const card = document.querySelector('.quizCard');
    card.style.transition = "transform 0s ease-in-out"
    card.classList.remove('flipped');
}

// Display the current question and answer in the quiz box
function updateQuizBox() {
    if (currentCardIndex >= 0 && currentCardIndex < cardList.length) {
        document.getElementById('questionText').innerText = cardList[currentCardIndex].question;
        document.getElementById('answerText').innerText = cardList[currentCardIndex].answer;
    } else {
        document.getElementById('questionText').innerText = "No more questions";
        document.getElementById('answerText').innerText = "No more answers";
    }
}

function changeQuestion(action) {
    console.log("Button clicked:", action);

    // Update the hidden input field value before submitting the form
    document.getElementById('actionInput').value = action;

    // Append the current index as a URL parameter
    window.location.href = "quiz.jsp?currentCardIndex=" + currentCardIndex;
}

function goToPlay(){
    window.location.href="quiz.jsp";
}
