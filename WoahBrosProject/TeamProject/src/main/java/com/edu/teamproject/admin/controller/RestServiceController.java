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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Service;
import com.edu.teamproject.model.service.ServiceService;
import com.edu.teamproject.util.Message;

@RestController
@RequestMapping("/rest")
public class RestServiceController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ServiceService serviceService;
	
	@PostMapping("/service")
	public ResponseEntity<Message> regist(Service service){
		
		logger.info("넘어온 Service 은 : "+service);
		serviceService.insert(service);
		
		Message message = new Message();
		message.setMsg("등록성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	@PutMapping("/service")
	public ResponseEntity<Message> update(@RequestBody Service service){
		logger.info("수정하기 위해 넘겨받은 service" + service);
		
		serviceService.update(service);
		
		Message message = new Message();
		message.setMsg("수정성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message,HttpStatus.OK);
		return entity;
	}
}
