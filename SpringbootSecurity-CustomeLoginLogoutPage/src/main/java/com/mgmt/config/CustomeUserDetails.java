package com.mgmt.config;

import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.mgmt.entity.Employee;

public class CustomeUserDetails implements UserDetails {
	
	
	private Employee emp;

	public CustomeUserDetails(Employee emp) {
		super();
		this.emp = emp;
	}
	
	

	public Employee getEmp() {
		return emp;
	}



	public void setEmp(Employee emp) {
		this.emp = emp;
	}



	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
	
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(emp.getRole());
		
		return Arrays.asList(authority);
	}

	@Override
	public String getPassword() {
		
		return emp.getPassword();
		
	}

	@Override
	public String getUsername() {
		
		return emp.getEmail();
		
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return emp.isAccountNonLocked();
		
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return emp.isEnable();
		
	}

}
