package com.myweb.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.myweb.model.LaptopVO;

public interface RentalService {
	public ArrayList<LaptopVO> list(String kind, String field);	//조건별 검색
	public LaptopVO getDetail(int lno);	//상세보기
	public void applyRental(HashMap<String, Object> hm);
}
