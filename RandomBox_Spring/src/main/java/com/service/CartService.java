package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CartDAO;
import com.dto.CartDTO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;
	
	/* 카트 리스트 */
	public List<CartDTO> cartList(String userId){
		List<CartDTO> list = dao.cartList(userId);
		return list;
	}
	
}
