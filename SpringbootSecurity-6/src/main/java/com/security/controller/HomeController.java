package com.security.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	
	@GetMapping("/")
	@PreAuthorize("hasAuthority('ROLE_USER')")
	public String getIndex() {
		
		return "index";
		
	}
	
	
	@GetMapping("/home")
	@PreAuthorize("hasAuthority('ROLE_ADMIN')")
	public String getHome() {
		
		return "home";
		
	}

}
