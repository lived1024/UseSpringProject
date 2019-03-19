package com.myweb.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.LaptopVO;

public interface RentalMapper {
	public ArrayList<LaptopVO> list(@Param("kind")String kind, @Param("field")String field);
}
