package com.myweb.service;

import com.myweb.model.UserVO;

public interface UserService {
	public int naverIdCheck(String nid);		//���Ե� ���̹� ȸ������ Ȯ��
	public void naverUser(UserVO uv);			//���̹� ȸ�� ����
	public UserVO getNaverUser(String nid);		//���̹� ȸ�� ���� ��������(���ǿ�)
	public void createWebUser(UserVO uv);		//��ü ȸ�� ����
	public int checkUserLogin(String wid, String pwd);	//��ü ȸ�� IDüũ
	public UserVO getWebUser(String wid);		//��ü ȸ�� ���� ��������(���ǿ�)
}
