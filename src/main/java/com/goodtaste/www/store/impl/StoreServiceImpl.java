package com.goodtaste.www.store.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodtaste.www.menu.MenuVO;
import com.goodtaste.www.store.StoreVO;
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
	
	
}
