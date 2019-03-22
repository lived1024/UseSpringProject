package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.SupportMapper;
import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

@Service
public class SupportServiceImpl implements SupportService{
	
	@Autowired
	private SupportMapper mapper;

	@Override
	public ArrayList<RentalVO> rentalState(String nid, String wid) {
		// TODO Auto-generated method stub
		ArrayList<RentalVO> arr=mapper.rentalState(nid,wid);
		return arr;
	}

	@Override
	public int confirmPass(String pass, String wid) {
		// TODO Auto-generated method stub
		return mapper.confirmPass(pass, wid);
	}

	@Override
	public void updateInfo(UserVO uv) {
		// TODO Auto-generated method stub
		mapper.updateInfo(uv);
	}
}
