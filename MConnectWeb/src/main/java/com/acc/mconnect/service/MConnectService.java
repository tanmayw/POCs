package com.acc.mconnect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.mconnect.dao.MConnectDAO;

@Service
public class MConnectService {

	@Autowired
	MConnectDAO mConnectDAO;
	public MConnectDAO getMConnectDAO()
	{
		return mConnectDAO;
	}
}
