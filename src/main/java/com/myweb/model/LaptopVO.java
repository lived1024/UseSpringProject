package com.myweb.model;

public class LaptopVO {
	private int lno;
	private String lname;
	private String cpu;
	private String ram;
	private double display;
	private String weight;
	private String battery;
	private int price;
	private int stock;
	
	public int getLno() {
		return lno;
	}
	public String getLname() {
		return lname == null ? "" : lname;
	}
	public String getCpu() {
		return cpu == null ? "" : cpu;
	}
	public String getRam() {
		return ram == null ? "" : ram;
	}
	public double getDisplay() {
		return display;
	}
	public String getWeight() {
		return weight == null ? "" : weight;
	}
	public String getBattery() {
		return battery == null ? "" : battery;
	}
	public int getPrice() {
		return price;
	}
	public int getStock() {
		return stock;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public void setDisplay(double display) {
		this.display = display;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}
