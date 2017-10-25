package com.controller.order;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
		
		// OrderInfoDTO 추가
		o_service.orderDone(o_dto, o_dto.getNum(), o_dto.getgCode());
			
		m.addAttribute("orderDTO", o_dto);
		m.addAttribute("chk_orderPage", "orderDone");
		return "order";
	}
	
	/* 바로 주문 하기 */
	@RequestMapping("/orderAdd")
	public String orderAdd(@ModelAttribute("orderConfirmForm") CartDTO c_dto,
						   @RequestParam String gCategory,
							Model m) {

		c_dto.setgName("["+gCategory+"] 랜덤박스");
		MemberDTO m_dto = m_service.myPageUserInfo(c_dto.getUserId());
		
		m.addAttribute("cDTO", c_dto);
		m.addAttribute("mDTO", m_dto);
		m.addAttribute("chk_orderPage", "orderConfirm");
		return "order";
	}
	
	/* 전체 주문 확인 */
	@RequestMapping("/orderAllConfirm")
	public String orderAllConfirm(@RequestParam(value="check") String [] num, 
								  @RequestParam String userid, Model m) {
		
		System.out.println("****"+userid);
		
		List<CartDTO> c_dto = o_service.orderAllConfirm(Arrays.asList(num));
		MemberDTO m_dto = m_service.myPageUserInfo(userid);
		System.out.println("****"+m_dto);
		
		m.addAttribute("orderList", c_dto);
		m.addAttribute("mDTO", m_dto);
		m.addAttribute("chk_orderPage", "orderAllConfirm");
		return "order";
	}
	
	/* 전체 주문 결제 완료 */
	@RequestMapping("/orderAllDone")
	public String orderAllDone(@ModelAttribute("orderConfirmForm") OrderInfoDTO orderDTO,
							   @RequestParam(value="num") String [] numList,
							   Model m) {
		
		// 카트에서 정보 가져다 저장
		List<CartDTO> cartDTOList = o_service.orderAllConfirm(Arrays.asList(numList));
		List<OrderInfoDTO> orderDTOList = new ArrayList<>();
		List<String> gCodeList = new ArrayList<>();
		for (CartDTO cartDTO : cartDTOList) {

			OrderInfoDTO orderInfoDTO = new OrderInfoDTO();
				orderInfoDTO.setUserId(orderDTO.getUserId());
				orderInfoDTO.setOrderName(orderDTO.getOrderName());
				orderInfoDTO.setPhone(orderDTO.getPhone());
				orderInfoDTO.seteMail(orderDTO.geteMail());
				orderInfoDTO.setPost1(orderDTO.getPost1());
				orderInfoDTO.setPost2(orderDTO.getPost2());
				orderInfoDTO.setAddr1(orderDTO.getAddr1());
				orderInfoDTO.setAddr2(orderDTO.getAddr2());
				orderInfoDTO.setPayMethod(orderDTO.getPayMethod());
				orderInfoDTO.setgCode(cartDTO.getgCode());
				orderInfoDTO.setgPrice(cartDTO.getgPrice());
				orderInfoDTO.setgImage(cartDTO.getgImage());
				orderInfoDTO.setSellerId(cartDTO.getSellerId());
			orderDTOList.add(orderInfoDTO);
			
			gCodeList.add(cartDTO.getgCode());
		}

		//실제 배송 상품 이름 저장
		List<GoodsDTO> gNameList = o_service.getgName(gCodeList);
		for (OrderInfoDTO orderInfoDTO : orderDTOList) {
			for (GoodsDTO goodsDTO : gNameList) {
				if(orderInfoDTO.getgCode().equals(goodsDTO.getgCode())) {
					orderInfoDTO.setgName(goodsDTO.getgName());
				}
			}
		}
		
		// 오더 추가, 카트 삭제, 재고 감소
		o_service.orderAllDone(orderDTOList, Arrays.asList(numList), gCodeList);
		
		m.addAttribute("orderList", orderDTOList);
		m.addAttribute("chk_orderPage", "orderAllDone");
		return "order";
	}
	
}
