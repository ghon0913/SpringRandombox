package com.controller.mypage;

import java.util.List;

import org.omg.PortableServer.ForwardRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.dto.OrderInfoDTO;
import com.dto.OrderInfoPageDTO;

@RequestMapping("/loginchk")
@Controller
public class MyPagePagingset {

	@RequestMapping("/orderinfopage")
	public String myPageOrderInfo(@RequestParam(defaultValue = "3") String perPage, @RequestParam(defaultValue = "1") String startdate,
			@RequestParam(defaultValue = "1") String finaldate) {

		OrderInfoPageDTO.setPerPage(Integer.parseInt(perPage));
		OrderInfoPageDTO.setStartdate(startdate);
		OrderInfoPageDTO.setFinaldate(finaldate);
		return "redirect:/loginchk/orderinfo";
	}


}
