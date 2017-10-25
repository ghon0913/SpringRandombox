package com.service;

import java.util.Arrays;
import java.util.List;

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
		if(num != 0) c_dao.delCart(num);
		o_dao.orderAfterAmount(gCode);
	}
	
	/* 전체 주문 하기 */
	public List<CartDTO> orderAllConfirm(List<String> num){
		List<CartDTO> dto = o_dao.orderAllConfirm(num);
		return dto;
	}
	
	/* 주문 상품 실제 상품명 얻기 */
	public List<GoodsDTO> getgName(List<String> gCodeList){
		List<GoodsDTO> gNameList = o_dao.getgName(gCodeList);
		return gNameList;
	}
	
	/* 오더 추가, 카트 삭제, 재고 감소 */
	@Transactional
	public void orderAllDone(List<OrderInfoDTO> orderDTOList, List<String> numList, List<String> gCodeList) {
		o_dao.orderAllDone(orderDTOList, numList, gCodeList);
	}
}
