package com.bank.service;

import com.bank.entities.UserDtls;

public interface UserService {

	public UserDtls createUser(UserDtls user);

	public boolean checkEmail(String email);

	
	public UserDtls addEmp(UserDtls user);
}
