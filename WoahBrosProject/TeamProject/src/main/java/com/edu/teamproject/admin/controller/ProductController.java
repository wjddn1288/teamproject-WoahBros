package com.edu.teamproject.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Category;
import com.edu.teamproject.domain.Product;
import com.edu.teamproject.domain.ProductImg;
import com.edu.teamproject.model.category.CategoryService;
import com.edu.teamproject.model.product.ProductImgService;
import com.edu.teamproject.model.product.ProductService;

@Controller
public class ProductController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImgService productImgService;
	
	//상품 리스트 페이지 요청
	@GetMapping("/product/list") 
	public ModelAndView getProductList(HttpServletRequest request) {
		
		//3단계
		List<Product> productList=productService.selectAll();
		
		//4단계
		ModelAndView mav=new ModelAndView("admin/shop/productListPage");
		mav.addObject("productList", productList);
		
		return mav;
	}
	
	// 수정중 -------------------------------------------
	@GetMapping("/product/list2") 
	public ModelAndView getProductList2(HttpServletRequest request) {
		
		//3단계
		List<Product> productList=productService.selectAll();
		
		//4단계
		ModelAndView mav=new ModelAndView("admin/shop/productListPage2");
		mav.addObject("productList", productList);
		
		return mav;
	}
	// -------------------------------------------
	
	 //상품 등록폼 페이지 요청 
    @GetMapping("/product/registForm")
	public ModelAndView getForm(HttpServletRequest request) {
		
		//3단계 
		List<Category> categoryList=categoryService.selectAll();
		
		//4단계
		ModelAndView mav=new ModelAndView("admin/shop/productListPage");
		mav.addObject("categoryList", categoryList);
		
		return mav;
	}

	/*
	// 상품등록폼 요청
	@GetMapping("/product/registForm")
	public String getProductRegist() {
		return "admin/shop/productListPage";
	}
	*/
	
	//상세보기 요청
	@GetMapping("/product/detail")
	public ModelAndView getDetail(int product_idx, HttpServletRequest request) {
		
		logger.info("넘어온 product_idx 값 " + product_idx);
		
		List <Category> categoryList=categoryService.selectAll();
		//Category category=categoryService.select(category_idx);

		Product product=productService.select(product_idx);
		
		List<ProductImg> productImgList=productImgService.selectByProduct(product.getProduct_idx());
		
		product.setProductImgList(productImgList);
		
		ServletContext application = request.getSession().getServletContext();
		String path = application.getRealPath("/resources/admin/productdata/");
		
		ModelAndView mav=new ModelAndView("admin/shop/productDetailPage");
		mav.addObject("product", product);
		mav.addObject("categoryList", categoryList);
		mav.addObject("path", path);
		
		return mav;
	}
	
	@PostMapping("/product/del")
	public ModelAndView del(Product product) {
		
		productService.delete(product.getProduct_idx());
		
		return new ModelAndView("redirect:list");
	}
	
	//상품 검색
	@PostMapping("/product/search")
	public ModelAndView getListBySearch(HttpServletRequest request) {
		
		String s_category = request.getParameter("s_category");
		String keyword = request.getParameter("keyword");
		
		logger.info("s_category is " + s_category);  
		logger.info("keyword is " + keyword.length()); 

		List<Product> productList = null;
		List<Category> categoryList = null; //추가

		if(s_category.length()<1 || keyword.length()<1) {
			productList = productService.selectAll();			
			categoryList = categoryService.selectAll();			
	
		}else {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("s_category", s_category); // 사용자가 선택한 select 박스의 값
				map.put("keyword", keyword); // 사용자가 입력한 키워드 텍스트의 값
				
				productList = productService.selectBySearch(map);
				categoryList = categoryService.selectAll(); //추가
			}
		
		ModelAndView mav = new ModelAndView("admin/shop/productListPage");
		mav.addObject("productList", productList);
		mav.addObject("s_category", s_category);
		mav.addObject("keyword", keyword);
		
		//mav.setViewName("admin/shop/productListPage");
		
		return mav;
	}

}
