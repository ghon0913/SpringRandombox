package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.InquiryDAO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;

@Service
public class InquiryService {

	@Autowired
	InquiryDAO dao;
	
	/* 문의게시판 리스트 */
	public BoardPageDTO inquiryList(int curPage, HashMap<String, String> searchMap) {
		
		BoardPageDTO dto = dao.inquiryListPage(curPage, searchMap);
		return dto;
	}
	
	/* 문의글 자세히 보기 */
	@Transactional
	public BoardDTO inquiryRetrieve(int num) {
		
		dao.inquiryReadCnt(num);
		BoardDTO dto = dao.inquiryRetrieve(num);
		
		return dto;
	}
	
	/* 문의글 수정하기 */
	public void inquiryUpdate(BoardDTO dto) {
		dao.inquiryUpdate(dto);
	}
	
	/* 문의글 삭제하기 */
	public void inquiryDelete(int num) {
		dao.inquiryDelete(num);
	}
	
}
