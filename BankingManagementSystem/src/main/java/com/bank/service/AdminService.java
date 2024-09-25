package com.bank.service;

import java.util.List;

import com.bank.entities.AccountBalance;
import com.bank.entities.AccountTransaction;
import com.bank.entities.UserDtls;

public interface AdminService {
	public List<UserDtls> getAllUserByStatus(String role, String status);

	public AccountTransaction saveTrans(AccountTransaction trans);

	public AccountBalance saveBalance(AccountBalance bal);

	public List<AccountTransaction> getAllTrans();

	public UserDtls getDetailsByAcccountNum(String accNum);

	public boolean saveTrans(String transType, Double amt, int id);

	public boolean sendMoney( Double amt, UserDtls user, String senderAcc);

}
