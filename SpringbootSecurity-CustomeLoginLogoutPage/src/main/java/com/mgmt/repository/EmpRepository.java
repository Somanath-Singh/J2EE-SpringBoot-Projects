package com.mgmt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.mgmt.entity.Employee;

public interface EmpRepository extends JpaRepository<Employee, Integer> {

	public Employee findByEmail(String email);
	
	public Employee findByVerificationcode(String code);
	
	//create a mehod to check user how many time attempt to login
	
	@Query("update Employee e set e.failedAttempt=?1 where email=?2 ")
	@Modifying
	public void updateFailedAttempt(int attempt ,String email);
	
}
