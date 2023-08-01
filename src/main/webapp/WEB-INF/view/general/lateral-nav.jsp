
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="nav">

    <div class="nav-list">
        <h1 style="text-align: center; padding-top:5%;"><%=session.getAttribute("team")%></h1>
        <ul class="nav-functions" style="list-style: none;">
            <a href="#">
                <li>
                    <div class="name"><img class="name-img" src="../../../public/plantillas/imgs/football-players.png" alt="">JUGADORES</div>
                    <div class="nav-img"></div>
                </li>
            </a>
            <a href="#">
                <li>
                    <div class="name"><img class="name-img" src="../../../public/plantillas/imgs/traffic-cone.png" alt="">ENTRENAMIENTOS</div>
                    <div class="nav-img"></div>
                </li>
            </a>
            <a href="#">
                <li>
                    <div class="name"><img class="name-img" src="../../../public/plantillas/imgs/goal.png" alt="">PARTIDOS</div>
                    <div class="nav-img"></div>
                </li>
            </a>
            <a href="#">
                <li>
                    <div class="name"><img class="name-img" src="../../../public/plantillas/imgs/calendar.png" alt="">CALENDARIO</div>
                    <div class="nav-img"></div>
                </li>
            </a>
        </ul>

    </div>

</div>