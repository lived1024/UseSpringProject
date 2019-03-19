package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.RentalMapper;
import com.myweb.model.LaptopVO;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private RentalMapper mapper;

	@Override
	public ArrayList<LaptopVO> list(String kind, String field) {
		// TODO Auto-generated method stub		
		return mapper.list(kind,field);
	}

	

}
