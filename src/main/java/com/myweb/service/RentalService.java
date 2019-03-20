package com.myweb.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.myweb.model.LaptopVO;

public interface RentalService {
	public ArrayList<LaptopVO> list(String kind, String field);	//���Ǻ� �˻�
	public LaptopVO getDetail(int lno);	//�󼼺���
	public void applyRental(HashMap<String, Object> hm);
}
