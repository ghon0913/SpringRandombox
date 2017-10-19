package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.ReviewDAO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;

@Service
public class ReviewService {

	@Autowired
	ReviewDAO dao;
	
	/* 후기게시판 리스트 */
	public BoardPageDTO reviewList(int curPage, HashMap<String, String> searchMap) {
		
		BoardPageDTO dto = dao.reviewListPage(curPage, searchMap);
		return dto;
	}
	
	/* 후기글 자세히 보기 */
	@Transactional
	public BoardDTO reviewRetrieve(int num) {
		
		dao.reviewReadCnt(num);
		BoardDTO dto = dao.reviewRetrieve(num);
		
		return dto;
	}
	
	/* 후기글 수정하기 */
	public void reviewUpdate(BoardDTO dto) {
		dao.reviewUpdate(dto);
	}
	
	/* 후기글 삭제하기 */
	public void reviewDelete(int num) {
		dao.reviewDelete(num);
	}
	
}
