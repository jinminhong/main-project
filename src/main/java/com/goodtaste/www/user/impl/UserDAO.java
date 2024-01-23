package com.goodtaste.www.user.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;
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
	
	public List<WaitingVO> getCurrentWaiting(WaitingVO wv){
		System.out.println("===>my batis로 getCurrentWaiting()기능 처리");
		return mybatis.selectList("UserDAO.getCurrentWaiting",wv);
	}
	
	public List<WaitingVO> getStoreWaiting(WaitingVO wv){
		System.out.println("===>mybatis로 getStoreWaiting() 기능 처리 유저가 웨이팅 등록한 가게들의 웨이팅 정보 가져오기");
		return mybatis.selectList("UserDAO.getStoreWaiting",wv);
	}
	
	public List<WaitingVO> getReviewList(WaitingVO wv){
		System.out.println("===>mybatis로 getReviews가져옴");
		return mybatis.selectList("UserDAO.getReviewList",wv);
	}
	
	public void insertReview(ReviewVO rv) {
		System.out.println("===>mybatis로 insertReview 기능 처리");
		mybatis.insert("UserDAO.insertReview",rv);
	}
	
	public void updateReviewOKWaiting(WaitingVO wv) {
		System.out.println("===>mybatis로 updateReviewOKWaiting기능 처리");
		mybatis.update("UserDAO.updateReviewOKWaiting",wv);
	}
	
	public void updateUser(UserVO uv) {
		System.out.println("===>mybatis로 updateUser 기능 처리");
		mybatis.update("UserDAO.updateUser",uv);
	}
}
