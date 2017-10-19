package com.controller.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderInfoDTO;
import com.service.MyPageService;
import com.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService o_service;
	
	@Autowired
	MyPageService m_service;
	
	/* 개별 주문 확인 */
	@RequestMapping("/orderConfirm")
	public String orderConfirm(@RequestParam String num, 
							   @RequestParam String userid,
							   Model m) {
		
		CartDTO c_dto = o_service.orderConfirm(Integer.parseInt(num));
		MemberDTO m_dto = m_service.myPageUserInfo(userid);
		
		m.addAttribute("cDTO", c_dto);
		m.addAttribute("mDTO", m_dto);
		m.addAttribute("chk_orderPage", "orderConfirm");
		return "order";
	}
	
	/* 개별 주문 결제 완료 */
	@RequestMapping("/orderDone")
	public String orderDone(@ModelAttribute("orderConfirmForm") OrderInfoDTO o_dto,
							Model m) {
		
		// OrderInfoDTO 저장
		GoodsDTO g_dto= o_service.goods_orderInfo(o_dto.getgCode());
		o_dto.setgName(g_dto.getgName());
		o_dto.setSellerId(g_dto.getSellerId());
		
		System.out.println(o_dto);
		
		// OrderInfoDTO 추가
		o_service.orderDone(o_dto, o_dto.getNum(), o_dto.getgCode());
			
		m.addAttribute("orderDTO", o_dto);
		m.addAttribute("chk_orderPage", "orderDone");
		return "order";
	}
	
	
}
