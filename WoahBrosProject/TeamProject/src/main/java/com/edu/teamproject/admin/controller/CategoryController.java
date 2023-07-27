package com.edu.teamproject.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Category;

@Controller
public class CategoryController {
	/* 삭재해도됨 */
	private Logger logger=LoggerFactory.getLogger(this.getClass());

	//카테고리 관리 메인 요청
	@GetMapping("/product/category")
	public String getCategory(HttpServletRequest request) {
		return "admin/shop/category";
	}
	
	//수정요청 처리
	@PutMapping("/category/edit")
	public ModelAndView edit(HttpServletRequest request, Category category) {
		logger.info("category is "+ category);
		
		return null;
	}
}
