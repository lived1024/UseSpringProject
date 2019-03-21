package com.myweb.model;

public class RentalVO {
	private int rno;
	private int lno;
	private String lname;
	private String nid;
	private String wid;
	private int r_count;
	private int totalprice;
	private String r_start;
	private String r_end;
	private int state;
	public int getRno() {
		return rno;
	}
	public int getLno() {
		return lno;
	}
	public String getLname() {
		return lname == null ? "" : lname;
	}
	public String getNid() {
		return nid == null ? "" : nid;
	}
	public String getWid() {
		return wid == null ? "" : wid;
	}
	public int getR_count() {
		return r_count;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public String getR_start() {
		return r_start == null ? "" : r_start;
	}
	public String getR_end() {
		return r_end == null ? "" : r_end;
	}
	public int getState() {
		return state;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public void setR_end(String r_end) {
		this.r_end = r_end;
	}
	public void setState(int state) {
		this.state = state;
	}
}