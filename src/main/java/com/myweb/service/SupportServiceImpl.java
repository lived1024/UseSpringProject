package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.SupportMapper;
import com.myweb.model.RentalVO;

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
}
