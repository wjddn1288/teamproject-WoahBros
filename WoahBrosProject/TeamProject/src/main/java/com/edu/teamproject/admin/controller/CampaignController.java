package com.edu.teamproject.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Campaign;
import com.edu.teamproject.model.info.CampaignService;

@Controller
public class CampaignController {
	
	
	@Autowired
	private CampaignService campaignService;
	
	//공모사업 리스트 페이지 요청
	@GetMapping("/campaign/list")
	public ModelAndView getCampaignList() {
		
		List<Campaign> campaignList = campaignService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("campaignList",campaignList);
		mav.setViewName("admin/campaign/campaignListPage");
		
		return mav;
	}
	
	@GetMapping("/campaign/detail")
	public ModelAndView getCampaignDetail(int campaign_idx) {
		
		Campaign campaign = campaignService.select(campaign_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("campaign",campaign);
		mav.setViewName("admin/campaign/campaignDetailPage");
		
		return mav;
	}
}
