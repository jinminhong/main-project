package com.goodtaste.www.store.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodtaste.www.store.StoreVO;
@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDAO storeDAO;
	@Override
	public List<StoreVO> getStoreList(StoreVO vo) {
		
		return storeDAO.getStoreList(vo);
	}
	
}
