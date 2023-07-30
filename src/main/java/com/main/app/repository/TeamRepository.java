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

    @Query(value = "SELECT * FROM users t WHERE t.email=:email AND t.password = crypt(:pass, t.password)", nativeQuery = true)
    public abstract List<User> findUser(@Param("email") String email, @Param("pass") String password);

    @Query(value = "SELECT COUNT(*) FROM users t WHERE t.email=:email", nativeQuery = true)
    public abstract Integer userExist(@Param("email") String email);

    @Modifying
    @Transactional
    @Query(value = "UPDATE users SET lastdateuse=now() WHERE email=:email", nativeQuery = true)
    public abstract void updateDate(@Param("email") String email);

}
