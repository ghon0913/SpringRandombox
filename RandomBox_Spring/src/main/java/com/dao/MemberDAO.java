package com.dao;

import java.util.HashMap;
import java.util.Map;

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
	
	public MemberDTO searchMember(Map<String,String> map) {
		return template.selectOne("searchMember",map);
	}
	
	public String findUserId(Map<String,String> map) {
		return template.selectOne("findUserId",map);
	}
	
	public String findPasswd(Map<String,String> map) {
		return template.selectOne("findPasswd",map);
	}
	
}
