<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    .event-window {
        display: flex;
        align-items: center;
        flex-direction: column;
        height: inherit;
        width: inherit;
    }

    .day {
        margin-bottom: 20px;
    }

    .events {
        display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
    }

    .events-title {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 10%;
    }

    .events-title button {
        width: 20%;
        height: 100%;
        border-radius: 5px;
        cursor: pointer;
        background-color: rgb(255, 42, 42);
        color: black;
        font-size: larger;
    }

    .event-button {
        border-radius: 20px; 
        height: fit-content; 
        width: 100%; 
        margin-top: 10px;
        cursor: pointer;
        padding: 10px;
        background-color: transparent;
    }

    .match {
        color: white;
        background-color: rgb(1, 165, 1);
        border-style: none;
    }

    .trainning {
        color: white;
        background-color: rgb(165, 1, 1);
        border-style: none;
    }


    /* ADD EVENT WINDOW */

    .add-event-window {
        display: none;
        align-items: center;
        flex-direction: column;
        height: inherit;
        width: inherit;
    }

    .add-event {
        display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
    }

    .event-form {
        display: flex;
        flex-direction: column;
        width: 100%;
        height: 100%;
    }

</style>

<div class="event-window">

    <div class="day">
        <h1> DIA </h1>
    </div>

    <div class="events">

        <div class="events-title">
            <h3>EVENTOS</h3>

            <button onclick="addEvent()"> + </button>
        </div>

        <div class="event">
            <button class="event-button match">
                EVENTO 1
            </button>
        </div>

        <div class="event">
            <button class="event-button trainning">
                EVENTO 2
            </button>
        </div>

        <div class="event">
            <button class="event-button">
                EVENTO 3
            </button>
        </div>

    </div>
</div>

<div class="add-event-window">

    <div class="add-event">

        <form action="#" class="event-form">

            <input type="text" class="event-input" placeholder="Nombre del evento">

            <input type="text" class="event-input" placeholder="Descripción">

            <input type="text" class="event-input" placeholder="Fecha">

            <input type="text" class="event-input" placeholder="Hora">

        </form>

    </div>

</div>

<script>

    function addEvent() {
        console.log("Entra");
        $(".event-window").css("display", "none");
        $(".add-event-window").css("display", "flex");
    }

</script>