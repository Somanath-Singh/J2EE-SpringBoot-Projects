package com.mgmt.config;

import java.io.IOException;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.mgmt.entity.Employee;
import com.mgmt.service.IEmployeeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Component
public class CustomeAuthSuccessHandler implements AuthenticationSuccessHandler {

	
	@Autowired
	private IEmployeeService empService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		
		CustomeUserDetails custUser = (CustomeUserDetails)authentication.getPrincipal();
		Employee emp = custUser.getEmp();
		
		if(emp != null) {
			empService.resetAttempt(emp.getEmail()); //reset the attempt if user successfully login
		}
		
		if(roles.contains("ROLE_ADMIN")) {
			
			response.sendRedirect("/admin/admin");
			
		}
		else {
			
			response.sendRedirect("/user/home");
			
		}
		
		
	}

}
