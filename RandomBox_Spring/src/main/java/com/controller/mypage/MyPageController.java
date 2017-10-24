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
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.MyPageBoardPageDTO;
import com.dto.OrderInfoDTO;
import com.dto.OrderInfoPageDTO;
import com.service.MyPageService;

@RequestMapping("/loginchk")
@Controller
public class MyPageController {

	@Autowired
	MyPageService service;

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
		System.out.println(map);

		OrderInfoPageDTO oList = service.myPageOrderInfoPage(map, curPage);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pagedto", oList);
		mav.addObject("page", "myPage/myPageOrderInfo.jsp");
		mav.setViewName("myPage");
		return mav;
	}

	@RequestMapping("/board")
	public ModelAndView myboard(HttpSession session, @RequestParam(defaultValue = "1") int curPage) {
		MemberDTO logindto = (MemberDTO) session.getAttribute("login");
		HashMap<String, String> map = new HashMap();

		map.put("searchName", MyPageBoardPageDTO.getSearchName());
		map.put("searchValue", MyPageBoardPageDTO.getSearchValue());

		map.put("userId", logindto.getUserid());
		System.out.println(map);
		MyPageBoardPageDTO pagedto = service.boardpage(map, curPage);

		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "myPage/myPageBoardList.jsp");
		mav.addObject("pagedto", pagedto);
		mav.setViewName("myPage");
		System.out.println(MyPageBoardPageDTO.getPerPage());
		return mav;
	}

	@RequestMapping("/goodsinfo")
	public ModelAndView goodsinfo() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "myPage/myPageGoodsInfo.jsp");
		mav.setViewName("myPage");
		return mav;
	}

	@RequestMapping("/sellinfo")
	public ModelAndView sellinfo() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("page", "myPage/myPageSellInfo.jsp");
		mav.setViewName("myPage");
		return mav;
	}

}
