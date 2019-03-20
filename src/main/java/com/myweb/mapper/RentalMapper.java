package com.myweb.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.LaptopVO;
import com.myweb.model.RentalVO;


public interface RentalMapper {
	public ArrayList<LaptopVO> list(@Param("kind")String kind, @Param("field")String field);
	public LaptopVO getDetail(int lno);
	public void applyRental(RentalVO rv);
	public void updateStock(@Param("lno") int lno, @Param("r_count") int r_count);
}
