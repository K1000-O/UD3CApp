
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

    <div class="header" style="display: flex; background-color: rgb(49, 49, 182); opacity: 80%; justify-content: space-between;">

        <div class="intro-title" style="display: flex; font-size: 20px !important; letter-spacing: 3px !important; padding: 40px; align-items:center;">
            <h1 class="logo-name" style="color: white;margin: 0;">SOCCERAPP</h1>
        </div>

        <a href="/login" class="user-data" style="display: flex; align-items: center; justify-content:flex-end; flex-direction: column; margin:20px; padding:20px; background-color: red; border-radius: 100%; cursor:pointer; text-decoration:none; border-style: double;"> <!-- Añadir ::hover cambira color obscuro.-->
            
            <img src="../../public/plantillas/imgs/user.png" style="height: 30px;">
            <h1 class="user-name"  style="color: white; font-size: medium;"> <%= session.getAttribute("userName") %> </h1>

        </a>

    </div>

</body>
</html>