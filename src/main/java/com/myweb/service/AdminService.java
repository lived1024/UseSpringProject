package com.myweb.service;

import java.util.ArrayList;

import com.myweb.model.RentalVO;
import com.myweb.model.UserVO;

public interface AdminService {
	public int pwcheck(String pwd);					// ������ �α���
	public UserVO adminSession();					//	������ ����
	public ArrayList<RentalVO> rentalList();		// �뿩 ���
	public int confirmCancel(int rno);				// ��� �Ϸ� ó�� 
	public int accept(int rno);						// �뿩 ����
	public int rconfirm(int rno);					// �뿩 ó�� �Ϸ�
	public int confirmReturn(int rno);				// �ݳ� ó�� �Ϸ�
}
