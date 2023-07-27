package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Campaign;
import com.edu.teamproject.domain.Member;
import com.edu.teamproject.model.info.CampaignService;
import com.edu.teamproject.util.Message;

@RestController
@RequestMapping("/rest")
public class RestInfoController {
	
	@Autowired
	private CampaignService campaignService;	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	@PostMapping("campaign/regist")	
	public ResponseEntity<Message> regist(HttpServletRequest requst, Campaign campaign, Member member){

		Campaign campaignEmpty = new Campaign();
		campaign.setMember(member);
		//logger.info("넘겨받은 캠페인은 " + campaign);
		campaignService.insert(campaign);
		
		Message message = new Message();
		message.setMsg("글등록 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	@PutMapping("/campaign")
	public ResponseEntity<Message> edit(HttpServletRequest requst,@RequestBody Campaign campaign){
		
		logger.info("수정할 게시글의 DTO는 :" +campaign);
		
		campaignService.update(campaign);
		Message message = new  Message();
		message.setMsg("수정성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;

	}
}
