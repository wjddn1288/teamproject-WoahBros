package com.edu.teamproject.client.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Shelter;
import com.edu.teamproject.util.AnimalAPI;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class RestLocController {
	
	@Autowired
	private AnimalAPI animalAPI;
	
	@GetMapping("/loc")
	public HashMap getShelterList(HttpServletRequest request, String currentPage) {
		
		log.info("controller에서 받은 currentPage is : "+currentPage);
		HashMap<String,Object> map=null;
		
		try {
			map= (HashMap)animalAPI.ShelterApi(currentPage);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return map; 
	}
}
