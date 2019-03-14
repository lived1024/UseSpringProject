package com.myweb.mapper;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.UserVO;

public interface UserMapper {
	public int naverIdCheck(String nid);
	public void createNaverUser(UserVO uv);
	public UserVO getNaverUser(String id);
	public void createWebUser(UserVO uv);
	public int getWebUser(@Param("nid") String nid, @Param("pwd")String pwd);
}
