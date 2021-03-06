package com.myweb.service;

import com.myweb.model.UserVO;

public interface UserService {
	public int naverIdCheck(String nid);		//가입된 네이버 회원인지 확인
	public void naverUser(UserVO uv);			//네이버 회원 가입
	public UserVO getNaverUser(String nid);		//네이버 회원 정보 가져오기(세션용)
	public void createWebUser(UserVO uv);		//자체 회원 가입
	public int checkUserLogin(String wid, String pwd);	//자체 회원 ID체크
	public UserVO getWebUser(String wid);		//자체 회원 정보 가져오기(세션용)
	public int idChecker(String wid);			//자체 회원 ID 중복검사
}
