package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.ReviewDAO;
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
	
}
