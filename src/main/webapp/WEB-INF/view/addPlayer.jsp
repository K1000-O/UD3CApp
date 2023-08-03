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

    <div class="wrapper" style="display: flex; flex-wrap: nowrap;">
        <div class="app-functions">
               
            <div class="add-player-center-panel">

                <form action="addPlayerBBDD" id="myForm" method="post" class="add-player">
                    <div style="width: 100%;">
                        <div class="add-player-input">  
                            <h1>NOMBRE</h1>
                            <input type="text" name="name" placeholder="Nombre" required>
                        </div>

                        <div class="add-player-input">  
                            <h1>APELLIDO</h1>
                            <input type="text" name="surname" placeholder="Apellido" required>
                        </div>

                        <div class="add-player-input">  
                            <h1>POSICIÓN</h1>
                            <input type="text" name="pos" placeholder="Posición">
                        </div>

                        <div class="add-player-input">  
                            <h1>PIE</h1>
                            <input type="text" name="foot" placeholder="Pie">
                        </div>
                    </div>
                    <button type="submit"> AÑADIR JUGADOR</button>
                </form>

            </div>

        </div>

    </div>

</body>
</html>