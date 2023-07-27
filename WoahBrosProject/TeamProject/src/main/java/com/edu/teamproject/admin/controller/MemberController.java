package com.edu.teamproject.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Member;
import com.edu.teamproject.model.adopt.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//멤버리스트 페이지 요청
	@GetMapping("/memberList")
	public ModelAndView getMemberList() {
		
		List<Member> userList = memberService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userList", userList);
		mav.setViewName("admin/memberListPage");
		
		return mav;
	}
}
