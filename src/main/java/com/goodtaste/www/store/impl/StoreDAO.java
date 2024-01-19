package com.goodtaste.www.store.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodtaste.www.menu.MenuVO;
import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.store.StoreVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;

@Repository
public class StoreDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<StoreVO> getStoreList(StoreVO vo) {
		System.out.println("===>Mybatis로 getStoreList");
		return mybatis.selectList("StoreDAO.getStoreList", vo);
	}

	public StoreVO getStoreInfo(StoreVO vo) {
		System.out.println("===>Mybatis로 getStoreInfo기능 처리");
		return mybatis.selectOne("StoreDAO.getStoreInfo", vo);
	}

	public StoreVO getLogin(StoreVO vo) {
		System.out.println("===>mybatis로 getLogin 기능 처리");
		return mybatis.selectOne("StoreDAO.getLogin", vo);
	}

	public void insertStoreInfo(StoreVO vo) {
		System.out.println("===>mybatis로 insertStoreInfo기능 처리");
		mybatis.insert("StoreDAO.insertStoreInfo", vo);
	}

	public void insertMenu(MenuVO mvo) {
		System.out.println("===>mybatis로 insertMenu기능 처리");
		
		for(int i=0; i<mvo.getMenu().size(); i++) {
			MenuVO dto=new MenuVO();
			dto.setFoodname(mvo.getMenu().get(i));
			dto.setFoodInfo(mvo.getMenuInfo().get(i));
			dto.setFoodprice(mvo.getMenuPrice().get(i));
			dto.setSname(mvo.getSname());
			mybatis.insert("StoreDAO.insertMenu", dto);
		}
	}
	
	public List<MenuVO> getStoreMenu(MenuVO mvo) {
		System.out.println("===>mybatis로 getStoremenu기능 처리");
		return mybatis.selectList("StoreDAO.getStoreMenu",mvo);
	}
	
	public List<ReviewVO> getReview(ReviewVO rv){
		System.out.println("===>mybatis로 getReview기능 처리");
		return mybatis.selectList("StoreDAO.getReview",rv);
	}
	
	public void updateSpace(StoreVO vo) {
		System.out.println("===>mybatis로 updateSpace기능 처리");
		mybatis.update("StoreDAO.updateSpace",vo);
	}
	
	public void insertWaiting(WaitingVO wv) {
		System.out.println("===>mybatis로 insertWaiting기능 처리");
		mybatis.insert("StoreDAO.insertWaiting",wv);
	}
	
	public List<WaitingVO> getWaitingList(WaitingVO wv){
		System.out.println("===>mybatis로 getWaitingList 기능처리");
		return mybatis.selectList("StoreDAO.getWaitingList",wv);
	}
	
	public void outPlusSpaces(StoreVO vo) {
		System.out.println("===>mybatis로 outPlusSpaces 기능 처리");
		mybatis.update("StoreDAO.outPlusSpaces",vo);
	}
	
	public void inMinusSpaces(StoreVO vo) {
		System.out.println("===>mybatis로 inMinusSpaces 기능 처리");
		mybatis.update("StoreDAO.inMinusSpaces",vo);
	}
	
	public void inUpdateWaiting(WaitingVO wv) {
		System.out.println("===>mybatis로 inDeleteWaiting 기능 처리");
		mybatis.delete("StoreDAO.inUpdateWaiting",wv);
	}
	
	public void inMinusWaitingNum(StoreVO vo) {
		System.out.println("===>mybatis로 inMinusWaitingNum 기능 처리");
		mybatis.update("StoreDAO.inMinusWaitingNum",vo);
	}
	
	public WaitingVO getNo(WaitingVO wv) {
		System.out.println("===>mybatis로 minNo뽑아오기");
		return mybatis.selectOne("StoreDAO.getNo", wv);
	}
	
	public void updateLeave(WaitingVO wv) {
		System.out.println("===>mybatis로 updateLeave기능 처리 도망간사람 처리하는거");
		mybatis.update("StoreDAO.updateLeave",wv);
	}
	
	public void updateStar(ReviewVO rv) {
		System.out.println("===>mybatis로 updateStar기능 처리");
		mybatis.update("StoreDAO.updateStar",rv);
	}
}
