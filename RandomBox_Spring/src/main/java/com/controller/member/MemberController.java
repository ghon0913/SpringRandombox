package com.controller.member;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String memberAdd(@Valid @ModelAttribute("memberAddForm") MemberDTO dto, Model m, BindingResult result) {
		
		if(result.hasErrors()) {
			return "memberAddForm";
		}
		
		service.insertMember(dto);
		m.addAttribute("result", "회원가입을 축하합니다!!");
		
		return "home";
	}
	
	/* 아이디 중복 검사 */
	@RequestMapping(value="/idCheck", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(@RequestParam String userid) {
		
		String mesg = "사용가능";
		boolean ck = service.idCheck(userid);
		
		System.out.println(ck);
		if(ck) {
			mesg = "아이디 중복";
			return mesg;
		}else {
			return mesg;
		}
	}
	
	/* 이메일 중복 검사 */
	@RequestMapping(value="/emailCheck", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailCheck(@RequestParam String emailChk) {
		
		String mesg = "사용가능";
		boolean ck = service.emailCheck(emailChk);
		
		System.out.println(ck);
		if(ck) {
			mesg = "이메일 중복";
			return mesg;
		}else {
			return mesg;
		}
	}
}
