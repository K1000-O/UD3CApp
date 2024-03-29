package com.main.app.user;

import java.sql.Date;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "events")
@Data
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String info;
    private Date start;
    private Date end;
    private Integer coach;
    private EventType type;
}

enum EventType {
    MATCH("MATCH"),
    TRAINNING("TRAINNING");

    private String eventType;

    EventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventType() {
        return eventType;
    }
}