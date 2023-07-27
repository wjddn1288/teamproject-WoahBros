package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Member;
import com.edu.teamproject.model.adopt.MemberService;
import com.edu.teamproject.sns.GoogleLogin;
import com.edu.teamproject.util.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class RestMemberController {
	
	@Autowired
	private GoogleLogin googleLogin;
			
	@Autowired
	private MemberService memberService;
	
	@PostMapping("/member/volunteer/{member_idx}")
	public ResponseEntity<Message> volunteerRegist(HttpServletRequest request, @PathVariable int member_idx){
		
		
		memberService.updateByValunteer(member_idx);
		
		Message message =new Message();
		message.setMsg("자원봉사 신청처리가 완료되었습니다.\n추후 봉사관련 정보가 메일 또는 휴대폰으로 전송 될 수 있습니다.");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	
	@GetMapping("/member/authform/google")
	public ResponseEntity<Message> getGoogleUrl(HttpServletRequest request, Member member){
		
		String url = googleLogin.getGrantUrl();
		
		log.info("url is "+url);
		
		Message message = new Message();
		message.setMsg(url);
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}

}
