package com.goodtaste.www.store.impl;

import java.util.List;

import com.goodtaste.www.store.StoreVO;

public interface StoreService {
	public List<StoreVO> getStoreList(StoreVO vo);
}