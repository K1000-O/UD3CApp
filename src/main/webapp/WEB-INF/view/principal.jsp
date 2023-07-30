
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
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

    <div class="wrapper" style="display: flex; flex-wrap: nowrap;">
        
        <div class="app-functions">

            <div class="app-principal">

            <div class="CENTER-PRINCIPAL">
                <div>
                    <h1 style="padding: 10px"> ESCOGER EQUIPO </h1>
                </div>
            </div>

            <div class="team-list">
                <button class="choose-team">
                    <h1>PRUEBA</h1>
                </button>

                <button class="choose-team">
                    <h1>PRUEBA DOS</h1>
                </button>

                <button class="choose-team">
                    <h1>PRUEBA TRES</h1>
                </button>
            </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">

    </script>

</body>
</html>