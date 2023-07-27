package com.edu.teamproject.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Donate;
import com.edu.teamproject.model.donate.DonateService;

@Controller
public class DonateController {

	@Autowired
	private DonateService donateService;
	
	//후원 리스트 페이지 요청
	@GetMapping("/donateList")
	public ModelAndView getAdopList() {
		
		List<Donate> donateList=(List)donateService.selectAll();
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("donateList",donateList);
		mav.setViewName("admin/donate/donateListPage");
		
		return mav;
	}
	
	//비용처리 리스트 페이지 요청
	@GetMapping("/consumeList")
	public String getConsumeList() {
		return "admin/donate/consumeListPage";
	}
}
