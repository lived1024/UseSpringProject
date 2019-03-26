package com.myweb.model;

public class Criteria {
	private int pageNum=1;
	private int amount=5;	//한 페이지당 출력할 목록의 갯수
	private String where;	//검색 select
	private String field;	//검색 키워드
	
	public int getPageNum() {
		return pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public String getWhere() {
		return where == null ? "" : where;
	}
	public String getField() {
		return field == null ? "" : field;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public void setField(String field) {
		this.field = field;
	}
	
}
