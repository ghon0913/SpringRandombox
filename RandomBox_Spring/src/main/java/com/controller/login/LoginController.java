package com.controller.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,String> map, Model m,
			  HttpSession session) throws Exception{
		System.out.println(map);
		MemberDTO dto = service.searchMember(map);
		
		if(dto==null) {
			m.addAttribute("mesg", "아이디/비번 확인하세요");
		}else {
			session.setAttribute("login", dto);
			m.addAttribute("login", "로그인 성공");
		}
		return "home";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		
		return "loginForm";
	}
	
}



