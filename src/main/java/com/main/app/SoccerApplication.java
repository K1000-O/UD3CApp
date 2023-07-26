package com.main.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.client.RestTemplate;


import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
@ComponentScan (basePackages = "com.main") //ComponentScan es recursivo
@Slf4j //Lombok log SLF4j
public class SoccerApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		log.info("main()...");

		SpringApplication.run(SoccerApplication.class, args);

		log.info("main()... Inicio App.");
	}

}
