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
                            <th colapsan="7" id="calendarTitle"> </th>
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

            </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">
        
    </script>

</body>
</html>