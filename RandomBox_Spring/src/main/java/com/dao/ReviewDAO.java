package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.GoodsDTO;

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
	
	/* 후기글 자세히 보기 */
	public BoardDTO reviewRetrieve(int num) {

		BoardDTO dto = template.selectOne("boardRetrieve", num);
		return dto;
	}
	
	/* 후기글 자세히 보기 + 조회수 업데이트 */
	public void reviewReadCnt(int num) {
		template.update("boardReadCnt", num);
	}
	
	/* 후기 상품 이름 가져오기 */
	public String getGoodsName(String gCode) {
		return template.selectOne("getGoodsName", gCode);
	}
	
	/* 후기글 수정하기 */
	public void reviewUpdate(BoardDTO dto) {
		template.update("reviewUpdate", dto);
	}
	
	/* 후기글 삭제하기 */
	public void reviewDelete(int num) {
		template.delete("boardDelete", num);
	}
	
	/* 후기글 폼, 상품 정보 가져오기 */
	public GoodsDTO getGoodsInfo(String gCode) {
		GoodsDTO dto = template.selectOne("getGoodsInfo", gCode);
		return dto;
	}
	
	/* 후기글 작성하기 */
	public void reviewWrite(BoardDTO dto) {
		template.insert("boardWrite", dto);
	}
	
	/* 메인, 조회수 높은 글 불러오기 */
	public List<BoardDTO> orderByReadCnt(){
		
		List<BoardDTO> list = template.selectList("orderByReadCnt");
		return list;
	}
}
