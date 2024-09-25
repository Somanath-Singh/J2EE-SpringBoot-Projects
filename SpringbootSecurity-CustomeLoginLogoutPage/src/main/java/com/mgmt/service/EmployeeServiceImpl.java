package com.mgmt.service;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mgmt.entity.Employee;
import com.mgmt.repository.EmpRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Autowired
	private EmpRepository empRepo;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	

	@Override
	public Employee saveEmployee(Employee emp ,String url) {
		
		emp.setRole("ROLE_USER");
		emp.setPassword(passwordEncoder.encode(emp.getPassword()));
		
		//employee email virification logic during employee register
		emp.setEnable(false);
		emp.setVerificationcode(UUID.randomUUID().toString()); //store a random code at user table
		
		
		emp.setAccountNonLocked(true);
		emp.setFailedAttempt(0);
		emp.setLockTime(null);
		
		Employee empUser = empRepo.save(emp) ;
		
		if(empUser != null) {
			
			try {
				
				sendEmail(empUser, url);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return empUser;
	}
	
	@Override
	public void removeSessionMessage() {
		
		HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.getRequestAttributes())).getRequest().getSession();
		session.removeAttribute("msg");
		
	}

	@Override
	public void sendEmail(Employee emp, String url) throws Exception, MessagingException {
		
		String form = "somanathsingh531@gmail.com";
		String to = emp.getEmail();
		String subject = "Account Verification";
		String content = "Dear [[name]],<br>" + "Please click the link below to verify your registration:<br>"
				+ "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>" + "Thank you,<br>" + "Somanath";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);
			
			helper.setFrom(form, "Somanath");
			helper.setTo(to);
			helper.setSubject(subject);
			
			content = content.replace("[[name]]",  emp.getName());
			
			String siteUrl = url+"/verify?code=" + emp.getVerificationcode();
			
			content = content.replace("[[URL]]", siteUrl);
			
			System.out.println(siteUrl);
			
			helper.setText(content ,true);
			
			mailSender.send(message);
			
		}
		catch(Exception se) {
			se.printStackTrace();
		}
		
		
	}

	@Override
	public boolean verifyAccount(String verificationCode) {
	
		
		Employee emp = empRepo.findByVerificationcode(verificationCode);
		
		if(emp == null) {
			
			return false;
			
		}
		else
		{
			
			emp.setEnable(true);
			emp.setVerificationcode(null);
			
			empRepo.save(emp);
			
			return true;
			
		}
		
	}

	@Override
	public void increaseFailedAttempt(Employee emp) {
		
		int attempt = emp.getFailedAttempt() + 1;
		
		empRepo.updateFailedAttempt(attempt, emp.getEmail());
		
	}

	@Override
	public void resetAttempt(String email) {
		
		empRepo.updateFailedAttempt(0, email);
		
	}

	@Override
	public void lock(Employee emp) {
		
		emp.setAccountNonLocked(false);
		emp.setLockTime(new Date());
		
		empRepo.save(emp);
		
	}

	private static final long lock_duration_time = 1*60*60*1000;
	//private static final long lock_duration_time = 30000;
	
	public static final long ATTEMPT_TIME = 3 ;
	
	@Override
	public boolean unlockAccountTimeExpired(Employee emp) {
		
		long lockTimeInMilis = emp.getLockTime().getTime();
		long currentTimeMilis = System.currentTimeMillis();
		
		if( lockTimeInMilis + lock_duration_time < currentTimeMilis )
		{
			emp.setAccountNonLocked(true);
			emp.setLockTime(null);
			emp.setFailedAttempt(0);
			
			empRepo.save(emp);
			
			return true;
		}
		
		return false;
		
	}

}
