package com.goodtaste.www.review;

public class ReviewVO {
	private int num;
	private String sname;
	private String id;
	private String review;
	private String review_img;
	private Double star;
	public Double getStar() {
		return star;
	}
	public void setStar(Double star) {
		this.star = star;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	
}
