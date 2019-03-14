package com.myweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.mapper.UserMapper;
import com.myweb.model.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper mapper;

	@Override
	public int naverIdCheck(String nid) {
		return mapper.naverIdCheck(nid);
	}
	
	@Override
	public void naverUser(UserVO uv) {
		// TODO Auto-generated method stub
		mapper.createNaverUser(uv);
	}

	@Override
	public UserVO getNaverUser(String nid) {
		UserVO uv=mapper.getNaverUser(nid);
		return uv;
	}

	@Override
	public void createWebUser(UserVO uv) {
		// TODO Auto-generated method stub
		mapper.createWebUser(uv);
	}

	@Override
	public int checkUserLogin(String wid, String pwd) {
		// TODO Auto-generated method stub
		/* 0 : ID 없음 
		 * 1 : 로그인 성공
		 * 2 : 비밀번호 오류 */
		int check=mapper.checkId(wid);
		int result=0;
		//0이면 ID 없음
		if(check==0) {	// ID가 없으면 종료
			return check;
		}else if(check==1){
			result=mapper.checkLogin(wid,pwd);
			if(result == 0) {
				result=2;	//비밀번호 불일치
				System.out.println("result : " + result);
			}
		}
		return result;
	}

	@Override
	public UserVO getWebUser(String wid) {
		// TODO Auto-generated method stub
		return mapper.getWebUser(wid);
	}
}
