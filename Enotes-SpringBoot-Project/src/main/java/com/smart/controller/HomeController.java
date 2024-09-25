package com.smart.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.smart.entity.User;
import com.smart.service.IUserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired
	private IUserService userService;

	@GetMapping("/")
	public String index() {

		return "index";

	}
	
	@GetMapping("/about")
	public String about() {

		return "about";

	}

	@GetMapping("/register")
	public String register(Map<String, Object> map) {

		map.put("User", new User());
		return "register";

	}

	@PostMapping("/addUser")
	public String addUser(@Valid @ModelAttribute("User") User user, BindingResult validation, Map<String, Object> map,
			HttpSession session) {

		// for server side form validation
		if (validation.hasErrors()) {

			System.out.println("ERROR " + validation.toString());
			map.put("User", user);
			return "register";

		}

		boolean f = userService.exitEmailCheck(user.getEmail());


		if (f) {

			session.setAttribute("msg", "Email already exists ..");
			session.setAttribute("type", "alert-danger");

		} else {

			User saveUser = userService.saveUser(user);

			if (saveUser != null) {

				session.setAttribute("msg", "User Registration Success ..");
				session.setAttribute("type", "alert-info");

			} else {
				session.setAttribute("msg", "Something Went Wrong ..");
				session.setAttribute("type", "alert-danger");

			}

		}

		return "redirect:register";

	}

	@GetMapping("/signin")
	public String login() {

		return "login";

	}


}
