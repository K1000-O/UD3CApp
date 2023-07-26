package com.main.app.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.app.repository.UserRepository;
import com.main.app.user.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@Autowired
	private UserRepository userRepository;

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
	public String enterApp(@RequestParam String userName, @RequestParam String userPassword, HttpServletRequest req) {
		log.info("enterApp()");
		List<User> list = userRepository.findUser(userName, userPassword);

		if (list.size() == 0) {
			log.error("User '" + userName +  "' or password incorrect");
			return "redirect:/";
		}

		log.info("Creating user object....");

		u = list.get(0);
		log.info("Created " + u);

		// Envía datos al HTML.
		HttpSession session = req.getSession();
		session.setAttribute("userName", u.getName());

		// u.setId(list.size() + 1);
		// userRepository.insert(u.getName(), u.getId()); // Registrar usuario.

		
		return "WEB-INF/view/principal.jsp";
	}

    
}
