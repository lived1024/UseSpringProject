package com.myweb.mapper;

import com.myweb.model.UserVO;

public interface UserMapper {
	public int naverIdCheck(String nid);
	public void createNaverUser(UserVO uv);
	public UserVO getNaverUser(String id);
	public void createWebUser(UserVO uv);
}
