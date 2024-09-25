package com.smart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.smart.entity.Notes;
import com.smart.entity.User;
import com.smart.repository.NotesRepository;

@Service
public class NotesServiceMgmtimpl implements INotesService {
	
	
	@Autowired
	private NotesRepository notesRepository;

	@Override
	public Notes saveNotes(Notes notes) {
		
		return notesRepository.save(notes);
		
	}

	@Override
	public Notes getNotesById(int id) {
		
		return notesRepository.findById(id).get();
		
	}

	@Override
	public Page<Notes> getNotesByUser(User user , int pageNo) {
		
		Pageable pageable = PageRequest.of(pageNo, 4);
	
		return notesRepository.findByuser(user ,pageable);
		
	}

	@Override
	public Notes updateNotes(Notes notes) {

		return notesRepository.save(notes);
		
	}

	@Override
	public boolean deleteNotes(int id) {
	
		 Notes notes = notesRepository.findById(id).get();
		 
		 if(notes != null) {
			 
			 notesRepository.delete(notes);
			 return true;
			 
		 }
		 
		return false;
		
	}

	
	
	
}
