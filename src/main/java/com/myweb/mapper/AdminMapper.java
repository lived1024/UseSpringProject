package com.myweb.mapper;

import java.util.ArrayList;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface AdminMapper {
	public int pwcheck(String pwd);
	public UserVO adminSession();
	public ArrayList<RentalVO> rentalList();
}
