package com.main.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;

import com.main.app.user.*;

import jakarta.transaction.Transactional;

@EnableJpaRepositories
public interface PlayerRepository extends JpaRepository<Player, Long> {

    @Modifying // Es un update/delete query.
    @Transactional // Uses for INSERT.
    @Query(value = "INSERT INTO players(name, surname, team, pos, foot) VALUES (:name, :surname, :team, :pos, :foot)", nativeQuery = true)
    public abstract void insert(@Param("name") String name, @Param("surname") String surname, @Param("team") String team, @Param("pos") String pos, @Param("foot") String foot);

    @Query(value = "SELECT * FROM players WHERE team=:team", nativeQuery = true)
    public abstract List<Player> findPlayers(@Param("team") String team);

    @Query(value = "SELECT * FROM players WHERE coach IS NULL ORDER BY team DESC", nativeQuery = true)
    public abstract List<Player> findPlayers();
}
