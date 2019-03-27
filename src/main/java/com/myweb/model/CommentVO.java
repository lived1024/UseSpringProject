package com.myweb.model;

public class CommentVO {
	private int c_num;
	private int b_num;
	private String wid;
	private String email;
	private String c_comment;
	private String c_regdate;
	public int getC_num() {
		return c_num;
	}
	public int getB_num() {
		return b_num;
	}
	public String getWid() {
		return wid == null ? "" : wid;
	}
	public String getEmail() {
		return email == null ? "" : email;
	}
	public String getC_comment() {
		return c_comment == null ? "" : c_comment;
	}
	public String getC_regdate() {
		return c_regdate == null ? "" : c_regdate;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}
	
}
