package com.mgmt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.mgmt.entity.Employee;
import com.mgmt.repository.EmpRepository;

@Component
public class CustomeUserDetailsService implements UserDetailsService {

	@Autowired
	private EmpRepository empRepo;
	
	//check the username is correct or not this method check this
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		Employee emp = empRepo.findByEmail(email);
		
		if(emp == null) {
			throw new UsernameNotFoundException(" user not found ");
		}
		else {
			return new CustomeUserDetails(emp);
		}
		
	}

}
