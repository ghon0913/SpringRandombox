package com.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.service.InquiryService;

@Controller
public class InquiryController {

	@Autowired
	InquiryService service;
}
