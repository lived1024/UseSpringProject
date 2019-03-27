package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface AdminService {
	public int pwcheck(String pwd);					// 관리자 로그인
	public UserVO adminSession();					//	관리자 세션
	public ArrayList<RentalVO> rentalList();		// 대여 목록
	public int confirmCancel(int rno);				// 취소 완료 처리 
	public int accept(int rno);						// 대여 승인
	public int rconfirm(int rno);					// 대여 처리 완료
	public int confirmReturn(int rno);				// 반납 처리 완료
}
