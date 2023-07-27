package com.edu.teamproject.client.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.model.adopt.AdoptImgService;
import com.edu.teamproject.model.adopt.AdoptService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class RestAdoptController {
	
	@Autowired
	private AdoptService adoptService;
	
	@Autowired
	private AdoptImgService adoptImgService;
	
	@PostMapping("/adopt")
	public List getAdoptList(HttpServletRequest request) {
		
		List<Adopt> adoptList=adoptService.selectAll();
		
		log.info("asdfasdf : "+ adoptList);
		
		return adoptList;
	}
}
