package com.myweb.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.RentalVO;

public interface SupportMapper {
	public ArrayList<RentalVO> rentalState(@Param("nid")String nid, @Param("wid")String wid);
	public int confirmPass(@Param("pass") String pass, @Param("wid") String wid);
}