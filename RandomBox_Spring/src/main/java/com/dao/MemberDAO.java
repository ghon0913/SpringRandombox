package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public void insertMember(MemberDTO dto) {
		
		template.insert("insertMember", dto);
	}
}
