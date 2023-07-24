package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.user.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	private User u = null;

    // INICIO - Inicio de la app 
	@RequestMapping("/")
	public String inicio() {
		log.info("inicio()");
		
		return "index.jsp";
	}

	@RequestMapping("/login")
	public String login() {
		log.info("login()");
		
		return "WEB-INF/view/login.jsp";
	}

	// Logging action
	@RequestMapping("/enterApp")
	public String enterApp(@RequestParam String userName, @RequestParam String userPassword) {
		log.info("enterApp()");

		if (userName.equals("Camilo") && userPassword.equals("1234")) {
			log.info("Creating user object....");
			u = new User(userName);
			log.info("Created " + u);
		} else {
			log.error("User: " + userName + " " + userPassword + " doesn't exist.");
		}
		
		return "WEB-INF/view/principal.jsp";
	}

    
}
