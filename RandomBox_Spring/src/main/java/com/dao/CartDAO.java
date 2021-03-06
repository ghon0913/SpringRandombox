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
	
	/* 장바구니 추가 */
	public void addCart (CartDTO dto) {
		template.insert("addCart", dto);
	}

	/* 장바구니 개별삭제 */
	public void cartDelete(int num) {
		template.delete("delCart", num);
	}
	
	/* 장바구니 전체삭제 */
	public void cartDeleteAll(List<String> checks) {
		template.delete("delAllCart", checks);
	}
}
