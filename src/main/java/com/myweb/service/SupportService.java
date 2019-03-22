package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface SupportService {
	public ArrayList<RentalVO> rentalState(String nid, String wid);
	public int confirmPass(String pass, String wid);
	public void updateInfo(UserVO uv);
}
