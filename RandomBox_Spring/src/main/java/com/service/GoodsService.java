package com.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.GoodsDAO;
import com.dto.GoodsDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	public void insertGoods(GoodsDTO dto) {
		dao.insertGoods(dto);
	}
	
	public void deleteGoods(String gCode) {
		dao.deleteGoods(gCode);
	}
	

	public List<GoodsDTO> selectAllGoods() {
		System.out.println(dao.selectAllGoods().toString());
		return dao.selectAllGoods();
	}

	public List<GoodsDTO> selectByCategory(String gCategory) {
		System.out.println(gCategory+"서비스");
		return dao.selectByCategory(gCategory);
	}

	public List<GoodsDTO> selectBySearch(String searchWord) {
		return dao.selectBySearch(searchWord);
	}
	
	public List<GoodsDTO> selectBySellerId(String sellerId) {
		return dao.selectBySellerId(sellerId);
	}
	
	/* 메인, 최근 등록한 상품 가져오기 */
	public List<GoodsDTO> newGoods(){
		
		List<GoodsDTO> list = dao.newGoods();
		return list;
	}
}
