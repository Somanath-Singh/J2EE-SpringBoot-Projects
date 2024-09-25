package com.smart.service;

import org.springframework.data.domain.Page;

import com.smart.entity.Notes;
import com.smart.entity.User;

public interface INotesService {
	
	public Notes saveNotes(Notes notes);
	
	public Notes getNotesById(int id);
	
	//public List<Notes> getNotesByUser(User user);
	
	public Page<Notes> getNotesByUser(User user , int pageNo);
	
	public Notes updateNotes(Notes notes);
	
	public boolean deleteNotes(int id);

}
