package com.goodtaste.www.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.store.StoreVO;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.user.impl.UserService;
import com.goodtaste.www.waiting.WaitingVO;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("index.do")
	public String index(UserVO vo) {
		return "index.jsp";
	}
	
	@RequestMapping(value="joinOK.do", method=RequestMethod.POST)
	public String insertUser(UserVO vo) {
		userService.insertUser(vo);
		return "index.jsp";
	}
	
	@RequestMapping(value="idCheck.do")
	public void userIdCheck(UserVO vo,HttpServletResponse response) {
		
		PrintWriter out;
		try {
			out = response.getWriter();
			if(userService.getId(vo)==null) {
				out.write("0");
			}else {
				out.write("1");
			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="nicknameCheck.do")
	public void userNicknameCheck(UserVO vo,HttpServletResponse response) {
		PrintWriter out;
		try {
			out=response.getWriter();
			if(userService.getNickname(vo)==null) {
				out.write("0");
			}else {
				out.write("1");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="login.do")
	public String userLogin(UserVO vo,HttpSession session,HttpServletRequest request) {

		if(userService.getLogin(vo)==null) {
			String message = "아이디 비번 에러";
			
			request.setAttribute("message", message);
			return "index.do";
		}else {
			
			session = request.getSession();
			session.setAttribute("user",userService.getLogin(vo));
			System.out.println(userService.getLogin(vo).toString());
			return "index.do";
		}
	}
	
	@RequestMapping(value="logout.do")
	public String userLogout(UserVO vo,HttpSession session,HttpServletRequest request) {
		session.invalidate();
		return "index.do";
	}
	
	@RequestMapping(value="currentWaiting.do")
	public String userCurrentBook(UserVO uv,WaitingVO wv, HttpServletRequest request,HttpSession session) {
		session = request.getSession(); 
		uv = (UserVO)session.getAttribute("user");
		wv.setId(uv.getId());
		List<WaitingVO> list = userService.getCurrentWaiting(wv);
		List<Integer> waitingNum = new ArrayList<Integer>();
		for(int i = 0;i<list.size();i++) {
			wv.setSname(list.get(i).getSname());
			List<WaitingVO> listWaiting = userService.getStoreWaiting(wv);
			for(int j = 0;j<listWaiting.size();j++) {
				if(listWaiting.get(j).getId().equals(wv.getId())) {
					waitingNum.add(j+1);
					break;
				}
			}
		}
		
		request.setAttribute("waitingNum", waitingNum);
		request.setAttribute("waitingList", list);
		return "currentWaiting.jsp";
	}
	
	@RequestMapping(value="review.do")
	public String getReviewList(UserVO uv,WaitingVO wv, HttpSession session, HttpServletRequest request,Model model) {
		session = request.getSession();
		uv = (UserVO)session.getAttribute("user");
		wv.setId(uv.getId());
		List<WaitingVO> list = userService.getReviewList(wv);
		model.addAttribute("reviewList", list);
		return "review.jsp";
	}
	
	@RequestMapping(value="storeReview.do")
	public String storeReview(UserVO uv,StoreVO vo,WaitingVO wv,ReviewVO rv,HttpServletRequest request) {
		System.out.println(wv.getNo());
		request.setAttribute("store", wv);
		return "storeReview.jsp";
	}
	
	@RequestMapping(value="storeReviewOK.do")
	public String insertReview(ReviewVO rv,WaitingVO wv,HttpServletRequest request,HttpSession session) {
		session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		rv.setId(vo.getId());
		System.out.println("storeReviewOK "+wv.getNo());
		userService.insertReview(rv);
		userService.updateReviewOKWaiting(wv);
		request.setAttribute("reviewMessage", "리뷰 작성완료");
		
		return "index.do";
	}
	
	@RequestMapping(value="updateUser.do")
	public String updateUser(UserVO uv) {
		return "modify.jsp";
	}
	
	@RequestMapping(value="modify.do")
	public String modifyUser(UserVO uv,HttpServletRequest request,HttpSession session) {
		session = request.getSession();
		userService.updateUser(uv);
		session.setAttribute("user",userService.getLogin(uv));
		request.setAttribute("modifyUser", "회원정보 수정 완료");
		return "index.do";
	}
}
