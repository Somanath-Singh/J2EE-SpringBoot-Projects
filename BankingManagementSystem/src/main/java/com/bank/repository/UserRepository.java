package com.bank.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.entities.UserDtls;

public interface UserRepository extends JpaRepository<UserDtls, Integer> {

	public boolean existsByEmail(String email);

	public UserDtls findByEmail(String email);
	
	public UserDtls findByUsername(String username);

	public List<UserDtls> findByRoleAndAccStatus(String role, String status);

	public UserDtls findByAccountNum(String accNum);

	public boolean existsByUsername(String username);

}
