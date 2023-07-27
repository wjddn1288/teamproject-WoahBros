package com.edu.teamproject.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Category;
import com.edu.teamproject.exception.CategoryException;
import com.edu.teamproject.model.category.CategoryService;
import com.edu.teamproject.util.Message;

@RestController
@RequestMapping("/rest")
public class RestCategoryController {
	/* 삭제해도됨 */
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CategoryService categoryService; 
	
	//등록 요청 처리
	@PostMapping("/category")	
	public Message regist(HttpServletRequest request, Category category) {
		//3단계
		categoryService.insert(category);
		Message message=new Message();
		message.setMsg("카테고리 등록 성공");
		
		return message;
	}
	
	//목록 요청 처리
	@GetMapping("/category")
	public List<Category> getList(HttpServletRequest request){
		return categoryService.selectAll();
	}
	
	//수정요청 처리
	@PutMapping("/category")
	public ResponseEntity<Message> edit(@RequestBody Category category) {
		logger.info("category is " + category);
		
		//3단계:
		categoryService.update(category);
		
		Message message=new Message();
		message.setMsg("수정 성공");
		ResponseEntity<Message> entity=null;
		entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	//삭제 요청 처리
	@DeleteMapping("/category/{category_idx}") 
	public ResponseEntity<Message> del(@PathVariable int category_idx) {
		logger.info("넘겨받은 category_idx is "+ category_idx);
		//3단계 일시키기
		categoryService.delete(category_idx);
		
		Message message=new Message();
		message.setMsg("삭제 성공");
		ResponseEntity<Message> entity=null;
		entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	
	@ExceptionHandler(CategoryException.class)
	public ResponseEntity<Message> handle(CategoryException e) {
		//HTTP 응답정보를 보다 세밀하게 구성하고 싶다면, http 응답 메시지를 구성할 수 있는 객체를 지원함.
		Message message=new Message();
		message.setMsg(e.getMessage());

		ResponseEntity<Message> entity=null;
		entity=new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		
		return entity;
	}
}
