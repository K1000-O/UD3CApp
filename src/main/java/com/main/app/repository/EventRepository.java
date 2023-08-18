package com.main.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;

import com.main.app.user.*;

@EnableJpaRepositories
public interface EventRepository extends JpaRepository<Event, Long> {
    @Query(value = "SELECT * FROM events", nativeQuery = true)
    public abstract List<Event> findBetween();
}
