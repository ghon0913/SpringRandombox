package com.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService service;
	
	
	@RequestMapping("/loginchk/myPage")
	public ModelAndView userinfo(){
		System.out.println("dd");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage");
		return mav;
		
	}
	
	
	
}
