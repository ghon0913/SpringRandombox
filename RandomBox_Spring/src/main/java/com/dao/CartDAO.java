package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;

@Repository
public class CartDAO {

	@Autowired
	SqlSessionTemplate template;
	
	/* 카트 리스트 */
	public List<CartDTO> cartList(String userId){
		List<CartDTO> list = template.selectList("cartList", userId);
		return list;
	}
	
	/* 개별 삭제 */
	public void delCart (int num) {
		template.delete("delCart", num);
	}
}
