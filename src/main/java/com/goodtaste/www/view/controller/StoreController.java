package com.goodtaste.www.view.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.goodtaste.www.bookmark.BookMarkVO;
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
		  session.setAttribute("menuList", menuList);
		  return "storeOnly.do"; 
	  }
	  
	  
	  @RequestMapping(value="storeJoin.do") 
	  public String insertStore(StoreVO vo,HttpServletRequest request,MenuVO mvo) { 
		  return "redirect:storeJoin.jsp";
	  }
	  
	  @RequestMapping(value="storeJoinOK.do") 
	  public String insertStoreInfo(StoreVO vo,MenuVO mvo) throws IOException {
		  MultipartFile uploadFile = vo.getUploadFile();
		  if(!uploadFile.isEmpty()) {
			  long timeStamp = System.currentTimeMillis();
			  String fileName = timeStamp+"_"+uploadFile.getOriginalFilename();
			  uploadFile.transferTo(new File("C:/JavaStudy/spring2/MainProject3/src/main/webapp/img음식점/"+fileName));
			  vo.setPic(fileName);
		  }
		  System.out.println(vo.getSname()+":"+vo.getPassword());
		  System.out.println(mvo.getMenu().toString()+":"+mvo.getMenuPrice()+":"+mvo.getSname());
		  storeService.insertStoreInfo(vo); 
		  storeService.insertMenu(mvo); 
		  return "storeOnly.do"; 
	  }
	  
	  @RequestMapping(value="outStore.do")
	  public void outStore(StoreVO vo,WaitingVO wv,HttpServletResponse response) {
		  response.setCharacterEncoding("UTF-8");
		  StoreVO vo1 = storeService.getStoreInfo(vo);
		  storeService.outPlusSpaces(vo1);
		  List<WaitingVO> list = new ArrayList<WaitingVO>();
		  String jsonWaitingList = "{\"waitingList\":[";
		  list = storeService.getWaitingList(wv);
		  for(int i = 0;i<list.size();i++) {
			  jsonWaitingList += list.get(i).toJson();
			  if(i!=list.size()-1) {
				  jsonWaitingList +=",";
			  }
		  }
		  jsonWaitingList +="]}";
		  PrintWriter out;
		  try {
			out = response.getWriter();
			out.write(jsonWaitingList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	  
	  @RequestMapping(value="inStore.do")
	  public void inStore(StoreVO vo,WaitingVO wv,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		  response.setCharacterEncoding("UTF-8");
		  session = request.getSession();
		  List<WaitingVO> list = new ArrayList<WaitingVO>();
		  String jsonWaitingList = "{\"waitingList\":[";
		  System.out.println("inStore.do"+vo.getSname());
		  StoreVO vo1 = storeService.getStoreInfo(vo);
		  //웨이팅없을 때
		  if(vo1.getWaitingNum()==0) {
			  storeService.inMinusSpaces(vo);
			  
		  }else if(vo1.getWaitingNum()>0){//웨이팅있을 때
			  storeService.inMinusSpaces(vo);
			  storeService.inMinusWaitingNum(vo);
			  WaitingVO wv1 = storeService.getNo(wv);
			  System.out.println(wv1.getNo());
			  wv1.setSname(wv.getSname());
			  storeService.inUpdateWaiting(wv1);
			  list = storeService.getWaitingList(wv);
			  
			  for(int i = 0;i<list.size();i++) {
				  jsonWaitingList += list.get(i).toJson();
				  if(i!=list.size()-1) {
					  jsonWaitingList +=",";
				  }
			  }
			  
		      System.out.println(jsonWaitingList);
			  session.setAttribute("waitingList", list);
			  
		  }
		  jsonWaitingList +="]}";
		  PrintWriter out;
		  try {
			out = response.getWriter();
			out.write(jsonWaitingList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	  }
	  
	  @RequestMapping(value="leaveStore.do")
	  public void updateLeave(WaitingVO wv,StoreVO vo,HttpServletResponse response) {
		  response.setCharacterEncoding("UTF-8");
		  List<WaitingVO> list = new ArrayList<WaitingVO>();
		  storeService.inMinusWaitingNum(vo);
		  System.out.println(wv.getNo());
		  storeService.updateLeave(wv);
		  list = storeService.getWaitingList(wv);
		  String jsonWaitingList = "{\"waitingList\":[";
		  for(int i = 0;i<list.size();i++) {
			  jsonWaitingList += list.get(i).toJson();
			  if(i!=list.size()-1) {
				  jsonWaitingList +=",";
			  }
		  }
		  jsonWaitingList +="]}";
		  System.out.println(jsonWaitingList);
		  PrintWriter out;
		  try {
			out = response.getWriter();
			out.write(jsonWaitingList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	  }
	  
	  @RequestMapping(value="intervalWaiting.do")
	  public void intervalWaiting(WaitingVO wv,StoreVO vo,HttpServletResponse response) {
		  response.setCharacterEncoding("UTF-8");
		  List<WaitingVO> list = new ArrayList<WaitingVO>();
		  list = storeService.getWaitingList(wv);
		  String jsonWaitingList = "{\"waitingList\":[";
		  for(int i = 0;i<list.size();i++) {
			  jsonWaitingList += list.get(i).toJson();
			  if(i!=list.size()-1) {
				  jsonWaitingList +=",";
			  }
		  }
		  jsonWaitingList +="]}";
		  PrintWriter out;
		  try {
			out = response.getWriter();
			out.write(jsonWaitingList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	  
	  @RequestMapping(value="logoutStore.do")
	  public String logoutStore(HttpServletRequest request,HttpSession session) {
		  session = request.getSession();
		  session.invalidate();
		  return "storeOnly.do";
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
	  
	  @RequestMapping(value="bookMark.do")
	  public void bookMarkToggle(BookMarkVO bv,HttpServletResponse response) {
		  try {
			PrintWriter out = response.getWriter();
			if(storeService.bookMarkCheck(bv)==null) {
				  storeService.insertBookMark(bv);
				  out.write("1");
			  }else {
				  storeService.deleteBookMark(bv);
				  out.write("0");
			  }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	  }
	  
	  @RequestMapping(value="bookMark1.do")
	  public void bookMarkToggle1(BookMarkVO bv,HttpServletResponse response) {
		  try {
			PrintWriter out = response.getWriter();
			if(storeService.bookMarkCheck(bv)==null) {
				  
				  out.write("1");
			  }else {
				  
				  out.write("0");
			  }
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
	  }
	  
	  @RequestMapping(value="bookMarkUser.do")
	  public String bookMarkUser(BookMarkVO bv,Model model) {
		  model.addAttribute("bookMarkList",storeService.bookMarkUser(bv)); 
		  return "bookMarkUser.jsp";
	  }
	  
	  @RequestMapping(value="random.do")
	  public String randomStore(StoreVO vo,Model model) {
		  List<StoreVO> list = new ArrayList<StoreVO>();
		  int randomMax = storeService.getMaxRandom();
		  System.out.println("randomMax" +randomMax);
		  Set<Integer> set = new HashSet<Integer>();
	      while (set.size() < 5) {
	          int d = (int)(Math.random() * randomMax) + 1;
	          System.out.println("랜덤숫자 : "+d);
	          set.add(d);
	      }
	      System.out.println(set);
	      
	      for(int randomValue : set) {
	    	  System.out.println("gg");
	    	  vo.setRandom(randomValue);
	    	  list.add(storeService.getRandomSname(vo));
	      }
	      System.out.println(list);
	      model.addAttribute("randomStore",list);
	      return "random.jsp";
	  }
	  
	  @RequestMapping(value="ranking.do")
	  public String getRankingStore(StoreVO vo,Model model) {
		  List<StoreVO> list = new ArrayList<StoreVO>();
		  list = storeService.getRankingStore();
		  model.addAttribute("rankingList",list);
		  return "ranking.jsp";
	  }
}
