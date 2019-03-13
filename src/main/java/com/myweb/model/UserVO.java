package com.myweb.model;

import lombok.Getter;
import lombok.Setter;

//자체 회원, 네이버 회원 테이블 각자 생성하자!
@Getter
@Setter
public class UserVO {
	private String id;		//회원 id
	private String nid;		//네이버 id
	private String age;		//나이 X 연령대 O
	private String gender;
	private String email;
	private String name;
	private String birthday;
	//네이버 ID로 회원가입 할 때 추가로 입력받을 정보
	private String tel;
	private String addr;
	//네이버 로그인 회원가입 or 자체회원 가입 판별
	private int naver;	// 0:자체회원	1:네이버	2:둘다	2는 현재 구현X
}