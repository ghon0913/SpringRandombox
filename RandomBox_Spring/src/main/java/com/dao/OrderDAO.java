package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderInfoDTO;

@Repository
public class OrderDAO {

	@Autowired
	SqlSessionTemplate template;
	
	/* 개별 주문 */
	public CartDTO orderConfirm(int num){
		CartDTO dto = template.selectOne("orderConfirm", num);
		return dto;
	}
	
	/* 개별 주문 상품 정보 가져오기 */
	public GoodsDTO goods_orderInfo(String gCode) {
		GoodsDTO dto = template.selectOne("goods_orderInfo", gCode);
		return dto;
	}
	
	/* 주문정보 저장하기 */
	public void orderDone(OrderInfoDTO dto) {
		template.insert("orderDone", dto);
	}
	
	/* amount 감소 */
	public void orderAfterAmount(String gCode) {
		template.update("orderAfterAmount", gCode);
	}
}
