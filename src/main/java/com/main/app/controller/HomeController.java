package com.main.app.controller;

import java.time.LocalDateTime;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.main.app.repository.*;
import com.main.app.user.*;
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

	@Autowired
	private PlayerRepository playerRepository;

	@Autowired
	private EventRepository eventRepository;

	private User u = null;

	private Team t = null;

	private HttpSession session;

    // INICIO - Inicio de la app
	@RequestMapping("/")
	public String inicio() {
		log.info("[OK] inicio()");
		
		return "index.jsp";
	}

	@RequestMapping("/login")
	public String login() {
		log.info("[OK] login()");
		
		return "WEB-INF/view/login.jsp";
	}

	@RequestMapping("/register")
	public String register() {
		log.info("[OK] register()");
		
		return "WEB-INF/view/register.jsp";
	}
	
	@RequestMapping("/registerUser")
	public String registerUser(@RequestParam String email, @RequestParam String userName, @RequestParam String userPassword, HttpServletRequest req) {
		log.info("[OK] registerUser()");

		if (userRepository.userExist(email) > 0) {
			log.error("User already exists");
			return "redirect:/";
		}

		userRepository.insert(userName, userPassword, email); // Registrar usuario.


		return "WEB-INF/view/login.jsp";
	}

	// Logging action
	@RequestMapping("/principal")
	public String enterApp(@RequestParam String email, @RequestParam String userPassword, HttpServletRequest req) {
		log.info("[OK] principal()");
		List<User> list = userRepository.findUser(email, userPassword);

		if (list.size() == 0) {
			log.error("User '" + email +  "' or password incorrect");
			return "redirect:/";
		}

		userRepository.updateDate(email); // Update last used date on BBDD.

		log.info("[OK] Creating user object....");
		u = list.get(0);
		log.info("Created " + u);

		// Envía datos al HTML.
		session = req.getSession();
		session.setAttribute("userName", u.getName());

		session.setAttribute("teams", teamRepository.findTeams(u.getId()));
		session.setAttribute("teamsNoCoach", teamRepository.findTeams());

		return "WEB-INF/view/principal.jsp";
	}

	@RequestMapping("/team")
	public String team(@RequestParam String team, HttpServletRequest req) {
		log.info("[OK] team(): registered " + team);

		if (teamRepository.teamHasCoach(team) == 0) {
			teamRepository.addCoach(team, u.getId());
		}

		t = teamRepository.findTeams(u.getId(), team).get(0);

		session = req.getSession();
		session.setAttribute("team", team);

		return "WEB-INF/view/team.jsp";
	}

	@RequestMapping("/players")
    public String players(HttpServletRequest req) {
		log.info("[OK] Getting team players...");

		session = req.getSession();

		log.info(t.getTeam());
		log.info(String.valueOf(playerRepository.findPlayers(t.getTeam()).size()));
		session.setAttribute("players", playerRepository.findPlayers(t.getTeam()));

		return "WEB-INF/view/players.jsp";
	}

	@RequestMapping("/addPlayer")
    public String addPlayer() {
		log.info("[OK] Creating add players...");

		return "WEB-INF/view/addPlayer.jsp";
	}

	@RequestMapping("/addPlayerBBDD")
	@ResponseBody
    public String addPlayerBBDD(@RequestParam String name, @RequestParam String surname, @RequestParam String pos, @RequestParam String foot, HttpServletRequest req) {
		log.info("[OK] Adding player...");

		playerRepository.insert(name, surname, t.getTeam(), pos, foot);

		return "<script>window.opener.location.reload();window.close();</script>";
	}


	/**
	 * Calendar mapping.
	 */
	@RequestMapping("/calendar")
    public String calendar() {
		log.info("[OK] Creating calendar...");

		return "WEB-INF/view/calendar.jsp";
	}
}
