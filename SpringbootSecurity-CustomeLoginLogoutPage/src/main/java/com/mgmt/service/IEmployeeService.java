package com.mgmt.service;

import com.mgmt.entity.Employee;

import jakarta.mail.MessagingException;

public interface IEmployeeService {
	
	/* public Employee saveEmployee(Employee emp); */
	
	//modified
	public Employee saveEmployee(Employee emp ,String url);
	
	public void removeSessionMessage();
	
	//send email to user for verification
	public void sendEmail(Employee emp, String url) throws Exception, MessagingException;
	
	public boolean verifyAccount(String verificationCode);
	
	//for attempt blocked
	
	public void increaseFailedAttempt(Employee emp);
	
	public void resetAttempt(String email);
	
	public void lock(Employee emp);
	
	public boolean unlockAccountTimeExpired(Employee emp);

}
