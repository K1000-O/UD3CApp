
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

    <div class="intro">
        <div class="middle-box">

            <div class="intro-title" style="font-size: 20px !important; letter-spacing: 3px !important;margin:inherit;">
                <h1 class="logo-name" style="color: navy;">SOCCERAPP</h1>
            </div>

            <div>
                <h1 style="font-size: 20px; color: navy; opacity: 60%; margin: inherit!important;">LOGIN</h1>
            </div>

            <form action="principal" method="post" class="intro-description">

                <div class="login-input">
                    <h2 style="text-align: left!important; margin: 2px;">Email</h2>
                    <div style="display: flex;">
                        <img src="../../public/plantillas/imgs/user.png" style="height: 20px;">
                        <input type="text" name="email" class="input-design" placeholder="Email" required>
                    </div>
                </div>
                <div class="login-input">
                    <h2 style="text-align: left!important; margin: 2px;">Password</h2>
                    <div style="display: flex;">
                        <img src="../../public/plantillas/imgs/padlock.png" style="height: 20px;">
                        <input type="password" name="userPassword" class="input-design" placeholder="···········" required>
                    </div>
                </div>

                <div>
                    <button class="btn" type="submit">LOGIN</button>
                </div>

                <div class="a-reg" style="margin-bottom: 10px;">
                    <a href="/register">Create an account</a>
                </div>
                
            </form>
            

            <div>
                <h5 style="font-weight: 200; font-style: italic; margin:10px"> Camilo Jené - 2023</h5>
            </div>

        </div>

    </div>

</body>
</html>