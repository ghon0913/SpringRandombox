package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDTO myPageUserInfo(String userid) {
		return template.selectOne("mypageuserinfo",userid);
	}
	

}
