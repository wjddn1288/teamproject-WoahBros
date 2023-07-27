package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.exception.MemberException;

@Controller
public class NoticeController {
	// 명예의 전당 페이지 요청
	@GetMapping("/best")
	public String getBestPage(HttpServletRequest request) {
		return "client/notice/bestpage";
	}

	// 신고 게시판 페이지 요청
	@GetMapping("/report")
	public String getReportPage(HttpServletRequest request) {
		return "client/notice/reportpage";
	}

	// 신고 게시판 글쓰기 폼
	@GetMapping("/report/regist")
	public String getRegistForm(HttpServletRequest request) {
		return "client/notice/reportregistform";
	}
	
}
