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
        
        <div class="principal-nav">
            <!-- MENÚ NAV -->
            <jsp:include page="general/lateral-nav.jsp"></jsp:include>
            <!-- MENÚ NAV -->
        </div>

        <div class="app-functions">

            <div class="center-panel">                
                <div class="team-list">
                    <div class="players-table">
                        <table id="idPlayersTable">
                            <th class="cabecera">
                                <td>Nombre</td>
                                <td>Apellido</td>
                                <td>Equipo</td>
                                <td>ID</td>
                            </th>
                            <% 
                                ArrayList<Player> lt = (ArrayList<Player>)session.getAttribute("players");
                                
                                for (Player p : lt) {%>
                                    <tr>
                                        <td><%=p.getName()%></td>
                                        <td><%=p.getSurname()%></td>
                                        <td><%=p.getTeam()%></td>
                                        <td><%=p.getId()%></td>
                                    </tr>
                                <%}%>

                        </table>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">

    </script>

</body>
</html>