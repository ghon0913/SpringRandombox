package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AnswerDTO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.GoodsDTO;

@Repository
public class InquiryDAO {

	@Autowired
	SqlSessionTemplate template;
	
	/* 문의게시판 리스트 */
	public BoardPageDTO inquiryListPage(int curPage, HashMap<String, String> searchMap) {
		
		BoardPageDTO dto = new BoardPageDTO();
		
		int sIndex = (curPage - 1) * dto.getPerPage();
        int length = dto.getPerPage();
        List<BoardDTO> list =
        	template.selectList("inquiryList", searchMap, new RowBounds(sIndex, length));
        int totalCount = template.selectOne("inquiryList_totalCount", searchMap);
        
        //pageDTO에 4개의 저장
        dto.setList(list);
        dto.setCurPage(curPage);
        dto.setTotalCount(totalCount);
        
        return dto;
	}
	
	/* 문의글 자세히 보기 */
	public BoardDTO inquiryRetrieve(int num) {

		BoardDTO dto = template.selectOne("boardRetrieve", num);
		return dto;
	}
	
	/* 문의글 자세히 보기 + 조회수 업데이트 */
	public void inquiryReadCnt(int num) {
		template.update("boardReadCnt", num);
	}
	
	/* 문의글 수정하기 */
	public void inquiryUpdate(BoardDTO dto) {
		template.update("inquiryUpdate", dto);
	}
	
	/* 문의글 삭제하기 */
	public void inquiryDelete(int num) {
		template.delete("boardDelete", num);
	}
	
	/* 답변 삭제하기 */
	public void answerDelete(int num) {
		template.delete("answerDelete", num);
	}
	
	/* 해당 카테고리 상품명 불러오기 */
	public List<GoodsDTO> selectCategory(String category){
		
		List<GoodsDTO> list = template.selectList("selectCategory", category);
		return list;
	}
	
	/* 문의글 쓰기 */
	public void inquiryWrite(BoardDTO dto) {
		template.insert("boardWrite", dto);
	}
	
	/* 답변쓰기 리스트 */
	public BoardPageDTO questionList(String gCode, int curPage) {
		
		BoardPageDTO dto = new BoardPageDTO();
		
		int sIndex = (curPage - 1) * dto.getPerPage();
        int length = dto.getPerPage();
        List<BoardDTO> list = template.selectList("questionList", gCode);
        
        for (BoardDTO boardDTO : list) {
			System.out.println(boardDTO);
		}
        
        int totalCount = template.selectOne("questionList_totalCount", gCode);
        
        //pageDTO에 4개의 저장
        dto.setList(list);
        dto.setCurPage(curPage);
        dto.setTotalCount(totalCount);
        
        System.out.println(dto.getList()+"dao");
        
        return dto;
	}
	
	/*문의글 작성하기*/
	public void answerWrite(AnswerDTO dto) {
		template.insert("answerWrite", dto);
	}
	
	/* 문의글 수정하기 */
	public void answerUpdate(HashMap<String, String> map) {
		template.update("answerUpdate", map);
	}
	
	/*답변처리*/
	public int stateUpdate(int boardNum) {
		
		int n = template.update("stateUpdate", boardNum);
		return n;
	}
	
	/*답변불러오기*/
	public AnswerDTO selectAnswer(int num) {
		
		AnswerDTO a_dto = template.selectOne("selectAnswer", num);
		return a_dto;
	}
}
