package com.myweb.model;

import lombok.Getter;
import lombok.Setter;

//자체 회원, 네이버 회원 테이블 각자 생성하자!
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
	public String getWid() {
		return wid == null ? "" : wid;
	}
	public String getNid() {
		return nid == null ? "" : nid;
	}
	public String getPw() {
		return pw == null ? "" : pw;
	}
	public String getAge() {
		return age == null ? "" : age;
	}
	public String getGender() {
		return gender == null ? "" : gender;
	}
	public String getEmail() {
		return email == null ? "" : email;
	}
	public String getName() {
		return name == null ? "" : name;
	}
	public String getBirthday() {
		return birthday == null ? "" : birthday;
	}
	public int getLend() {
		return lend;
	}
	public String getTel() {
		return tel == null ? "" : tel;
	}
	public String getAddr() {
		return addr == null ? "" : addr;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setLend(int lend) {
		this.lend = lend;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}