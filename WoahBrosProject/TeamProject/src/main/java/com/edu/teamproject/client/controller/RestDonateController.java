package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Donate;
import com.edu.teamproject.model.donate.DonateService;
import com.edu.teamproject.util.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class RestDonateController {
	
	@Autowired
	private DonateService donateService;
	
	@PostMapping("/donate")
	public ResponseEntity<Message> doDonate(HttpServletRequest request , @RequestBody Donate donate){

		donateService.insert(donate);
		
		Message message = new Message();
		message.setMsg("donate 등록 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
}
