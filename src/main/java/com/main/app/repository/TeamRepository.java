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
public interface TeamRepository extends JpaRepository<Team, Long> {

    @Modifying // Es un update/delete query.
    @Transactional // Uses for INSERT.
    @Query(value = "INSERT INTO users(name, password, email, date_registration) VALUES (:userName, crypt(:pass, gen_salt('md5')), :email, now())", nativeQuery = true)
    public abstract void insert(@Param("userName") String name, @Param("pass") String password, @Param("email") String email);

    @Query(value = "SELECT * FROM teams WHERE coach=:id", nativeQuery = true)
    public abstract List<Team> findTeams(@Param("id")Integer id);

}
