package com.smart.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.smart.entity.Notes;
import com.smart.entity.User;

public interface NotesRepository extends JpaRepository<Notes, Integer> {

	public Page<Notes> findByuser(User user , Pageable pageable);
	
}
