package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MyPageDAO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
}
