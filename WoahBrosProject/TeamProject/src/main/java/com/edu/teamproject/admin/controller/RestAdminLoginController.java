package com.edu.teamproject.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.teamproject.domain.Admin;
import com.edu.teamproject.model.admin.AdminService;
import com.edu.teamproject.util.Message;

@RestController
@RequestMapping("/rest")
public class RestAdminLoginController {

	@Autowired
	private AdminService adminService;
	
	//로그인 요청 처리 
	@PostMapping("/login/admin")
	public ResponseEntity<Message> loginCheck(Admin admin, HttpServletRequest request){
		//3단계 일시키기
		Admin obj=adminService.select(admin, null);
		
		//세션에 담기
		HttpSession session=request.getSession();
		session.setAttribute("admin", obj);
			
		Message message = new Message();
		message.setMsg("관리자 로그인 성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
}
