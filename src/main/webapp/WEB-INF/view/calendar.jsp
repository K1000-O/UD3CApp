<%@ page import="com.main.app.user.Player" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoccerApp Principal </title>

    <!-- Utilizado para poder realizar JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style> /* Estilo para la superposicion */
        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Color de fondo semitransparente */
            backdrop-filter: blur(5px); /* Desenfoque del fondo */
            display: none; /* Ocultar inicialmente */
          }
          
          #overlayContent {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
          }
          
          #closeButton {
            margin-top: 10px;
          }
          
    </style>
    <!-- CSS -->
    <link rel="stylesheet" href="public/plantillas/css/style.css">
    
</head>

<body>

    <!-- MENÚ SUPERIOR -->
    <jsp:include page="general/header.jsp"></jsp:include>
    <!-- MENÚ SUPERIOR -->

    <div class="wrapper">
        
        <div class="principal-nav">
            <!-- MENÚ NAV -->
            <jsp:include page="general/lateral-nav.jsp"></jsp:include>
            <!-- MENÚ NAV -->
        </div>

        <div class="app-functions">

            <div class="calendar">

                <table class="month-calendar">
                    <thead>
                        <tr>
                            <th colspan="7" id="calendarTitle"></th>
                        </tr>
                        <tr>
                            <th>LUNES</th>
                            <th>MARTES</th>
                            <th>MIÉRCOLES</th>
                            <th>JUEVES</th>
                            <th>VIERNES</th>
                            <th>SÁBADO</th>
                            <th>DOMINGO</th>
                        </tr>
                    </thead>
                    <tbody id="calendar-body"></tbody>
                </table>

                <div class="buttons" style="padding-top: 20px; padding-left: 20px; padding-right: 20px; display: flex; justify-content: space-between;">
                    <button onclick="previousMonth()" class="movement-button"> < </button>
                    <button onclick="nextMonth()" class="movement-button"> > </button>
                </div>

            </div>

        </div>

    </div>

    <div id="overlay">
    <div id="overlayContent">
        <!-- Contenido del elemento superpuesto -->
        <button id="closeButton">Cerrar</button>
    </div>
    </div>

    <!-- Script -->
    <script type="text/javascript">

        const months = ["January", "February", "March", "April", "May", 
            "June", "July", "August", "September", "October", "November", "December"];

        // Variables of actual date.
        let today = new Date();
        let month = today.getMonth();
        let year = today.getFullYear();

        // Render the calendar.
        function renderCalendar() {
            let calendarBody = document.getElementById("calendar-body");
            calendarBody.innerHTML = "";

            document.getElementById("calendarTitle").innerHTML = months[month] + " " + year;

            let firstDay = new Date(year, month, 1).getDay();
            let numberOfDays = new Date(year, month + 1, 0).getDate(); // Number of days in the month. The 0 gets number of the last day of previous month.

            let date = 1;
            for (let i = 0; i < 6; i++) {
                let row = document.createElement("tr");

                for (let j = 0; j < 7; j++) {
                    if (date > numberOfDays)
                        break;

                    if (i === 0 && j < firstDay) { // Si son las primeras celdas sin número:
                        let cell = document.createElement("td");
                        cell.classList.add("empty");
                        row.appendChild(cell);
                    } else {
                        let cell = document.createElement("td");
                        let eventButton = document.createElement("button");
                        let numberDiv = document.createElement("div");
                        let eventDiv = document.createElement("div");

                        eventButton.id = "myButton";
                        eventDiv.classList.add("event-div");

                        numberDiv.textContent = date;

                        eventButton.appendChild(numberDiv);
                        eventButton.appendChild(eventDiv);
                        cell.appendChild(eventButton);
                        cell.id = date;

                        if (date === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
                            cell.classList.add("today");
                        }

                        row.appendChild(cell);
                        date++;
                    }
                }

                calendarBody.appendChild(row);
            }
        }

        function previousMonth() {
            if (month === 0) {
                month = 11;
                year--;
            } else {
                month--;
            }

            renderCalendar();
        }

        function nextMonth() {
            if (month === 11) {
                month = 0;
                year++;
            } else {
                month++;
            }

            renderCalendar();
        }

        renderCalendar();

        // When button clicked, open the overlay
        document.getElementById('myButton').addEventListener('click', function() {
            document.getElementById('overlay').style.display = 'block';
        });

        document.getElementById('closeButton').addEventListener('click', function() {
            document.getElementById('overlay').style.display = 'none';
        });
        
    </script>

</body>
</html>