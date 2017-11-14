package com.controller.mypage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.BoardDTO;
import com.dto.GoodsDTO;
import com.dto.GoodsPageDTO;
import com.dto.MemberDTO;
import com.dto.MyPageBoardPageDTO;
import com.dto.OrderInfoDTO;
import com.dto.OrderInfoPageDTO;
import com.service.InquiryService;
import com.service.MyPageService;
import com.service.ReviewService;

@RequestMapping("/loginchk")
@Controller
public class MyPageController {

	@Autowired
	MyPageService service;
	@Autowired
	InquiryService inqservice;
	@Autowired
	ReviewService rvservice;

	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
	public ModelAndView myPage(HttpSession session) {
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		MemberDTO dto = service.myPageUserInfo(logindto.getUserid());
		ModelAndView mav = new ModelAndView();
		mav.addObject("login", dto);
		mav.setViewName("myPage");
		return mav;
	}

	@RequestMapping("/userInfo")
	public ModelAndView userinfo(HttpSession session) {
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		MemberDTO dto = service.myPageUserInfo(logindto.getUserid());
		ModelAndView mav = new ModelAndView();
		mav.addObject("mdto", dto);

		// 이메일자르기
		String email = dto.getEmail();
		int n = email.indexOf("@");
		int m = email.length();
		String email1 = email.substring(0, n);
		String email2 = email.substring(n + 1, m);
		mav.addObject("email1", email1);
		mav.addObject("email2", email2);

		// 전화번호자르기
		String phone = dto.getPhone();
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7, 11);
		mav.addObject("phone1", phone1);
		mav.addObject("phone2", phone2);
		mav.addObject("phone3", phone3);

		// page include하기
		mav.addObject("page", "myPage/myPageUserInfo.jsp");
		mav.setViewName("myPage");
		return mav;

	}

	@RequestMapping("/userInfoUpdate")
	public ModelAndView userinfoUpdate(@ModelAttribute("memberinfo") MemberDTO updto) {
		service.userinfoUpdate(updto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage");
		mav.addObject("userInfoUpdate", "수정되었습니다.");
		return mav;
	}

	@RequestMapping(value = "/orderinfo", method = RequestMethod.GET)
	public ModelAndView orderinfo(HttpSession session, @RequestParam(defaultValue = "1") int curPage) {
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		
		HashMap<String, String> map = new HashMap();
		map.put("startdate", OrderInfoPageDTO.getStartdate());
		map.put("finaldate", OrderInfoPageDTO.getFinaldate());
		map.put("userId", logindto.getUserid());

		OrderInfoPageDTO oList = service.myPageOrderInfoPage(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pagedto", oList);
		mav.addObject("page", "myPage/myPageOrderInfo.jsp");
		mav.setViewName("myPage");
		return mav;
	}
	
	@RequestMapping(value = "/orderretrieve", method = RequestMethod.GET)
	@ResponseBody
	public OrderInfoDTO orderretrieve(HttpSession session, @RequestParam int ordernum ) {

		OrderInfoDTO orderretrieve = service.orderinforetrieve(ordernum);		
		return orderretrieve;
	}
	
	@RequestMapping("/boardlist")
	public ModelAndView myboardList(HttpSession session, @RequestParam(defaultValue = "1") int curPage) {
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		HashMap<String, String> map = new HashMap();

		map.put("userId", logindto.getUserid());
		map.put("searchName", MyPageBoardPageDTO.getSearchName());
		map.put("searchValue", MyPageBoardPageDTO.getSearchValue());

		MyPageBoardPageDTO pagedto = service.boardpage(map, curPage);

		ModelAndView mav = new ModelAndView();

		mav.addObject("pagedto", pagedto);
		mav.addObject("page", "myPage/myPageBoardList.jsp");
		mav.setViewName("myPage");
		return mav;
	}
	
	@RequestMapping("/myPageBoardRetrieve")
	public ModelAndView myboard(HttpSession session, @RequestParam int bnum, @RequestParam String state,
								@RequestParam String atMyPage) {
		ModelAndView mav = new ModelAndView();
		
		if(state.equals("처리중")||state.equals("답변완료")) {
			BoardDTO dto = inqservice.inquiryRetrieve(bnum);
			mav.addObject("retrieveDTO", dto);
			mav.addObject("atMyPage",atMyPage);
			mav.addObject("chk_inquiryPage", "inquiryRetrieve");
			mav.setViewName("inquiry");
		}else if(state.equals("상품후기")) {
			BoardDTO dto = rvservice.reviewRetrieve(bnum);
			mav.addObject("retrieveDTO", dto);
			mav.addObject("atMyPage",atMyPage);
			mav.addObject("chk_reviewPage", "reviewRetrieve");
			mav.setViewName ("review");
		}
	
		return mav;
	}

	
	@RequestMapping("/goodsinfo")
	public ModelAndView goodsinfo(HttpSession session, @RequestParam(defaultValue = "1") int curPage,
								@RequestParam(required=false) String searchName,
								@RequestParam(required=false) String searchValue) {
		
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		HashMap<String, String> map = new HashMap();
		
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		map.put("userId", logindto.getUserid());
		
		GoodsPageDTO pagedto = service.goodsinfo(map, curPage);
		System.out.println(pagedto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pagedto",pagedto);
		mav.addObject("page", "myPage/myPageGoodsInfo.jsp");
		mav.setViewName("myPage");
		return mav;
	}

	/* 주문 정보 */
	@RequestMapping("/sellinfo")
	public ModelAndView sellInfo(HttpSession session, @RequestParam(defaultValue = "1") int curPage) {

		ModelAndView mav = new ModelAndView();
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		
		String sellerId = logindto.getUserid();
		OrderInfoPageDTO sellInfoDTO = service.sellInfo(sellerId, curPage);
		
		mav.addObject("sellInfoDTO", sellInfoDTO);
		mav.addObject("page", "myPage/myPageSellInfo.jsp");
		mav.setViewName("myPage");
		return mav;
	}
	
	/* 배송 처리 */
	@RequestMapping("/statusUpdate")
	@ResponseBody
	public void statusUpdate(@RequestParam int num) {
		service.statusUpdate(num);
	}
}
