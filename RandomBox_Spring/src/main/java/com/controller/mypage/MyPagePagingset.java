package com.controller.mypage;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	public String myPageOrderInfodatepage(@RequestParam(defaultValue = "") String startdate,
			@RequestParam(defaultValue = "") String finaldate) {
		OrderInfoPageDTO.setStartdate(startdate);
		OrderInfoPageDTO.setFinaldate(finaldate);
		return "forward:/loginchk/orderinfo";
	}

	@RequestMapping("/boardperpage")
	public String myPageboardperpage(@RequestParam(defaultValue = "3") String perPage) {
		MyPageBoardPageDTO.setPerPage(Integer.parseInt(perPage));
		System.out.println(MyPageBoardPageDTO.getSearchValue());
		return "forward:/loginchk/board";
	}

	@RequestMapping("/boardsearchpage")
	public String myPageboardsearch(@RequestParam(defaultValue = "") String searchName,
			@RequestParam(defaultValue = "") String searchValue) {
		MyPageBoardPageDTO.setSearchName(searchName);
		MyPageBoardPageDTO.setSearchValue(searchValue);
		return "forward:/loginchk/board";
	}

}
