package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.LaptopVO;

public interface RentalService {
	public ArrayList<LaptopVO> list(String kind, String field);	//조건별 검색
}
