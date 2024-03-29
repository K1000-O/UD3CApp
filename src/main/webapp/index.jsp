
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

    <div class="intro">
        <div class="middle-box">

            <div class="intro-title" style="margin-left: 2%; font-size: 20px !important; letter-spacing: 0px !important;">
                <h1 class="logo-name">SOCCERAPP</h1>
            </div>
            <div class="intro-description">
                <h3 class="name-description">Soccer Management App</h3>
                <p class="description">Welcome to the managemenet soccer app. If you are a soccer coach, you are in the correct place!</p>
                <button id="idBtnEntrar" class="btn">ENTRAR</button>
            </div>

            <div>
                <h5 style="font-weight: 200; font-style: italic; margin:10px"> Camilo Jené - 2023</h5>
            </div>

        </div>

    </div>

    <!-- Script -->
    <script type="text/javascript">

    $(document).ready(function() {
        
        $("#idBtnEntrar").click(function(){
				window.location.assign("/login");
			});

    });

    </script>

</body>
</html>