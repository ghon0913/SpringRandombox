package com.controller.board;

import java.util.HashMap;
import java.util.List;

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
import com.service.InquiryService;

@Controller
public class InquiryController {

	@Autowired
	InquiryService service;
	
	/* 문의게시판 리스트 */
	@RequestMapping("/inquiryList")
	public String inquiryList(@RequestParam(required=false) String searchCategory,
							 @RequestParam(required=false) String searchName,
							 @RequestParam(required=false) String searchWord ,
							 @RequestParam(defaultValue="1") String curPage, Model m) {
        
        if(searchCategory != null && searchCategory.equals("all")) {
        	searchCategory = null;
        }
        
			HashMap<String, String> searchMap = new HashMap<>();
			searchMap.put("searchCategory", searchCategory);
			searchMap.put("searchName", searchName);
			searchMap.put("searchWord", searchWord);
			
			BoardPageDTO dto = service.inquiryList(Integer.parseInt(curPage), searchMap);
			
			m.addAttribute("boardList", dto);
			m.addAttribute("chk_inquiryPage", "inquiryList");
			return "inquiry";
			
	}
	
	/* 문의글게시판 자세히보기 */
	@RequestMapping("/inquiryRetrieve")
	public String inquiryRetrieve(@RequestParam String num, Model m) {
		
		BoardDTO dto = service.inquiryRetrieve(Integer.parseInt(num));
		m.addAttribute("retrieveDTO", dto);
		m.addAttribute("chk_inquiryPage", "inquiryRetrieve");
		
		return "inquiry";
	}
	
	/* 문의글 수정하기 */
	@RequestMapping("/inquiryUpdate")
	public String inquiryUpdate(@ModelAttribute("inquiryRetrieveForm") BoardDTO dto) {
		
		service.inquiryUpdate(dto);
		return "redirect:/inquiryList.do";
	}
	
	/* 문의글 삭제하기 */
	@RequestMapping("/inquiryDelete")
	public String inquiryDelete(@RequestParam String num) {
		
		service.inquiryDelete(Integer.parseInt(num));
		return "redirect:/inquiryList.do";
	}
	
	/* 문의글 작성 폼 */
	@RequestMapping("/loginchk/inquiryForm")
	public String inquiryForm(Model m) {
		
		m.addAttribute("chk_inquiryPage", "inquiryForm");
		return "inquiry";
	}
	
	/* 질문 카테고리 선택 */
	@RequestMapping("/loginchk/selectCategory")
	public @ResponseBody List<GoodsDTO> selectCategory(@RequestParam String gCategory) {
	
		List<GoodsDTO> list = service.selectCategory(gCategory);
		return list;
		
	}
	
	/* 문의글 쓰기 */
	@RequestMapping("/loginchk/inquiryWrite")
	public String inquiryWrite(@ModelAttribute("inquiryWriteForm") BoardDTO dto,
							   @RequestParam String select_question) {
		
		if(select_question.equals("q_admin")) {
			dto.setCategory("관리자질문");
			dto.setgCode("admin");
		}
		
		service.inquiryWrite(dto);
		
		return"redirect:/inquiryList.do";
	}
}
