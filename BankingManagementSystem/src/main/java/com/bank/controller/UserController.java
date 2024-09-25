package com.bank.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bank.entities.AccountBalance;
import com.bank.entities.UserDtls;
import com.bank.repository.AcctBalanceRepository;
import com.bank.repository.AcctTransRepository;
import com.bank.repository.UserRepository;
import com.bank.service.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepo;

	/*
	 * @Autowired private BCryptPasswordEncoder passwordEncode;
	 */

	@Autowired
	private AcctTransRepository accTransRepo;

	@Autowired
	private AdminService adminService;

	@Autowired
	private AcctBalanceRepository acctBalRepo;

	@ModelAttribute
	private void userDetails(Model m, Principal p) {
		String email = p.getName();
		UserDtls user = userRepo.findByUsername(email);
		m.addAttribute("user", user);
	}

	@GetMapping("/")
	public String home() {
		return "user/home";
	}

	@GetMapping("/changPass")
	public String loadChnagePassword() {
		return "user/change_password";
	}

	@PostMapping("/updatePassword")
	public String changePassword(Principal p, @RequestParam("oldPass") String oldPass,
			@RequestParam("newPass") String newPass, HttpSession session) {

		String email = p.getName();

		UserDtls loginUser = userRepo.findByUsername(email);

	//	boolean f = passwordEncode.matches(oldPass, loginUser.getPassword());

		if (true) {
			loginUser.setPassword(newPass);
			UserDtls updatePasswordUser = userRepo.save(loginUser);
			if (updatePasswordUser != null) {
				session.setAttribute("msg", "Password Change Sucess");
			} else {
				session.setAttribute("msg", "something wrong on server");
			}
		} else {
			session.setAttribute("msg", "old password incorrect");
		}

		return "redirect:/user/changPass";
	}

	@GetMapping("/viewProfile")
	public String viewProfile() {
		return "user/view_profile";
	}

	@GetMapping("/sendMoney")
	public String sendMoney() {
		return "user/send_money";
	}

	@PostMapping("/sendMoneyTrans")
	public String sendMoneyTrans(HttpSession session, Principal p, @RequestParam String accNo,
			@RequestParam String name, @RequestParam String amt) {

		String email = p.getName();
		UserDtls user = userRepo.findByUsername(email);

		AccountBalance actBal = acctBalRepo.findByUser(user);

		Double amtx = Double.parseDouble(amt);

//		System.out.println(actBal.getTotalBalance());
//		System.out.println(amtx);

		if (actBal.getTotalBalance() < amtx) {
			session.setAttribute("msg", "Insufficent balance");
		} else {
			adminService.sendMoney(amtx, user, accNo);
			session.setAttribute("msg", "Money Send Sucess");
		}

		return "redirect:/user/sendMoney";
	}

	@GetMapping("/viewBalance")
	public String viewBalance() {
		return "user/view_balance";
	}

	@GetMapping("/allTransaction")
	public String allTransaction(Model m, Principal p) {
		String email = p.getName();
		UserDtls user = userRepo.findByUsername(email);

		m.addAttribute("accTrans", accTransRepo.findByUser(user));

		return "user/all_transaction";
	}

}
