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
               
            <div class="player-center-panel">

                <div class="">

                    <table class="players-table" id="playersTable">
                        <th class="cabecera"> NOMBRE </th>
                        <th class="cabecera"> APELLIDO </th>
                        <th class="cabecera"> POSICION </th>
                        <th class="cabecera"> PIE </th>
                        <th class="cabecera"> ID </th>
                        <% 
                            ArrayList<Player> lt = (ArrayList<Player>)session.getAttribute("players");
                            
                            for (Player p : lt) {%>
                                <tr>
                                    <td><%=p.getName()%></td>
                                    <td><%=p.getSurname()%></td>
                                    <td><%=p.getPos()%></td>
                                    <td><%=p.getFoot()%></td>
                                    <td style="text-align: right;"><%=p.getId()%></td>
                                </tr>
                            <%}%>
                            
                    </table>  

                </div>

                <button onclick="abrirVentana()" class="btn-players"> AÑADIR JUGADOR</button>
                
            </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">

        function abrirVentana() {
            var width = 500; // Ancho de la ventana
            var height = 550; // Altura de la ventana
            var left = (window.innerWidth / 2) - (width / 2); // Posición izquierda
            var top = (window.innerHeight / 2) - (height / 2); // Posición superior
            var ventana = window.open("addPlayer", "_blank", "width=" + width + ",height=" + height + 
                                        ",left=" + left + ",top=" + top + ",resizable=no, toolbar=no, scrollbars=no");
        }

    </script>

</body>
</html>