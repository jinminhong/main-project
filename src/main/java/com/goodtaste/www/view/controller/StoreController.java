package com.goodtaste.www.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goodtaste.www.menu.MenuVO;
import com.goodtaste.www.review.ReviewVO;
import com.goodtaste.www.store.StoreVO;
import com.goodtaste.www.store.impl.StoreService;
import com.goodtaste.www.user.UserVO;
import com.goodtaste.www.waiting.WaitingVO;

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
	public String getStoreDetail(StoreVO vo, Model model,MenuVO mvo,ReviewVO rv) {
		StoreVO vo1 = storeService.getStoreInfo(vo);
		vo1.setSearchKeyWord(vo.getSearchKeyWord());
		vo1.setGenre(vo.getGenre());
		vo1.setAddress(vo.getAddress());
		List<MenuVO> mvo1 = storeService.getStoreMenu(mvo);
		List<ReviewVO> rv1 = storeService.getReview(rv);
		model.addAttribute("storeInfo",vo1);
		model.addAttribute("menu",mvo1);
		model.addAttribute("review",rv1);
		return "storeDetail.jsp";
	}
	
	  @RequestMapping(value="storeOnly.do") 
	  public String storeOnly() { 
		  return "redirect:storeOnly.jsp"; 
	  }
	  
	  @RequestMapping(value="storeLogin.do") 
	  public String getStoreLogin(StoreVO vo,HttpSession session,HttpServletRequest request) { 
		  session = request.getSession(); 
		  System.out.println(vo.getSname() +":" + vo.getPassword()); 
		  StoreVO vo1 = storeService.getLogin(vo);
		  session.setAttribute("store", vo1); 
		  System.out.println(vo1.getSname() +":" + vo1.getPassword()); 
		  return "storeOnly.do"; 
	  }
	  
	  
	  @RequestMapping(value="storeJoin.do") 
	  public String insertStore(StoreVO vo,HttpServletRequest request,MenuVO mvo) { 
		  return "redirect:storeJoin.jsp";
	  }
	  
	  @RequestMapping(value="storeJoinOK.do") 
	  public String insertStoreInfo(StoreVO vo,MenuVO mvo) { 
		  System.out.println(vo.getSname()+":"+vo.getPassword());
		  System.out.println(mvo.getMenu().toString()+":"+mvo.getMenuPrice()+":"+mvo.getSname());
		  storeService.insertStoreInfo(vo); 
		  storeService.insertMenu(mvo); 
		  return "storeOnly.do"; 
	  }
	  
	  @RequestMapping(value="book.do")
	  public String bookUser(UserVO uv,StoreVO vo,Model model) {
		  StoreVO vo1 = storeService.getStoreInfo(vo);
		  model.addAttribute("spaces", vo1.getSpaces());
		  return "book.jsp";
	  }
	  
	  @RequestMapping(value="bookOK.do")
	  public String bookOKUser(UserVO uv,StoreVO vo,HttpServletRequest request,WaitingVO wv) {
		  storeService.updateSpace(vo);
		  HttpSession session = request.getSession();
		  uv = (UserVO)session.getAttribute("user");
		  wv.setId(uv.getId());
		  storeService.insertWaiting(wv);
		  return "index.do";
	  }
}
