package com.edu.teamproject.admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.model.adopt.AdoptService;
import com.edu.teamproject.util.Message;

//비동기 요청처리 받는 컨트롤러
@RestController
@RequestMapping("/rest")
public class RestAdoptController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AdoptService adoptService;
	
	@PostMapping("/adopt")
	public ResponseEntity<Message> regist(Adopt adopt, HttpServletRequest request){
		
		logger.info("넘어온 데이터"+adopt);
	
		ServletContext application=request.getSession().getServletContext();
		String path=application.getRealPath("/resources/data/");
		logger.info("저장될 실제 경로는 "+path);
		
		//3단계 
		adoptService.regist(adopt, path);
		
		Message message = new Message();
		message.setMsg("입양등록 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);

		return entity;
	}
	
	@PutMapping("/adopt")
	public ResponseEntity<Message> edit(@RequestBody Adopt adopt){
		
		logger.info("넘어온 adopt 정보는 "+ adopt);
		
		adoptService.update(adopt);
		
		Message message = new Message();
		message.setMsg("입양수정 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	@PutMapping("/adopStatus")
	public ResponseEntity<Message> adoptSuccess(@RequestBody Adopt adopt){
		
		logger.info("입양 처리위해 넘어온 adopt 정보는 "+ adopt);
	
		if(adopt.getStatus()==0) {
			adopt.setStatus(1);
		}else {
			adopt.setStatus(0);			
		}
		
		adoptService.update(adopt);
		
		Message message = new Message();
		message.setMsg("입양처리 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
}
