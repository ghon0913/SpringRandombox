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
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate template;
	
	/* 후기게시판 리스트 */
	public BoardPageDTO reviewListPage(int curPage, HashMap<String, String> searchMap) {
		
		BoardPageDTO dto = new BoardPageDTO();
		
		int sIndex = (curPage - 1) * dto.getPerPage();
        int length = dto.getPerPage();
        List<BoardDTO> list =
        	template.selectList("reviewList", searchMap, new RowBounds(sIndex, length));
        int totalCount = template.selectOne("reviewList_totalCount", searchMap);
        
        //pageDTO에 4개의 저장
        dto.setList(list);
        dto.setCurPage(curPage);
        dto.setTotalCount(totalCount);
        
        return dto;
	}
}
