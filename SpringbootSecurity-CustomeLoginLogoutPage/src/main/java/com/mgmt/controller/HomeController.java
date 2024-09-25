package com.mgmt.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mgmt.entity.Employee;
import com.mgmt.service.IEmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class HomeController {
	
	@Autowired
	private IEmployeeService empService;


	@GetMapping("/")
	public String getIndex() {

		return "index";

	}

	@GetMapping("/about")
	public String getAbout() {

		return "about";

	}

	@GetMapping("/login")
	public String getLogin() {

		return "login";

	}
	
	@GetMapping("/signup")
	public String getSignup() {

		return "signup";

	}
	
	//old
	/*
	@PostMapping("/addEmployee")
	public String addUser(@ModelAttribute("Employee") Employee emp ,Map<String , Object> map , HttpSession session) {
		
		
		  Employee saveEmp = empService.saveEmployee(emp );
		  
		  if (saveEmp != null) {
		  
		  session.setAttribute("msg", "User Registration Success ..");
		  session.setAttribute("type", "alert-info");
		  
		  } else { session.setAttribute("msg", "Something Went Wrong ..");
		  session.setAttribute("type", "alert-danger");
		  
		  }
		 
		
		
		return "redirect:signup";
		
	}
	*/
	
	//modified
	@PostMapping("/addEmployee")
	public String addUser(@ModelAttribute("Employee") Employee emp ,Map<String , Object> map , HttpSession session, HttpServletRequest req) {
		
		//check the url getting from the browser
		String url = req.getRequestURL().toString(); 
		
		//System.out.println(url);   //http://localhost:4041/addEmployee
		
		url = url.replace(req.getServletPath(), "");   //http://localhost:4041 
		
		//required url  =>  http://localhost:4041/verify?code=654654654ferf5r4654fergfge
		
		System.out.println(url);
		
		  Employee saveEmp = empService.saveEmployee(emp ,url);
		  
		  if (saveEmp != null) {
		  
		  session.setAttribute("msg", "User Registration Success ..");
		  session.setAttribute("type", "alert-info");
		  
		  } else {
			  
		session.setAttribute("msg", "Something Went Wrong ..");
		  session.setAttribute("type", "alert-danger");
		  
		  }
		 
		
		
		return "redirect:signup";
		
	}

	@GetMapping("/invalid")
	public String getInvalid() {

		return "invalid";

	}
	
	
	@GetMapping("/verify")
	public String getVerify( @Param("code") String code ,Model m) {
		
		boolean f = empService.verifyAccount(code);
		
		if(f) {
			m.addAttribute("msg" ,"Your account successfully verified .");
		}
		else
		{
			m.addAttribute("msg" , "may be your verification code is incorrect or already verified .");
		}

		return "verify";

	}

}
