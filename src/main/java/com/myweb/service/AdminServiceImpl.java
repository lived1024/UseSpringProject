package com.myweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public int confirmCancel(int rno) {
		// TODO Auto-generated method stub
		RentalVO rv=mapper.rental(rno);
		int lno=rv.getLno();
		int r_count=rv.getR_count();
		mapper.cancelLaptop(lno, r_count);		//수량 원상복귀
		return mapper.confirmCancel(rno);
	}

	@Override
	public int accept(int rno) {
		// TODO Auto-generated method stub
		return mapper.accept(rno);
	}

	@Override
	public int rconfirm(int rno) {
		// TODO Auto-generated method stub
		return mapper.rconfirm(rno);
	}

	@Override
	public int confirmReturn(int rno) {
		// TODO Auto-generated method stub
		return mapper.confirmReturn(rno);
	}

	@Transactional
	@Override
	public int checkLaptop(int rno) {
		// TODO Auto-generated method stub
		RentalVO rv=mapper.rental(rno);
		int lno=rv.getLno();
		int r_count=rv.getR_count();
		mapper.cancelLaptop(lno, r_count);		//취소에 이용했던 수량 원상복귀 이용
		return mapper.checkLaptop(rno);
	}
}
