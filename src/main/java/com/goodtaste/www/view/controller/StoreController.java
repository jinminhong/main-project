package com.goodtaste.www.view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goodtaste.www.store.StoreVO;
import com.goodtaste.www.store.impl.StoreService;

@Controller
public class StoreController {
	@Autowired
	StoreService storeService;
	
	@RequestMapping(value="search.do")
	public String getStoreList(StoreVO vo,Model model) {
		model.addAttribute("searchKeyWord",vo.getSearchKeyWord());
		return "search.jsp";
	}
	@RequestMapping(value="storeCheck.do")
	public void getStoreInfo(StoreVO vo,HttpServletResponse response) {
		PrintWriter out;
		StoreVO vo1 = storeService.getStoreInfo(vo);
		
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			System.out.println("sname이다. "+vo.getSname());
			if(vo1==null) {
				out.write("0");
			}else {
				System.out.println("pic "+vo1.getPic());
				out.write(vo1.toJson());
			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	@RequestMapping(value="storeDetail.do")
	public String getStoreDetail(StoreVO vo, Model model) {
		StoreVO vo1 = storeService.getStoreInfo(vo);
		vo1.setSearchKeyWord(vo.getSearchKeyWord());
		vo1.setGenre(vo.getGenre());
		vo1.setAddress(vo.getAddress());
		model.addAttribute("storeInfo",vo1);
		System.out.println("1"+vo1.getSearchKeyWord()+" "+vo1.getSname());
		return "storeDetail.jsp";
	}
	
	@RequestMapping(value="storeLogin.do")
		public String getStoreLogin(StoreVO vo,HttpSession session,HttpServletRequest request) {
			session = request.getSession();
			storeService.getLogin(vo);
			return "";
		}
	
	
	@RequestMapping(value="storeJoin.do")
	public String insertStore(StoreVO vo,HttpServletRequest request) {
		
		return "storeJoin.jsp";
	}
}
