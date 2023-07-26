
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

    <div class="wrapper" style="overflow: visible;">

        <div class="app-functions" style="display: flex; justify-content: center;">

            <div class="center-panel" style="display: flex;  width: fit-content; background-color: white; border-radius: 20px; justify-content: space-around; flex-wrap: wrap; margin: 40px;">

                <div class="func" style="margin: 20px; background-color: bisque; padding: 10px; width: fit-content; border-radius: 10px;">
                    <a href="google.es" style="width: 200px; color: navy; text-decoration: none;" >
                        <img src="../../public/plantillas/imgs/padlock.png" style="width: inherit;"></img>
                        <h1 style="margin: 0; font-size: 30px; text-align: center;">FUNCTION</h1>
                    </a>
                </div>

                <div class="func" style="margin: 20px; background-color: bisque; padding: 10px; width: fit-content; border-radius: 10px;">
                    <a href="google.es" style="width: 200px; color: navy; text-decoration: none;" >
                        <img src="../../public/plantillas/imgs/padlock.png" style="width: inherit;"></img>
                        <h1 style="margin: 0; font-size: 30px; text-align: center;">FUNCTION</h1>
                    </a>
                </div>

                <div class="func" style="margin: 20px; background-color: bisque; padding: 10px; width: fit-content; border-radius: 10px;">
                    <a href="google.es" style="width: 200px; color: navy; text-decoration: none;" >
                        <img src="../../public/plantillas/imgs/padlock.png" style="width: inherit;"></img>
                        <h1 style="margin: 0; font-size: 30px; text-align: center;">FUNCTION</h1>
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