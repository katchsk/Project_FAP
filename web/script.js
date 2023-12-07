/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function flipCard() {
    const card = document.querySelector('.quizCard');
    card.classList.toggle('flipped');
}

var quizData = [
    {question: "Question 1?", answer: "Answer 1"},
    {question: "Question 2?", answer: "Answer 2"},
            // Add more questions and answers as needed
];

var currentQuestionIndex = 0;

function updateQuizBox() {
    document.getElementById('questionText').innerText = quizData[currentQuestionIndex].question;
    document.getElementById('answerText').innerText = quizData[currentQuestionIndex].answer;
}

function changeQuestion(action) {
    if (action === 'previous' && currentQuestionIndex > 0) {
        currentQuestionIndex--;
    } else if (action === 'next' && currentQuestionIndex < quizData.length - 1) {
        currentQuestionIndex++;
    }

    updateQuizBox();

    // Remove the form submission
    return false;
}

window.onload = function () {
    updateQuizBox();
};