package com.edu.teamproject.admin.controller;

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

import com.edu.teamproject.domain.Notice;
import com.edu.teamproject.domain.Service;
import com.edu.teamproject.model.notice.NoticeService;
import com.edu.teamproject.util.Message;

@RestController
@RequestMapping("/rest")
public class RestNoticeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private NoticeService noticeService;
	
	@PostMapping("/notice")
	public ResponseEntity<Message> regist(Notice notice){
		
		logger.info("넘어온 Notice 는 : "+notice);
		noticeService.insert(notice);
		
		Message message = new Message();
		message.setMsg("등록성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	@PutMapping("/notice")
	public ResponseEntity<Message> update(@RequestBody Notice notice){
		logger.info("수정하기 위해 넘겨받은 service" + notice);
		
		noticeService.update(notice);
		
		Message message = new Message();
		message.setMsg("수정성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message,HttpStatus.OK);
		return entity;
	}
}
