package com.goodtaste.www.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;
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

	@Override
	public List<WaitingVO> getCurrentWaiting(WaitingVO wv) {
		
		return userDAO.getCurrentWaiting(wv);
	}

	@Override
	public List<WaitingVO> getStoreWaiting(WaitingVO wv) {
		
		return userDAO.getStoreWaiting(wv);
	}

	@Override
	public List<WaitingVO> getReviewList(WaitingVO wv) {
		
		return userDAO.getReviewList(wv);
	}

	@Override
	public void insertReview(ReviewVO rv) {
		userDAO.insertReview(rv);
		
	}

	@Override
	public void updateReviewOKWaiting(WaitingVO wv) {
		userDAO.updateReviewOKWaiting(wv);
		
	}
	
	

}
