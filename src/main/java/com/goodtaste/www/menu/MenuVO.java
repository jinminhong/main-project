package com.goodtaste.www.menu;

import java.util.List;

public class MenuVO {
	private String sname;
	private List<String> menuInfo;
	private List<String> menu;
	private List<String> menuPrice;
	private String foodname;
	private String foodprice;
	private String foodInfo;
	

	
	

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public String getFoodprice() {
		return foodprice;
	}

	public void setFoodprice(String foodprice) {
		this.foodprice = foodprice;
	}

	public String getFoodInfo() {
		return foodInfo;
	}

	public void setFoodInfo(String foodInfo) {
		this.foodInfo = foodInfo;
	}

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
