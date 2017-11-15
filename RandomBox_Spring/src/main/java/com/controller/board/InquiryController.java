package com.controller.board;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.dto.AnswerDTO;
import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.dto.GoodsDTO;
import com.service.InquiryService;
import com.service.ReviewService;

@Controller
public class InquiryController {

	@Autowired
	InquiryService service;
	
	@Autowired
	ReviewService r_service;
	
	/* 문의게시판 전체 리스트(처음) */
	@RequestMapping("/inquiryListAll")
	public String inquiryListAll( ) {
		
		BoardPageDTO.setSearchCategory(null);
		return "forward:/inquiryList";
	}
	
	/* 문의게시판 리스트 */
	@RequestMapping("/inquiryList")
	public String inquiryList(@RequestParam(required=false) String searchName,
							 @RequestParam(required=false) String searchWord,
							 @RequestParam(defaultValue="1") String curPage,
							 @RequestParam(required=false, value="resultMesg") String resultMesg, Model m) {
        
			HashMap<String, String> searchMap = new HashMap<>();
			
			searchMap.put("searchCategory", BoardPageDTO.getSearchCategory());
			searchMap.put("searchName", searchName);
			searchMap.put("searchWord", searchWord);
			
			BoardPageDTO dto = service.inquiryList(Integer.parseInt(curPage), searchMap);
			
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
			m.addAttribute("chk_inquiryPage", "inquiryList");
			m.addAttribute("result", resultMesg);
			
			return "inquiry";
			
	}
	
	/* 카테고리별 보기 */
	@RequestMapping("/inquiryListByCategory")
	public String inquiryListByCategory(@RequestParam(required=false) String searchCategory,
										@RequestParam(required=false) String chkSearch) {
		
		if(searchCategory.equals("all")) {
			searchCategory = null;
		}
		
		BoardPageDTO.setSearchCategory(searchCategory);
		return "forward:/inquiryList";
	}
	
	/* 문의글게시판 자세히보기 */
	@RequestMapping("/inquiryRetrieve")
	public String inquiryRetrieve(@RequestParam String num, Model m) {
		
		BoardDTO dto = service.inquiryRetrieve(Integer.parseInt(num));
		AnswerDTO a_dto;
		
		if(dto.getState().equals("답변완료")) {
			a_dto = service.selectAnswer(Integer.parseInt(num));
			System.out.println(a_dto);
			m.addAttribute("answerDTO", a_dto);
		}
		
		String gCode = dto.getgCode();
		String gName = r_service.getGoodsName(gCode);
		m.addAttribute("gName", gName);
		
		m.addAttribute("retrieveDTO", dto);
		m.addAttribute("chk_inquiryPage", "inquiryRetrieve");
		return "inquiry";
	}
	
	/* 문의글 수정하기 */
	@RequestMapping("/loginchk/inquiryUpdate")
	public String inquiryUpdate(@ModelAttribute("inquiryRetrieveForm") BoardDTO dto,
								RedirectAttributes resultMesg, Model m) {
		
		service.inquiryUpdate(dto);
		resultMesg.addAttribute("resultMesg", "문의글 수정 성공!");
		return "redirect:/inquiryList.do";
	}
	
	/* 문의글 삭제하기 */
	@RequestMapping("/loginchk/inquiryDelete")
	public String inquiryDelete(@RequestParam String num, RedirectAttributes resultMesg, Model m) {
		
		service.inquiryDelete(Integer.parseInt(num));
		resultMesg.addAttribute("resultMesg", "문의글 삭제 성공!");
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
							   @RequestParam String select_question, Model m,
							   RedirectAttributes resultMesg) {
		
		if(select_question.equals("q_admin")) {
			dto.setCategory("관리자질문");
			dto.setgCode("admin");
		}
		
		service.inquiryWrite(dto);
		resultMesg.addAttribute("resultMesg", "문의글 등록 성공!");
		return "redirect:/inquiryList.do";
	}
	
	/* 판매자 - 답변할 질문 리스트 */
	@RequestMapping("/loginchk/questionList")
	public String questionList(@RequestParam(defaultValue="1") String curPage,
							   @RequestParam String gCode, Model m){
		
		BoardPageDTO dto = service.questionList(Integer.parseInt(curPage), gCode);
		
		int curBlock = ( int )Math.ceil( Double.parseDouble(curPage) / dto.getPerBlock());
		int startPage = ( curBlock - 1 ) * dto.getPerBlock() + 1;
		int totalNum = dto.getTotalCount()/dto.getPerPage();
	    	if(dto.getTotalCount() % dto.getPerPage() != 0) totalNum++;
		int endPage = startPage + dto.getPerBlock() - 1;
			if(endPage > totalNum) endPage = totalNum;
		int endBlock = ( int )Math.ceil((double)totalNum / dto.getPerBlock());
			
		m.addAttribute("endBlock", endBlock);
		m.addAttribute("totalNum", totalNum);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("boardList", dto);
		m.addAttribute("chk_QnAPage", "questionList");
		return "qnaList";
	}
	
	/* 답변하기 폼 */
	@RequestMapping("/loginchk/answerForm")
	public String answerForm(@RequestParam String num, Model m) {
		
		BoardDTO dto = service.inquiryRetrieve(Integer.parseInt(num));
		AnswerDTO a_dto;
		
		if(dto.getState().equals("답변완료")) {
			a_dto = service.selectAnswer(Integer.parseInt(num));
			System.out.println(a_dto);
			m.addAttribute("answerDTO", a_dto);
		}
		
		m.addAttribute("retrieveDTO", dto);
		m.addAttribute("chk_QnAPage", "answerForm");
		return "qnaList";
	}
	
	/* 답변 등록 */
	@RequestMapping("/loginchk/answerWrite")
	public String answerWrite(@ModelAttribute("answerForm") AnswerDTO dto,
							RedirectAttributes resultMesg) {
		
		service.answerWrite(dto, dto.getBoardNum());
		resultMesg.addAttribute("resultMesg", "답변글 등록 성공!");
		return "redirect:/loginchk/goodsinfo";
	}
	
	/* 답변수정 */
	@RequestMapping("/loginchk/answerUpdate")
	public String answerUpdate(@ModelAttribute("answerForm") AnswerDTO dto, Model m,
							RedirectAttributes redirectAttrs) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("answer", dto.getAnswer());
		map.put("boardNum", Integer.toString(dto.getBoardNum()));
		
		service.answerUpdate(map);
		redirectAttrs.addAttribute("num", dto.getBoardNum());
		return "redirect:/loginchk/goodsinfo";
	}
	
	/* 자주하는 질문 */
	@RequestMapping("/inquiryMain")
	public String inquiryMain(Model m) {
		
		m.addAttribute("chk_inquiryPage", "inquiryMain");		
		return "inquiry";
	}
	
}
