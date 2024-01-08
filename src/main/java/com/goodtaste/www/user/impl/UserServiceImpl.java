package com.goodtaste.www.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodtaste.www.user.UserVO;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO userDAO;
	
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);

	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO getId(UserVO vo) {
		return userDAO.getId(vo);
	}

	@Override
	public UserVO getNickname(UserVO vo) {
		return userDAO.getNickname(vo);
	}

	@Override
	public UserVO getLogin(UserVO vo) {
		
		return userDAO.getLogin(vo);
	}
	

}
