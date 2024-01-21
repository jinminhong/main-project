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
		storeService.updateStar(rv);
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
	
	
	//여기가 가게측 서버
	  @RequestMapping(value="storeOnly.do") 
	  public String storeOnly(WaitingVO wv,HttpSession session,HttpServletRequest request) {
		  session = request.getSession(); 
		  System.out.println(wv.getSname());
		  List<WaitingVO> list = storeService.getWaitingList(wv);
		  session.setAttribute("waitingList", list);
		  System.out.println(list);
		  return "storeOnly.jsp"; 
	  }
	  
	  @RequestMapping(value="storeLogin.do") 
	  public String getStoreLogin(StoreVO vo,HttpSession session,HttpServletRequest request,WaitingVO wv,MenuVO mvo) { 
		  session = request.getSession(); 
		  System.out.println(vo.getSname() +":" + vo.getPassword()); 
		  StoreVO vo1 = storeService.getLogin(vo);
		  session.setAttribute("store", vo1); 
		  System.out.println(vo1.getSname() +":" + vo1.getPassword());
		  System.out.println(vo1.getAbSpaces());
		  List<WaitingVO> list = storeService.getWaitingList(wv);
		  List<MenuVO> menuList = storeService.getStoreMenu(mvo);
		  System.out.println(menuList.get(0).getFoodname());
		  session.setAttribute("waitingList", list);
		  request.setAttribute("menuList", menuList);
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
	  
	  @RequestMapping(value="outStore.do")
	  public String outStore(StoreVO vo) {
		  StoreVO vo1 = storeService.getStoreInfo(vo);
		  storeService.outPlusSpaces(vo1);
		  return "redirect:storeOnly.do?sname="+vo1.getSname();
	  }
	  
	  @RequestMapping(value="inStore.do")
	  public String inStore(StoreVO vo,WaitingVO wv) {
		  StoreVO vo1 = storeService.getStoreInfo(vo);
		  if(vo1.getWaitingNum()<=0) {
			  storeService.inMinusSpaces(vo);
		  }else {
			  storeService.inMinusSpaces(vo);
			  storeService.inMinusWaitingNum(vo);
			  WaitingVO wv1 = storeService.getNo(wv);
			  System.out.println(wv1.getNo());
			  wv1.setSname(wv.getSname());
			  storeService.inUpdateWaiting(wv1);
		  }
		  return "redirect:storeOnly.do?sname="+vo1.getSname();
	  }
	  
	  @RequestMapping(value="leaveStore.do")
	  public String updateLeave(WaitingVO wv,StoreVO vo) {
		  storeService.inMinusWaitingNum(vo);
		  wv.setNo(Integer.parseInt(wv.getNum()));
		  storeService.updateLeave(wv);
		  return "redirect:storeOnly.do?sname="+vo.getSname();
	  }
	  
	  //여기까지
	  
	  
	  @RequestMapping(value="bookOK.do")
	  public String bookOKUser(UserVO uv,StoreVO vo,WaitingVO wv,HttpServletRequest request) {
		  storeService.updateSpace(vo);
		  HttpSession session = request.getSession();
		  uv = (UserVO)session.getAttribute("user");
		  wv.setId(uv.getId());
		  wv.setaNum(Integer.parseInt(wv.getAdultNum()));
		  wv.setbNum(Integer.parseInt(wv.getBabyNum()));
		  wv.settNum(Integer.parseInt(wv.getTotalNum()));
		  storeService.insertWaiting(wv);
		  request.setAttribute("bookOKMessage", "예약완료");
		  return "index.do";
	  }
	  
	  @RequestMapping(value="book.do")
	  public String bookUser(UserVO uv,StoreVO vo,Model model,HttpSession session,HttpServletRequest request) {
		  session = request.getSession();
		  
		  if(session.getAttribute("user")==null) {
			  String messageLogin = "로그인을 해주세요";
			  request.setAttribute("messageLogin", messageLogin);
			  return "index.jsp";
		  }
		  StoreVO vo1 = storeService.getStoreInfo(vo);
		  model.addAttribute("waitingNum", vo1.getWaitingNum());
		  return "book.jsp";
	  }
	  
	  
	  @RequestMapping(value="myLocation.do")
	  public String myLocationStore() {
		  System.out.println("gkgkgk");
		  return "myLocation.jsp";
	  }
	  
	  
	  
}
