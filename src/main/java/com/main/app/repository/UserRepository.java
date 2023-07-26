package com.main.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.main.app.user.User;

@Repository
@EnableJpaRepositories
public interface UserRepository extends JpaRepository<User, Long> {

    @Query(value = "INSERT INTO public.test(name, id) VALUES (:userName, :id, crypt(:pass, gen_salt('md5')))", nativeQuery = true)
    public abstract void insert(@Param("userName") String name, @Param("id") Integer id, @Param("pass") String password);

    @Query(value = "SELECT * FROM public.test t WHERE t.name=:userName AND t.password = crypt(:pass, t.password)", nativeQuery = true)
    public abstract List<User> findUser(@Param("userName") String name, @Param("pass") String password);


}
