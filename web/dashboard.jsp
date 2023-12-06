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
              display: flex;
              flex-direction: column;
              justify-content: space-around;
              padding: 25px;
              border-radius: 30px;
              color: white;
              height: 120px;
            }

            .card {
              background-color: #003050
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
                background-color: #BDC6EB;
                color: black;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 160%;
                width: 150px;
                height:70px;
                border-radius: 30px;
                font-family: 'Poppins', sans-serif;
            }
            
            .card-inner h3 {
              
                font-family: 'Poppins', sans-serif;
                position: absolute;
                margin-top:-25px;     
            }
            
            .card-inner .qna {
                font-weight: bold;  
            }
            
            .card-inner p {
                margin-bottom:-20px;
            }


        </style>
    </head>
    <body>
        <div id="header">
            
        </div>
        <div id="dashboardContainer">
            <div class ="button-header-container">
                 <button class="header-button">Create</button>
                 <button class="header-button">Play</button>
                 <button class="header-button">Settings</button>
            </div>
            
            <div class="main-cards">
                <div class="inner-cards">
                    <div class="card">
                      <div class="card-inner">
                        <h3>Flashcard #1</h3>
                        <p class="qna">Question:</p>
                        <p id ="1-question">adsasjdn</p>
                        <br></br>
                        <p class ="qna">Answer:</p>
                        <p id="2-question">andjhsdjs</p>
                      </div>
                    </div>
                </div>

            </div>
        </div>
        
        <div id="footer">
            
        </div>
    </body>
</html>
