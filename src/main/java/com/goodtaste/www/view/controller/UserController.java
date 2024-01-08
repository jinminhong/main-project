package com.goodtaste.www.view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.user.impl.UserService;

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
			return "index.do";
		}else {
			session = request.getSession();
			session.setAttribute("user",userService.getLogin(vo));
			return "index.do";
		}
	}
	
}
