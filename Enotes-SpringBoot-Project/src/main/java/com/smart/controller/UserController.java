package com.smart.controller;

import java.security.Principal;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smart.entity.Notes;
import com.smart.entity.User;
import com.smart.repository.UserRepository;
import com.smart.service.INotesService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private INotesService notesService;

	@ModelAttribute
	public User getUser(Principal p, Model m) {

		String email = p.getName();
		User user = userRepo.findByEmail(email);
		m.addAttribute("user", user);
		return user;

	}

	@GetMapping("/addNotes")
	public String addNotes( Model m) {

		m.addAttribute("notes" ,new Notes());
		return "add-notes";

	}

	@GetMapping("/viewNotes")
	public String viewNotes(Model m, Principal p ,@RequestParam(defaultValue = "0") int pageNo) {

		User user = getUser(p, m);
		Page<Notes> notes = notesService.getNotesByUser(user , pageNo);
		
		m.addAttribute("currentPage" , pageNo);
		m.addAttribute("totalElements" , notes.getTotalElements());
		m.addAttribute("totalPages" , notes.getTotalPages());
		
		m.addAttribute("notesList", notes.getContent());

		return "view-notes";

	}

	@GetMapping("/editNotes/{id}")
	public String editNotes(@PathVariable int id, Model m) {

		Notes notes = notesService.getNotesById(id);
		m.addAttribute("n", notes);
		return "edit-notes";

	}

	@PostMapping("/saveNotes")
	public String saveNotes(@Valid @ModelAttribute("notes") Notes notes , BindingResult validation, HttpSession session, Principal p, Model m) {

		//for server side form validation
		
		if(validation.hasErrors()) {
			
			m.addAttribute("notes" ,notes);
			return "add-notes";
			
		}
		
		notes.setDate(LocalDate.now());
		notes.setUser(getUser(p, m));

		Notes saveNotes = notesService.saveNotes(notes);

		if (saveNotes != null) {

			session.setAttribute("msg", "Notes save successfully ..");
			session.setAttribute("type", "alert-success");
		} else {

			session.setAttribute("msg", "Something went wrong ..");
			session.setAttribute("type", "alert-danger");

		}

		return "redirect:addNotes";

	}

	@PostMapping("/updateNotes")
	public String updateNotes(@ModelAttribute("notes") Notes notes, HttpSession session, Principal p, Model m) {

		notes.setDate(LocalDate.now());
		notes.setUser(getUser(p, m));

		Notes saveNotes = notesService.saveNotes(notes);

		if (saveNotes != null) {

			session.setAttribute("msg", "Note updated successfully ..");
			session.setAttribute("type", "alert-success");
			
		} else {

			session.setAttribute("msg", "Something went wrong ..");
			session.setAttribute("type", "alert-danger");

		}

		return "redirect:/user/viewNotes";
		
		//or same
		
		//return "redirect:viewNotes";

	}
	
	
	@GetMapping("/deleteNotes/{id}")
	public String deleteNotes(@PathVariable int id,HttpSession session) {

		boolean f = notesService.deleteNotes(id);
		
		if (f) {

			session.setAttribute("msg", "Note deleted successfully ..");
			session.setAttribute("type", "alert-success");
			
		} else {

			session.setAttribute("msg", "Something went wrong ..");
			session.setAttribute("type", "alert-danger");

		}
		
		return "redirect:/user/viewNotes";

	}

}
