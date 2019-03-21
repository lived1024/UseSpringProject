package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.RentalVO;

public interface SupportService {
	public ArrayList<RentalVO> rentalState(String nid, String wid);
}
