package com.service;

import java.util.HashMap;
import java.util.Map;

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
	
	public MemberDTO searchMember(Map<String, String> map) {
		return dao.searchMember(map);
	}
}
