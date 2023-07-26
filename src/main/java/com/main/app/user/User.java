package com.main.app.user;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "test")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
}
