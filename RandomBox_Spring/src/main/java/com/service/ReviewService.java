package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.ReviewDAO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.GoodsDTO;

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
	
	public String getGoodsName(String gCode) {
		return dao.getGoodsName(gCode);
	}
	
	/* 후기글 수정하기 */
	public void reviewUpdate(BoardDTO dto) {
		dao.reviewUpdate(dto);
	}
	
	/* 후기글 삭제하기 */
	public void reviewDelete(int num) {
		dao.reviewDelete(num);
	}
	
	/* 후기글 폼, 상품 정보 가져오기 */
	public GoodsDTO getGoodsInfo(String gCode) {
		GoodsDTO dto = dao.getGoodsInfo(gCode);
		return dto;
	}
	
	/* 후기글 작성하기 */
	public void reviewWrite(BoardDTO dto) {
		dao.reviewWrite(dto);
	}
	
	/* 메인, 조회수 높은 글 불러오기 */
	public List<BoardDTO> orderByReadCnt(){
		
		List<BoardDTO> list = dao.orderByReadCnt();
		return list;
	}
	
}
