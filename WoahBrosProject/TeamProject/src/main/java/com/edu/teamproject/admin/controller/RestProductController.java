package com.edu.teamproject.admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Product;
import com.edu.teamproject.exception.ProductException;
import com.edu.teamproject.exception.ProductImgException;
import com.edu.teamproject.exception.UploadException;
import com.edu.teamproject.model.product.ProductService;
import com.edu.teamproject.util.Message;

//상품 관련 비동기 요청 처리하는 하위 컨트롤러
@RestController
@RequestMapping("/rest")
public class RestProductController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductService productService;
	
	// 상품 등록 요청 처리
	@PostMapping("/product")
	public ResponseEntity<Message> regist(Product product, HttpServletRequest request){
		logger.info("넘어온 상품은"+ product);
		
		ServletContext application=request.getSession().getServletContext();
		String path=application.getRealPath("/resources/admin/productdata/");
		logger.info("저장 경로는"+path);
		
		//3단계
		productService.regist(product, path);
		
		Message message= new Message();
		message.setMsg("상품 등록에 성공했습니다.");
		
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	//상품 수정
	@PutMapping("/product")
	public ResponseEntity<Message> edit(@RequestBody Product product){
		
		logger.info("넘어온 product 정보는 "+ product);
		
		productService.update(product);
		
		Message message = new Message();
		message.setMsg("상품수정 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	//상품 등록 예외
	@ExceptionHandler(ProductException.class)
	public ResponseEntity<Message> handle(ProductException e){
		Message message = new Message();
		message.setMsg(e.getMessage());
	
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
	
	//상품 업로드 예외
	@ExceptionHandler(UploadException.class)
	public ResponseEntity<Message> handle(UploadException e){
		Message message = new Message();
		message.setMsg(e.getMessage());
	
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	
	//상품 이미지 예외
	@ExceptionHandler(ProductImgException.class)
	public ResponseEntity<Message> handle(ProductImgException e){
		Message message = new Message();
		message.setMsg(e.getMessage());
	
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	
}
