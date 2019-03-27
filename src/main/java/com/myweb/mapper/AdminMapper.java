package com.myweb.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface AdminMapper {
	public int pwcheck(String pwd);
	public UserVO adminSession();
	public ArrayList<RentalVO> rentalList();
	public RentalVO rental(int rno);
	public void cancelLaptop(@Param("lno")int lno, @Param("r_count")int r_count);
	public int confirmCancel(int rno);
	public int accept(int rno);
	public int rconfirm(int rno);
	public int confirmReturn(int rno);
	public int checkLaptop(int rno);
}
