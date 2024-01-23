package com.goodtaste.www.user.impl;

import java.util.List;

import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;

public interface UserService {
	void insertUser(UserVO vo);
	
	UserVO getId(UserVO vo);
	
	List<UserVO> getUserList(UserVO vo);
	
	UserVO getNickname(UserVO vo);
	
	UserVO getLogin(UserVO vo);
	
	List<WaitingVO> getCurrentWaiting(WaitingVO wv);
	
	List<WaitingVO> getStoreWaiting(WaitingVO wv);
	
	List<WaitingVO> getReviewList(WaitingVO wv);
	
	void insertReview(ReviewVO rv);
	
	void updateReviewOKWaiting(WaitingVO wv);
	
	void updateUser(UserVO uv);
}
