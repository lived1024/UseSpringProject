package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface AdminService {
	public int pwcheck(String pwd);					// 包府磊 肺弊牢
	public UserVO adminSession();					//	包府磊 技记
	public ArrayList<RentalVO> rentalList();		// 措咯 格废
	public int confirmCancel(int rno);				// 秒家 肯丰 贸府 
	public int accept(int rno);
}
