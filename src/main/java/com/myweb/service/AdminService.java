package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface AdminService {
	public int pwcheck(String pwd);
	public UserVO adminSession();
	public ArrayList<RentalVO> rentalList();
}
