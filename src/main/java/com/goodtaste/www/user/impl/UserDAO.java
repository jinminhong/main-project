package com.goodtaste.www.user.impl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodtaste.www.user.UserVO;
@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUser(UserVO vo) {
		System.out.println("===> Mybatis로 insertUser() 기능 처리");
		mybatis.insert("UserDAO.insertUser",vo);
	}
	
	public UserVO getId(UserVO vo) {
		System.out.println("===> Mybatis로 getId() 기능 처리");
		return mybatis.selectOne("UserDAO.getId",vo);
	}
	
	public UserVO getNickname(UserVO vo) {
		System.out.println("===> Mybatis로 getNickname() 기능 처리");
		return mybatis.selectOne("UserDAO.getNickname",vo);
	}
	public UserVO getLogin(UserVO vo) {
		System.out.println("===> Mybatis로 getLogin() 기능 처리");
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		return (UserVO)mybatis.selectOne("UserDAO.getLogin",vo);
	}
}
