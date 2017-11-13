package com.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.GoodsDTO;
import com.service.GoodsService;
import com.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	@Autowired
	GoodsService g_service;
	
	/* 후기게시판 전체 리스트(처음) */
	@RequestMapping("/reviewListAll")
	public String reviewListAll( ) {
		
		BoardPageDTO.setSearchCategory(null);
		return "forward:/reviewList";
	}
	
	/* 후기게시판 리스트 */
	@RequestMapping("/reviewList")
	public String reviewList(@RequestParam(required=false) String searchName,
							 @RequestParam(required=false) String searchWord,
							 @RequestParam(defaultValue="1") String curPage, Model m) {
        
			HashMap<String, String> searchMap = new HashMap<>();
			searchMap.put("searchCategory", BoardPageDTO.getSearchCategory());
			searchMap.put("searchName", searchName);
			searchMap.put("searchWord", searchWord);
			
			BoardPageDTO dto = service.reviewList(Integer.parseInt(curPage), searchMap);
			
			int curBlock = ( int )Math.ceil( Double.parseDouble(curPage) / dto.getPerBlock());
			int startPage = ( curBlock - 1 ) * dto.getPerBlock() + 1;
			int totalNum = dto.getTotalCount()/dto.getPerPage();
		    	if(dto.getTotalCount() % dto.getPerPage() != 0) totalNum++;
			int endPage = startPage + dto.getPerBlock() - 1;
				if(endPage > totalNum) endPage = totalNum;
			int endBlock = ( int )Math.ceil((double)totalNum / dto.getPerBlock());
				
			m.addAttribute("endBlock", endBlock);
			m.addAttribute("curBlock", curBlock);
			m.addAttribute("totalNum", totalNum);
			m.addAttribute("startPage", startPage);
			m.addAttribute("endPage", endPage);
			m.addAttribute("boardList", dto);
			m.addAttribute("chk_reviewPage", "reviewList");
			
			return "review";
	}
	
	/* 카테고리별 보기 */
	@RequestMapping("/reviewListByCategory")
	public String reviewListByCategory(@RequestParam(required=false) String searchCategory) {
		
		if(searchCategory.equals("all")) {
			searchCategory = null;
		}
		
		BoardPageDTO.setSearchCategory(searchCategory);
		return "forward:/reviewList";
	}
	
	/* 후기글 자세히보기 */
	@RequestMapping("/reviewRetrieve")
	public String reviewRetrieve(@RequestParam String num, Model m) {
		
		BoardDTO dto = service.reviewRetrieve(Integer.parseInt(num));
		m.addAttribute("retrieveDTO", dto);
		m.addAttribute("chk_reviewPage", "reviewRetrieve");
		
		return "review";
	}
	
	/* 후기글 수정하기 */
	@RequestMapping("/loginchk/reviewUpdate")
	public String reviewUpdate(@ModelAttribute("reviewRetrieveForm") BoardDTO dto, Model m) {
		
		service.reviewUpdate(dto);
		m.addAttribute("result", "수정이 완료되었습니다.");
		return "redirect:/reviewList.do";
	}
	
	/* 후기글 삭제하기 */
	@RequestMapping("/loginchk/reviewDelete")
	public String reviewDelete(@RequestParam String num, Model m) {
		
		service.reviewDelete(Integer.parseInt(num));
		m.addAttribute("result", "수정이 완료되었습니다.");
		return "redirect:/reviewList.do";
	}
	
	/* 상품 판매 페이지에서의 후기 게시판 */
	@RequestMapping("/goodsReviewList")
	public String goodsReviewList(@RequestParam(required=false) String searchCategory,
							   	  @RequestParam(required=false) String searchName,
								  @RequestParam(required=false) String searchWord ,
								  @RequestParam(defaultValue="1") String curPage, Model m) {
		
		HashMap<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCategory", searchCategory);
		searchMap.put("searchName", searchName);
		searchMap.put("searchWord", searchWord);
		
		BoardPageDTO dto = service.reviewList(Integer.parseInt(curPage), searchMap);
		
		m.addAttribute("boardList", dto);
		m.addAttribute("searchCategory", searchCategory);
		m.addAttribute("chk_reviewPage", "reviewPage");
		return "home";
	}
	
	/* 후기 작성 폼으로 가기 */
	@RequestMapping("/loginchk/reviewForm")
	public String reviewForm(@RequestParam String gCode,
							 @RequestParam String gPrice, Model m) {
		
		GoodsDTO dto = service.getGoodsInfo(gCode);
		
		System.out.println(gCode+"%%%%%" + dto);
		
		m.addAttribute("gPrice", gPrice);
		m.addAttribute("GoodsDTO", dto);
		m.addAttribute("chk_reviewPage", "reviewForm");
		return "review";
	}
	
	/* 후기 작성하기 */
	@RequestMapping("/loginchk/reviewWrite")
	public String reviewWrite(@ModelAttribute("reviewForm") BoardDTO dto) {
		
		dto.setState("상품후기");
		dto.setOpen("X");
		
		service.reviewWrite(dto);
		
		return "redirect:/loginchk/orderinfo";
	}
	
	/* 메인, 조회수 높은 글 불러오기 */
	@RequestMapping("/mainList")
	public String mainList(Model m) {
		
		List<BoardDTO> list = service.orderByReadCnt();
		m.addAttribute("reviewList", list);
		
		List<GoodsDTO> g_list = g_service.newGoods();
		m.addAttribute("goodsList", g_list);

		return "home";
	}
	
	/* 후기 작성한 상품인지 확인 */
	@RequestMapping("/chkReviewWrite")
	@ResponseBody
	public boolean chkReviewWrite() {
		
		boolean chk = true;
		
		return chk;
	}
	
}
