package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.InquiryDAO;
import com.dto.AnswerDTO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.GoodsDTO;

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
	
	/* 해당 카테고리 상품명 불러오기 */
	public List<GoodsDTO> selectCategory(String category){
		
		List<GoodsDTO> list = dao.selectCategory(category);
		return list;
	}
	
	/* 문의글 쓰기 */
	public void inquiryWrite(BoardDTO dto) {
		dao.inquiryWrite(dto);
	}
	
	/* 판매자 - 답변할 질문 리스트 */
	public BoardPageDTO questionList(int curPage, String gCode) {
		
		BoardPageDTO dto = dao.questionList(gCode, curPage);
		return dto;
	}
	
	/* 답변 */
	@Transactional
	public void answerWrite(AnswerDTO dto, int boardNum) {
		
		dao.answerWrite(dto);
		dao.stateUpdate(boardNum);
	}
	
	/* 답변불러오기 */
	public AnswerDTO selectAnswer(int num){
		AnswerDTO a_dto = dao.selectAnswer(num);
		return a_dto;
	}
	
}
