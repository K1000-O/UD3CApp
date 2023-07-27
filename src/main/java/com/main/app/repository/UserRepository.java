package com.main.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;

import com.main.app.user.User;

import jakarta.transaction.Transactional;

@EnableJpaRepositories
public interface UserRepository extends JpaRepository<User, Long> {

    @Modifying // Es un update/delete query.
    @Transactional // Uses for INSERT.
    @Query(value = "INSERT INTO public.test(name, id, password, email) VALUES (:userName, :id, crypt(:pass, gen_salt('md5')), :email)", nativeQuery = true)
    public abstract void insert(@Param("userName") String name, @Param("id") Integer id, @Param("pass") String password, @Param("email") String email);

    @Query(value = "SELECT * FROM public.test t WHERE t.email=:email AND t.password = crypt(:pass, t.password)", nativeQuery = true)
    public abstract List<User> findUser(@Param("email") String email, @Param("pass") String password);

    @Query(value = "SELECT COUNT(*) FROM public.test t WHERE t.name=:userName", nativeQuery = true)
    public abstract Integer userExist(@Param("userName") String name);

}
