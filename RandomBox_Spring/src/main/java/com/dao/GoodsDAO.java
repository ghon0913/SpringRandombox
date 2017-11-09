package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.GoodsDTO;
import com.dto.MemberDTO;


@Repository
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public void insertGoods(GoodsDTO dto) {
		template.insert("insertGoods", dto);
	}
	
	public void deleteGoods(String gCode) {
		template.delete("deleteGoods", gCode);
	}
	
	public List<GoodsDTO> selectAllGoods() {
		
		return template.selectList("selectAllGoods");
	}
	
	public List<GoodsDTO> selectByCategory(String gCategory) {
		return template.selectList("selectByCategory", gCategory);
	}
	
	public List<GoodsDTO> selectBySearch(String searchWord) {
		return template.selectList("selectBySearch", searchWord);
	}
	
	public List<GoodsDTO> selectBySellerId(String sellerId) {
		return template.selectList("selectBySellerId", sellerId);
	}
	
	/* 메인, 최근 등록한 상품 가져오기 */
	public List<GoodsDTO> newGoods(){
		
		List<GoodsDTO> list = template.selectList("newGoods");
		return list;
	}
	
	
}
