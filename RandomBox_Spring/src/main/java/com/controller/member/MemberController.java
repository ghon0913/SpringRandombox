package com.controller.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	/* 회원가입 Form 보여주기 */
	@RequestMapping("/memberForm")
	public String memberForm() {
		
		return "memberAddForm";
	}
	
	/* 회원가입, member 테이블에 추가 */
	@RequestMapping(value="/memberAdd", method=RequestMethod.POST)
	public String memberAdd(@ModelAttribute("memberAddForm") MemberDTO dto, Model m) {
		
		service.insertMember(dto);
		m.addAttribute("result", "회원가입을 축하합니다!!");
		
		return "home";
	}
	
}
