package com.smart.service;

import com.smart.entity.User;

public interface IUserService {
	
	public User saveUser(User user);
	
	public boolean exitEmailCheck(String email);

}
