package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
    // INICIO - Inicio de la app 
	@RequestMapping("/")
	public String inicio() {
		log.info("inicio()");
		
		return "index.jsp";
	}
    
}
