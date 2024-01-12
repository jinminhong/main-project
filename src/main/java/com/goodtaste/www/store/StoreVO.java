package com.goodtaste.www.store;

public class StoreVO {
	private String sname;
	private String genre;
	private String address;
	private String pic;
	private String bookOrWait;
	private int spaces;
	private int openFrom;
	private int openEnd;
	private String searchKeyWord;
	private String storeDesc;
	private int waitNum;
	public int getWaitNum() {
		return waitNum;
	}
	public void setWaitNum(int waitNum) {
		this.waitNum = waitNum;
	}
	public String getStoreDesc() {
		return storeDesc;
	}
	public void setStoreDesc(String storeDesc) {
		this.storeDesc = storeDesc;
	}
	public String getSearchKeyWord() {
		return searchKeyWord;
	}
	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getBookOrWait() {
		return bookOrWait;
	}
	public void setBookOrWait(String bookOrWait) {
		this.bookOrWait = bookOrWait;
	}
	public int getSpaces() {
		return spaces;
	}
	public void setSpaces(int spaces) {
		this.spaces = spaces;
	}
	public int getOpenFrom() {
		return openFrom;
	}
	public void setOpenFrom(int openFrom) {
		this.openFrom = openFrom;
	}
	public int getOpenEnd() {
		return openEnd;
	}
	public void setOpenEnd(int openEnd) {
		this.openEnd = openEnd;
	}
	public String toJson() {
		return "{"
				+ "	\"pic\" : \"" + pic+"\","
				+ "	\"spaces\" : \""+spaces+"\""
				+ "}";
	}
}
