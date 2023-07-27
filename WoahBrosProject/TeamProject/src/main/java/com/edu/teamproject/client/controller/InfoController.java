package com.edu.teamproject.client.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Campaign;
import com.edu.teamproject.domain.Notice;
import com.edu.teamproject.model.info.CampaignService;
import com.edu.teamproject.model.notice.NoticeService;

@Controller
public class InfoController {
	
	@Autowired
	private CampaignService campaignService;
	
	@Autowired
	private NoticeService noticeService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//공지사항  페이지 요청
	@GetMapping("/notice")
	public ModelAndView getNoticePage(HttpServletRequest request) {
		
		List<Notice> noticeList = noticeService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList",noticeList);
		mav.setViewName("client/info/noticepage");
		
		return mav;
	}
	
	//공모사업  페이지 요청
	@GetMapping("/campaign")
	public ModelAndView getCampaignPage(HttpServletRequest request) {
		
		List<Campaign> campaignList=campaignService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("campaignList", campaignList);
		mav.setViewName("client/info/campaignpage");
		
		return mav;
	}
	
	//공모사업 글쓰기 폼 요청
	@GetMapping("/info/registform")
	public String getRegistForm(HttpServletRequest request) {
		return "client/info/campaignregistform";
	}
	
	//공모사업 글쓰기 상세보기 페이지
	@GetMapping("/campaign/detail")
	public ModelAndView getDetail(HttpServletRequest request, int campaign_idx) {
		
		logger.info("넘어온 게시물값 : " +campaign_idx);
		//logger.info("넘어온 유져값 : " +user_idx);

		Campaign campaign=campaignService.select(campaign_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("campaign", campaign);
		mav.setViewName("client/info/campaigndetail");
	
		return mav;
	}
	
	@PostMapping("/campaign/del")
	public ModelAndView del(HttpServletRequest request, Campaign campaign) {
		
		campaignService.delete(campaign.getCampaign_idx());
		
		return new ModelAndView("redirect:/campaign");	
	}
	
	@PostMapping("/campaign/search")
	public ModelAndView getListBySearch(HttpServletRequest request) {
		
		logger.info("호출성공");
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		logger.info("category is "+category);
		logger.info("keyword is "+keyword);
		
		List<Campaign> campaignList=null;
		
		if(category.length()<1 || keyword.length()<1) {
			campaignList=campaignService.selectAll();
		}else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("category", category);
			map.put("keyword", keyword);
			campaignList = campaignService.selectBySearch(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("campaignList",campaignList);
		mav.setViewName("client/info/campaignpage");
		
		return mav;
	}
	
}
