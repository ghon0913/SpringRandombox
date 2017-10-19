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

	public List<GoodsDTO> selectAllGoods() {
		return dao.selectAllGoods();
	}

	public List<GoodsDTO> selectByCategory(String gCategory) {
		return dao.selectByCategory(gCategory);
	}

	public List<GoodsDTO> selectBySearch(String searchWord) {
		return dao.selectBySearch(searchWord);
	}
}
