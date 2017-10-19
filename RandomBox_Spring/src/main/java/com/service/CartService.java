package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CartDAO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;
	
	
	
}
