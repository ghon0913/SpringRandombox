package com.controller.board;

import java.util.HashMap;
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
import com.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	/* 후기게시판 리스트 */
	@RequestMapping("/reviewList")
	public String reviewList(@RequestParam(required=false) String searchCategory,
							 @RequestParam(required=false) String searchName,
							 @RequestParam(required=false) String searchWord ,
							 @RequestParam(defaultValue="1") String curPage, Model m) {

        if(curPage == null) {
               curPage = "1";
        }
        
        if(searchCategory != null && searchCategory.equals("all")) {
        	searchCategory = null;
        }
        
			HashMap<String, String> searchMap = new HashMap<>();
			searchMap.put("searchCategory", searchCategory);
			searchMap.put("searchName", searchName);
			searchMap.put("searchWord", searchWord);
			
			BoardPageDTO dto = service.reviewList(Integer.parseInt(curPage), searchMap);
			
			m.addAttribute("boardList", dto);
			m.addAttribute("chk_reviewPage", "reviewList");
			return "review";
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
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate(@ModelAttribute("reviewRetrieveForm") BoardDTO dto) {
		
		service.reviewUpdate(dto);
		return "redirect:/reviewList.do";
	}
	
	/* 후기글 삭제하기 */
	@RequestMapping("/reviewDelete")
	public String reviewDelete(@RequestParam String num) {
		
		service.reviewDelete(Integer.parseInt(num));
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
		
		return "redirect:/reviewList.do";
	}
	
}
