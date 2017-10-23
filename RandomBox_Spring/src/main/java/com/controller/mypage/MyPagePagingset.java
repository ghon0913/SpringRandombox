package com.controller.mypage;

import java.util.List;

import org.omg.PortableServer.ForwardRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.dto.MyPageBoardPageDTO;
import com.dto.OrderInfoDTO;
import com.dto.OrderInfoPageDTO;

@RequestMapping("/loginchk")
@Controller
public class MyPagePagingset {

	@RequestMapping("/orderinfoperpage")
	public String myPageOrderInfoperpage(@RequestParam(defaultValue = "3") String perPage) {
		OrderInfoPageDTO.setPerPage(Integer.parseInt(perPage));
		return "forward:/loginchk/orderinfo";
	}

	@RequestMapping("/orderinfodatepage")
	public String myPageOrderInfodatepage(@RequestParam(defaultValue = "1") String startdate,
			@RequestParam(defaultValue = "1") String finaldate) {
		OrderInfoPageDTO.setStartdate(startdate);
		OrderInfoPageDTO.setFinaldate(finaldate);
		return "forward:/loginchk/orderinfo";
	}

	@RequestMapping("/boardperpage")
	public String myPageboardperpage(@RequestParam(defaultValue = "3") String perPage) {
		MyPageBoardPageDTO.setPerPage(Integer.parseInt(perPage));
		return "forward:/loginchk/board";
	}

	@RequestMapping("/boardsearchpage")
	public String myPageboardsearch(@RequestParam(defaultValue = "1") String searchName,
			@RequestParam(defaultValue = "1") String searchValue) {
		MyPageBoardPageDTO.setSearchName(searchName);
		MyPageBoardPageDTO.setSearchValue(searchValue);
		return "forward:/loginchk/board";
	}

}
