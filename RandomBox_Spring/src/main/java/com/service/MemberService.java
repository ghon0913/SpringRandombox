package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;
	
	public void insertMember(MemberDTO dto) {
		
		dao.insertMember(dto);
	}
}
