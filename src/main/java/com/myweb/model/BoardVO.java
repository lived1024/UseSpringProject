package com.myweb.model;

public class BoardVO {
	private int b_num;
	private String wid;
	private String email;
	private String b_subject;
	private String b_content;
	private int readcount;
	private String b_regdate;
	private String b_file;
	private int b_kind;
	private int b_group;
	private int b_step;
	private int b_level;
	public int getB_num() {
		return b_num;
	}
	public String getWid() {
		return wid == null ? "" : wid;
	}
	public String getEmail() {
		return email == null ? "" : email;
	}
	public String getB_subject() {
		return b_subject == null ? "" : b_subject;
	}
	public String getB_content() {
		return b_content == null ? "" : b_content;
	}
	public int getReadcount() {
		return readcount;
	}
	public String getB_regdate() {
		return b_regdate == null ? "" : b_regdate;
	}
	public String getB_file() {
		return b_file == null ? "" : b_file;
	}
	public int getB_kind() {
		return b_kind;
	}
	public int getB_group() {
		return b_group;
	}
	public int getB_step() {
		return b_step;
	}
	public int getB_level() {
		return b_level;
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
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	public void setB_file(String b_file) {
		this.b_file = b_file;
	}
	public void setB_kind(int b_kind) {
		this.b_kind = b_kind;
	}
	public void setB_group(int b_group) {
		this.b_group = b_group;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public void setB_level(int b_level) {
		this.b_level = b_level;
	}
	
	
}
