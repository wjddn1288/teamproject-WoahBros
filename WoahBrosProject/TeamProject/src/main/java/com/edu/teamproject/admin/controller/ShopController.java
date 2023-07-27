package com.edu.teamproject.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.edu.teamproject.model.category.CategoryService;
import com.edu.teamproject.model.product.ProductService;

@Controller
public class ShopController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	// 상품 등록 페이지 요청
	@GetMapping("/productRegistForm")
	public String getProductRegist() {
		return "admin/shop/productRegistPage";
	}

	// 상품 목록 페이지 요청
	@GetMapping("/productList")
	public String getProductList() {
		return "admin/shop/productListPage";
	}

	// 구매 현황 페이지 요청
	@GetMapping("/orderList")
	public String getOrderList() {
		return "admin/shop/orderListPage";
	}

	// 통계 페이지 요청
	@GetMapping("/summery")
	public String getSummery() {
		return "admin/shop/summeryPage";
	}
}
