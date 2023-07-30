package com.main.app.user;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "teams")
@Data
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String team;
    private Integer coach;
}