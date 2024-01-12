package com.goodtaste.www.store.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodtaste.www.store.StoreVO;

@Repository
public class StoreDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<StoreVO> getStoreList(StoreVO vo) {
		System.out.println("===>Mybatis로 getStoreList");
		return mybatis.selectList("StoreDAO.getStoreList",vo);
	}
	public StoreVO getStoreInfo(StoreVO vo) {
		System.out.println("===>Mybatis로 getStoreInfo기능 처리");
		return mybatis.selectOne("StoreDAO.getStoreInfo",vo);
	}
	public StoreVO getLogin(StoreVO vo) {
		System.out.println("===>mybatis로 getLogin 기능 처리");
		return mybatis.selectOne("StoreDAO.getLogin",vo);
	}
	
}
