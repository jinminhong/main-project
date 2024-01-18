package com.goodtaste.www.store.impl;

import java.util.List;

import com.goodtaste.www.menu.MenuVO;
import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.store.StoreVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;

public interface StoreService {
	public List<StoreVO> getStoreList(StoreVO vo);
	
	public StoreVO getStoreInfo(StoreVO vo);
	
	public StoreVO getLogin(StoreVO vo);
	
	public void insertStoreInfo(StoreVO vo);
	
	public void insertMenu(MenuVO mvo);
	
	public List<MenuVO> getStoreMenu(MenuVO mvo);
	
	public List<ReviewVO> getReview(ReviewVO rv);
	
	public void updateSpace(StoreVO vo);
	
	public void insertWaiting(WaitingVO wv);
	
	public List<WaitingVO> getWaitingList(WaitingVO wv);
	
	public void outPlusSpaces(StoreVO vo);
	
	public void inMinusSpaces(StoreVO vo);
	
	public void inUpdateWaiting(WaitingVO wv);
	
	public void inMinusWaitingNum(StoreVO vo);
	
	public WaitingVO getNo(WaitingVO wv);
	
	public void updateLeave(WaitingVO wv);
}
