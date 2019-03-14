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
}
