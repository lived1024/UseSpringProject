package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.mapper.RentalMapper;
import com.myweb.model.LaptopVO;
import com.myweb.model.RentalVO;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private RentalMapper mapper;

	@Override
	public ArrayList<LaptopVO> list(String kind, String field) {
		// TODO Auto-generated method stub		
		return mapper.list(kind,field);
	}

	@Override
	public LaptopVO getDetail(int lno) {
		// TODO Auto-generated method stub
		return mapper.getDetail(lno);
	}

	@Transactional
	@Override
	public void applyRental(RentalVO rv) {
		// TODO Auto-generated method stub
		// RENTAL에 insert
		// LAPTOP에 update - stock
		// USER에 update - 대여상태 
		mapper.applyRental(rv);					//rental에 insert
		int lno=rv.getLno();
		int r_count=rv.getR_count();
		mapper.updateStock(lno,r_count);		//laptop에 update
	}

}
