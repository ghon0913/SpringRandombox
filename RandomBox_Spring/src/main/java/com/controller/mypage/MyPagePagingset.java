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

	
	@RequestMapping("/orderinfoperpage")
	public String myPageOrderInfo(@RequestParam String perPage) {
		
		OrderInfoPageDTO.setPerPage(Integer.parseInt(perPage));
		new RedirectView("/orderinfo");
		return "redirect:/loginchk/orderinfo";
	}
	
	@RequestMapping("/orderinfodatepage")
	public String myPageOrderInfo(@RequestParam String startdate,
								  @RequestParam String finaldate) {
		
		OrderInfoPageDTO.setStartdate(startdate);
		OrderInfoPageDTO.setFinaldate(finaldate);
		return "redirect:/loginchk/orderinfo";
	}
	

}
