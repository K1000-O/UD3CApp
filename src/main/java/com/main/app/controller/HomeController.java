package com.main.app.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.app.repository.*;
import com.main.app.user.Team;
import com.main.app.user.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private TeamRepository teamRepository;

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

	@RequestMapping("/register")
	public String register() {
		log.info("register()");
		
		return "WEB-INF/view/register.jsp";
	}

	// Logging action
	@RequestMapping("/principal")
	public String enterApp(@RequestParam String email, @RequestParam String userPassword, HttpServletRequest req) {
		log.info("principal()");
		List<User> list = userRepository.findUser(email, userPassword);

		if (list.size() == 0) {
			log.error("User '" + email +  "' or password incorrect");
			return "redirect:/";
		}

		userRepository.updateDate(email); // Update last used date on BBDD.

		log.info("Creating user object....");
		u = list.get(0);
		log.info("Created " + u);

		// Envía datos al HTML.
		HttpSession session = req.getSession();
		session.setAttribute("userName", u.getName());

		session.setAttribute("teams", teamRepository.findTeams(u.getId()));

		return "WEB-INF/view/principal.jsp";
	}

	@RequestMapping("/registerUser")
	public String registerUser(@RequestParam String email, @RequestParam String userName, @RequestParam String userPassword, HttpServletRequest req) {
		log.info("registerUser()");

		if (userRepository.userExist(email) > 0) {
			log.error("User already exists");
			return "redirect:/";
		}

		userRepository.insert(userName, userPassword, email); // Registrar usuario.


		return "WEB-INF/view/login.jsp";
	}
    
}
