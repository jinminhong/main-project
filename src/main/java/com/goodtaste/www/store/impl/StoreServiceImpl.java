package com.goodtaste.www.store.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodtaste.www.menu.MenuVO;
import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.store.StoreVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;
@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDAO storeDAO;
	@Override
	public List<StoreVO> getStoreList(StoreVO vo) {
		
		return storeDAO.getStoreList(vo);
	}
	@Override
	public StoreVO getStoreInfo(StoreVO vo) {
		
		return storeDAO.getStoreInfo(vo);
	}
	@Override
	public StoreVO getLogin(StoreVO vo) {
		
		return storeDAO.getLogin(vo);
	}
	@Override
	public void insertStoreInfo(StoreVO vo) {
		storeDAO.insertStoreInfo(vo);
		
	}
	@Override
	public void insertMenu(MenuVO mvo) {
		storeDAO.insertMenu(mvo);
		
	}
	@Override
	public List<MenuVO> getStoreMenu(MenuVO mvo) {
		
		return storeDAO.getStoreMenu(mvo); 
	}
	@Override
	public List<ReviewVO> getReview(ReviewVO rv) {
		
		return storeDAO.getReview(rv);
	}
	@Override
	public void updateSpace(StoreVO vo) {
		storeDAO.updateSpace(vo);
		
	}
	@Override
	public void insertWaiting(WaitingVO wv) {
		storeDAO.insertWaiting(wv);
		
	}
	@Override
	public List<WaitingVO> getWaitingList(WaitingVO wv) {
		return storeDAO.getWaitingList(wv);
	}
	@Override
	public void outPlusSpaces(StoreVO vo) {
		storeDAO.outPlusSpaces(vo);
		
	}
	@Override
	public void inMinusSpaces(StoreVO vo) {
		storeDAO.inMinusSpaces(vo);
	}
	@Override
	public void inUpdateWaiting(WaitingVO wv) {
		storeDAO.inUpdateWaiting(wv);
		
	}
	@Override
	public void inMinusWaitingNum(StoreVO vo) {
		storeDAO.inMinusWaitingNum(vo);
		
	}
	@Override
	public WaitingVO getNo(WaitingVO wv) {
		return storeDAO.getNo(wv);
		
	}
	@Override
	public void updateLeave(WaitingVO wv) {
		storeDAO.updateLeave(wv);
		
	}
	@Override
	public void updateStar(ReviewVO rv) {
		storeDAO.updateStar(rv);
		
	}
	
	
	
}
