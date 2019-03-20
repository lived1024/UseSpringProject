package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.LaptopVO;
import com.myweb.model.RentalVO;

public interface RentalService {
	public ArrayList<LaptopVO> list(String kind, String field);	//���Ǻ� �˻�
	public LaptopVO getDetail(int lno);	//�󼼺���
	public void applyRental(RentalVO rv);
}
