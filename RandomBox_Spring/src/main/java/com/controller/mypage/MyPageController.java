package com.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.service.MyPageService;

@RequestMapping("/loginchk")
@Controller
public class MyPageController {

	@Autowired
	MyPageService service;
	

	
	@RequestMapping(value="/MyPage", method=RequestMethod.GET)
	public String myPage(HttpSession session, Model m ){
		MemberDTO logindto = (MemberDTO)session.getAttribute("login");
		MemberDTO dto = service.myPageUserInfo(logindto.getUserid());
		m.addAttribute("login",dto);
		return "myPage";
	}
	
	
	@RequestMapping("/userInfo")
	public String userinfo(HttpSession session,Model m ){
		MemberDTO logindto = (MemberDTO)session.getAttribute("login");
		MemberDTO dto = service.myPageUserInfo(logindto.getUserid());
		m.addAttribute("mdto",dto);
		m.addAttribute("page","myPage/myPageUserInfo.jsp");
		return "myPage";
	}
	
	@RequestMapping("/myPageuserInfoUpdate")
	public String userinfoUpdate(HttpSession session,Model m ){
		System.out.println("userifup");
		
		
		return "myPage";
	}
	
	
}
