package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.AdminMapper;
import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;

	@Override
	public int pwcheck(String pwd) {
		// TODO Auto-generated method stub
		return mapper.pwcheck(pwd);
	}

	@Override
	public UserVO adminSession() {
		// TODO Auto-generated method stub
		return mapper.adminSession();
	}

	@Override
	public ArrayList<RentalVO> rentalList() {
		// TODO Auto-generated method stub
		return mapper.rentalList();
	}
}
