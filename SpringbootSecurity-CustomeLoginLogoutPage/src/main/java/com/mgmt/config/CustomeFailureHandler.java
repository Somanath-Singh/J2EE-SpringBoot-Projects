package com.mgmt.config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.mgmt.entity.Employee;
import com.mgmt.repository.EmpRepository;
import com.mgmt.service.EmployeeServiceImpl;
import com.mgmt.service.IEmployeeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomeFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Autowired
	private IEmployeeService empService;
	
	@Autowired
	private EmpRepository empRepo;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		
		
		String email = request.getParameter("username");
		Employee emp = empRepo.findByEmail(email);
		
		if(emp != null) {
			
			if(emp.isEnable()) {
				
				if(emp.isAccountNonLocked()) 
				{
					if(emp.getFailedAttempt() < EmployeeServiceImpl.ATTEMPT_TIME - 1)
					{
						empService.increaseFailedAttempt(emp);
					}
					else
					{
						empService.lock(emp); //lock the account
						exception = new LockedException("Your account is locked ! !  failed 3 attempts  ");
					}
				}
				else if( !emp.isAccountNonLocked())
				{
					if(empService.unlockAccountTimeExpired(emp)) 
					{
						exception = new LockedException("Account is unlocked ! please try to login");
					}
					else 
					{
						exception = new LockedException("Account is locked ! please try again after some time ");
					}
				}
				
			}
			else
			{
				
				exception = new LockedException("Account is inactive .. verify account ");
				
			}
			
		}
		
		super.setDefaultFailureUrl("/login?error");
		
		super.onAuthenticationFailure(request, response, exception);
	}

}
