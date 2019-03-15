package com.myweb.model;

import lombok.Getter;
import lombok.Setter;

//자체 회원, 네이버 회원 테이블 각자 생성하자!
@Getter
@Setter
public class UserVO {
	private String wid;
	private String nid;
	private String pw;		//네이버 로그인에는 사용 x
	private String age;		//나이 X 연령대 O
	private String gender;
	private String email;
	private String name;
	private String birthday;
	private int lend;		// 대여 여부
	//네이버 ID로 회원가입 할 때 추가로 입력받을 정보
	private String tel;
	private String addr;
}