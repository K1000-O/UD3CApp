
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>SoccerApp Principal </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
        
        <div class="principal-nav">
            <!-- MENÚ NAV -->
            <jsp:include page="general/lateral-nav.jsp"></jsp:include>
            <!-- MENÚ NAV -->
        </div>

        <div class="app-functions">

            <div class="center-panel">

                <div class="func">
                    <a href="players" class="function-panel" >
                        <img src="../../public/plantillas/imgs/football-players.png"></img>
                        <h1>JUGADORES</h1>
                    </a>
                </div>

                <div class="func">
                    <a href="google.es" class="function-panel">
                        <img src="../../public/plantillas/imgs/traffic-cone.png"></img>
                        <h1>ENTRENAMIENTOS</h1>
                    </a>
                </div>

                <div class="func">
                    <a href="google.es" class="function-panel">
                        <img src="../../public/plantillas/imgs/goal.png"></img>
                        <h1>PARTIDOS</h1>
                    </a>
                </div>

                <div class="func">
                    <a href="google.es" class="function-panel">
                        <img src="../../public/plantillas/imgs/calendar.png"></img>
                        <h1>CALENDARIO</h1>
                    </a>
                </div>

            </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">
    </script>

</body>
</html>