package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.InquiryDAO;

@Service
public class InquiryService {

	@Autowired
	InquiryDAO dao;
	
	
	
}
