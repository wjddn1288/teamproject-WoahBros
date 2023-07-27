package com.edu.teamproject.admin.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {

 	//메인페이지 요청
	@GetMapping("/main")
	public String getMain() {
		return "admin/main";
	}
	
	//캘린더추가
	@GetMapping("/cal")
	public String getCal() {
		return "/admin/cal";
	}
	
	//디폴트 페이지
	@GetMapping("/addpage2")
	public String addPage2() {
		return "/admin/addPage2";
	}
	
	//관리자 인증 페이지 요청
	@GetMapping("/loginform")
	public String getLoginForm() {
		return "admin/loginPage";
	}
}
 