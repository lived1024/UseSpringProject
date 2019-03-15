package com.myweb.mapper;

import org.apache.ibatis.annotations.Param;

import com.myweb.model.UserVO;

public interface UserMapper {
	public int naverIdCheck(String nid);
	public void createNaverUser(UserVO uv);
	public UserVO getNaverUser(String nid);
	public void createWebUser(UserVO uv);
	public int checkId(String wid);
	public int checkLogin(@Param("wid")String wid, @Param("pwd")String pwd);
	public UserVO getWebUser(String wid);
}
