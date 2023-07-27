package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DonateController {
	//후원 페이지 요청
	@GetMapping("/donate")
	public String getDonatePage(HttpServletRequest request) {
		return "client/donate/donatepage";
	}
}
