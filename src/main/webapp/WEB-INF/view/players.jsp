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

                <h1>TABLA DE JUGADORES</h1>
                
                <div class="players-table">
                    <div>
                        <table id="idPlayersTable">
                            <th>
                                <td>Nombre</td>
                                <td>Apellido</td>
                                <td>Equipo</td>
                                <td>ID</td>
                            </th>
                            <% 
                                List<?> lt = session.getAttribute("players");
                                
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

        // DOCUMENT READY
        $(document).ready( function () {

            console.log("")

            // Totalizadores errores
            $('#idPlayersTable').DataTable({
                ajax:{
                    //${pageContext.request.contextPath}
                    url:"getPlayers",
                    contenType: "application/json",
                    dataType:"json",
                    type: "POST",
                    dataSrc: function ( json ) { //URL: https://stackoverflow.com/questions/15786572/call-a-function-in-success-of-datatable-ajax-call
                        return json; //URL: https://datatables.net/manual/ajax
                    },
                    error: function (xhr, error, thrown) { //URL: https://stackoverflow.com/questions/35475964/datatables-ajax-call-error-handle
                        // Make your callback here.
                        //_this.ajax_error(xhr, error, thrown);
                    }	
                },
                //responsive: true,
                //ordering: false,
                order: [[ 0, 'asc' ]], // Orden alfabetico ascendente
                columns: [
                    {
                        title:	"Nombre",
                        data: 	"name",
                        defaultContent: ""
                    },
                    {
                        title:	"Apellido",
                        data: 	"surname",
                        defaultContent: ""
                    },
                    {
                        title:	"Equipo",
                        data: 	"team",
                        defaultContent: ""
                    },
                    {
                        title:	"ID",
                        data: 	"id",
                        defaultContent: ""
                    }
                ],
                language: {
                    url: "${pageContext.request.contextPath}/static/plantillas/inspinia_admin-v2.7.1/js/languages/Spanish.json"
                },
                select: 'single',
                responsive: true,
                buttons: [
                    'anadir',
                    'editar',
                    'eliminar',
                    {
                        extend: 'csv', 
                        text: 'Exportar a Excel',
                        titleAttr: 'exportar a excel',
                        fieldSeparator: ';'
                    }
                ]
            });

        } );
        // FIN-Totalizadores errores

    </script>

</body>
</html>