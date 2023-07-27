package com.edu.teamproject.client.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.domain.AdoptImg;
import com.edu.teamproject.model.adopt.AdoptImgService;
import com.edu.teamproject.model.adopt.AdoptService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdoptController {
	
	@Autowired
	private AdoptService adoptService;
	
	@Autowired
	private AdoptImgService adoptImgService;
	
	//입양 페이지 요청
	@GetMapping("/adopt")
	public String getAdoptPage(HttpServletRequest request) {
		return "client/adopt/adoptpage";
	}
	
	@GetMapping("/adopt/detail")
	public ModelAndView getDetail(HttpServletRequest request, int adopt_idx) {
		
		Adopt adopt=adoptService.select(adopt_idx);
		
		List<AdoptImg> adoptImgList = adoptImgService.selectByAdopt(adopt_idx);
		
		adopt.setAdoptImgList(adoptImgList);
		
		log.info("어째 잘 받아오니? : "+ adopt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adopt",adopt);
		mav.setViewName("client/adopt/adoptDetail");
		
		return mav;
	}
}
