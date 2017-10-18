package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;

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
	
}
