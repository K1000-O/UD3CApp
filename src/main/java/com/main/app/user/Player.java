package com.main.app.user;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "players")
@Data
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
    private String surname;
    private String team;
    private String pos;
    private String foot;
}