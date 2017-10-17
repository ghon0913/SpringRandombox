package com.controller.board;

import java.util.HashMap;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
