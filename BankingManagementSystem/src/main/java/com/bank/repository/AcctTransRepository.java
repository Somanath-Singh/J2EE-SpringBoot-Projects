package com.bank.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.entities.AccountTransaction;
import com.bank.entities.UserDtls;

public interface AcctTransRepository extends JpaRepository<AccountTransaction, Integer> {

	public List<AccountTransaction> findByUser(UserDtls user);

}
