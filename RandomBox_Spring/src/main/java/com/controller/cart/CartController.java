package com.controller.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService service;
	
	@RequestMapping("/cartList")
	public String cartList(HttpSession session, Model m) {
		
		MemberDTO m_dto = (MemberDTO)session.getAttribute("login");
		List<CartDTO> list = service.cartList(m_dto.getUserid());
		m.addAttribute("cartList", list);
		
		return "cartList";
	}
	
	@RequestMapping("/cartAdd")
	public String cartAdd(@ModelAttribute("randomGoodsForm") CartDTO dto,
						  @RequestParam String gCategory) {
		
		dto.setgName("["+gCategory+"] 랜덤박스");
		service.addCart(dto);
		
		return "redirect:cartList.do";
	}
}
