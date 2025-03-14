package com.solo.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.solo.entity.User;
import com.solo.repo.IUserRepo;
import com.solo.service.IEmailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ForgotController {

	@Autowired
	private IEmailService emailService;

	@Autowired
	private IUserRepo userRepo;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	Random random = new Random(1000);

	// forgot page open
	@GetMapping("/forgot")
	public String openForgotEmail() {
		return "forgot_email_form";
	}

	// otp-send
	@PostMapping("/otp-send")
	public String sendOtp(@RequestParam("email") String email, HttpSession session) {

		System.out.println("email " + email);

		// send 4 digit otp

		int otp = random.nextInt(999999);

		System.out.println("otp " + otp);

		// send otp

		boolean f = false;

		try {
			f = emailService.sendOTP(email, otp);
		} catch (Exception e) {

			e.printStackTrace();

		}

		// store otp and email

		if (f) {

			session.setAttribute("myotp", otp);

			session.setAttribute("email", email);

			return "verify_otp";

		} else {

			session.setAttribute("msg", "Something Went Wrong ..");
			session.setAttribute("type", "alert-danger");

			return "redirect:/forgot";
		}

	}

	// verify otp
	
	@PostMapping("/verify-user-otp")
	public String verifyOTP(@RequestParam("otp") int otp, HttpSession session) {

		int myOtp = (int) session.getAttribute("myotp");

		String email = (String) session.getAttribute("email");

		// check the otp

		if (myOtp == otp) {

			// user does not exits

			User user = userRepo.findByEmail(email);

			if (user == null) {
				// send error
				session.setAttribute("msg", "User does not exist with this email id .. ");
				session.setAttribute("type", "alert-danger");

				return "redirect:/forgot";

			} else {

				// user exist

				// password change form
				return "password_change_form";

			}

		} else {
			session.setAttribute("msg", "You have entered the wrong otp ");
			session.setAttribute("type", "alert-danger");

			return "verify_otp";

		}

	}
	
	
	//change password
		@PostMapping("/change-password")
		public String changePassword(@RequestParam("newPassword") String newPassword ,HttpSession session )
		{
			
			String email = (String) session.getAttribute("email");
			
			System.out.println(email);
			System.out.println(newPassword);
			
			//change password
			User user = userRepo.findByEmail(email);
			
			System.out.println(user);
			
			user.setPassword(bCryptPasswordEncoder.encode(newPassword));
			
			//save the user data
			
			userRepo.save(user);
			
			
			return "redirect:/signin?change=Password change successfully  ...";
			
		}

}
