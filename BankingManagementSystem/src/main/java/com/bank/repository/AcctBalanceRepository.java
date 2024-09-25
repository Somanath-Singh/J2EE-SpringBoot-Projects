package com.bank.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.entities.AccountBalance;
import com.bank.entities.UserDtls;

public interface AcctBalanceRepository extends JpaRepository<AccountBalance, Integer> {

	public AccountBalance findByUser(UserDtls user);

}
