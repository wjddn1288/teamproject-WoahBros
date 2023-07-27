package com.edu.teamproject.client.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Shelter;
import com.edu.teamproject.util.AnimalAPI;

@Controller
public class ServiceController {
	
	@Autowired
	private AnimalAPI animalAPI;
	
	// 자원봉사 게시판 페이지 요청
	@GetMapping("/service")
	public String getServicePage(HttpServletRequest request) {
		return "client/service/servicepage";
	}

	// 보호소 페이지 요청
	@GetMapping("/loc")
	public ModelAndView getLocPage(HttpServletRequest request) {
	
		return new ModelAndView("client/service/locpage");
	}
}
