package com.goodtaste.www.menu;

import java.util.List;

public class MenuVO {
	private String sname;
	private List<String> menuInfo;
	private List<String> menu;
	private List<String> menuPrice;
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public List<String> getMenuInfo() {
		return menuInfo;
	}
	public void setMenuInfo(List<String> menuInfo) {
		this.menuInfo = menuInfo;
	}
	public List<String> getMenu() {
		return menu;
	}
	public void setMenu(List<String> menu) {
		this.menu = menu;
	}
	public List<String> getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(List<String> menuPrice) {
		this.menuPrice = menuPrice;
	}
}
