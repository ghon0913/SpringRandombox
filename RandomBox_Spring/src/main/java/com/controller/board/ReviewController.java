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
}
