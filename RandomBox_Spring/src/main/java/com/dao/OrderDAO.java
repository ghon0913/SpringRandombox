package com.dao;

import java.util.List;

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
	
	/* 전체 주문 하기, 전체주문시 카트정보 가져오기 */
	public List<CartDTO> orderAllConfirm(List<String> num){
		List<CartDTO> dto = template.selectList("orderAllConfirm", num);
		return dto;
	}
	
	/* 주문 상품 실제 상품명 얻기 */
	public List<GoodsDTO> getgName(List<String> gCodeList){
		List<GoodsDTO> gNameList = template.selectList("getgName", gCodeList);
		return gNameList;
	}
	
	/* 오더 추가, 카트 삭제, 재고 감소 */
	public void orderAllDone(List<OrderInfoDTO> orderDTOList, List<String> numList, List<String> gCodeList) {
		template.insert("orderAllDone", orderDTOList);
		template.delete("com.mybatis.CartMapper.delAllCart", numList);
		
		for (int i = 0; i < gCodeList.size(); i++) {
			String code1 = gCodeList.get(i);
			template.update("orderAfterAmount", gCodeList.get(i));

			for (int j = 0; j < gCodeList.size(); j++) {
				if (i == j) continue;
				String code2 = gCodeList.get(j);
				if (code1.equals(code2)) {
					template.update("orderAfterAmount", gCodeList.get(i));
				}
				break;
			}
		}
		
	}
	
}
