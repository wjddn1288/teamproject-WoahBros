package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {
	//쇼핑몰  페이지 요청
	@GetMapping("/shop")
	public String getShopPage(HttpServletRequest request) {
		return "client/shop/shoppage";
	}
	//장바구니  페이지 요청
	@GetMapping("/cart")
	public String getCartPage(HttpServletRequest request) {
		return "client/shop/cartpage";
	}
}
