package com.goodtaste.www.waiting;

import java.sql.Timestamp;

public class WaitingVO {
	private String sname;
	private String id;
	private String adultNum;
	private String babyNum;
	private String totalNum;
	private int spaces;
	private int aNum;
	private int bNum;
	private int tNum;
	private String name;
	private int no;
	private String num;
	private Timestamp waitingtime;
	
	public Timestamp getWaitingtime() {
		return waitingtime;
	}
	public void setWaitingtime(Timestamp waitingtime) {
		this.waitingtime = waitingtime;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	public int getSpaces() {
		return spaces;
	}
	public void setSpaces(int spaces) {
		this.spaces = spaces;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdultNum() {
		return adultNum;
	}
	public void setAdultNum(String adultNum) {
		this.adultNum = adultNum;
	}
	public String getBabyNum() {
		return babyNum;
	}
	public void setBabyNum(String babyNum) {
		this.babyNum = babyNum;
	}
	public String getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}
	
	public String toJson() {
		return "{"
				+"\"name\" : \"" + name +"\","
				+"\"aNum\" : \"" + aNum +"\","
				+"\"bNum\" : \"" + bNum +"\","
				+"\"tNum\" : \"" + tNum +"\","
				+"\"no\" :\""+no+"\""
				+"}";
	}
}
