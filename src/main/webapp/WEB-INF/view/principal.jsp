<%@ page import="com.main.app.user.Team" %>
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
        
        <div class="app-functions">

            <div class="app-principal">
            
                <div class="centro-principal">

                    <div class="CENTER-PRINCIPAL">
                        <div>
                            <h1 style="padding: 10px"> ESCOGER EQUIPO </h1>
                        </div>
                    </div>

                    <div class="">
                        <form class="team-list" action="/team" method="post">
                        <%
                            ArrayList<Team> lt = (ArrayList<Team>)session.getAttribute("teams");

                            if (lt.size() <= 0) {
                                lt = (ArrayList<Team>)session.getAttribute("teamsNoCoach");%>

                                <select class="select-team" name="team" id="teamChosen">
                                    <%for (Team t : lt) {%>
                                        <option value="<%=t.getTeam()%>"><%=t.getTeam()%></option>
                                    <%}%>
                                </select>
                                <input type="submit" class="select-teamBtn">

                            <%} else {
                                for (Team t : lt) {%>
                                <input type="submit" name="team" value="<%=t.getTeam()%>" class="choose-team" />
                            <%
                                }
                            }
                            %>
                        </form>
                    </div>
                
                </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">

    </script>

</body>
</html>