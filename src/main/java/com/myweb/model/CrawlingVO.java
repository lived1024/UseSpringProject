package com.myweb.model;

public class CrawlingVO {
	private String title;
	private String address;
	public String getTitle() {
		return title == null ? "" : title;
	}
	public String getAddress() {
		return address == null ? "" : address;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
