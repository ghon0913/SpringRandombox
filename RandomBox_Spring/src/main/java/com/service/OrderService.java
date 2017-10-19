package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CartDAO;
import com.dao.OrderDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderInfoDTO;

@Service
public class OrderService {

	@Autowired
	OrderDAO o_dao;
	
	@Autowired
	CartDAO c_dao;
	
	/* 개별 주문 하기 */
	public CartDTO orderConfirm(int num){
		CartDTO dto = o_dao.orderConfirm(num);
		return dto;
	}
	
	/* 개별 주문 상품 정보 가져오기 */
	public GoodsDTO goods_orderInfo(String gCode) {
		GoodsDTO dto = o_dao.goods_orderInfo(gCode);
		return dto;
	}
	
	/* 주문 정보 저장하고 카드에서 삭제, 수량 감소시키기 */
	@Transactional
	public void orderDone(OrderInfoDTO dto, int num, String gCode) {
		o_dao.orderDone(dto);
		c_dao.delCart(num);
		o_dao.orderAfterAmount(gCode);
	}
	
}
