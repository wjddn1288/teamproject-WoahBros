package com.edu.teamproject.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.exception.MemberException;
import com.edu.teamproject.util.Message;

@Controller
public class ClientController {

	@GetMapping("/")
	public String getMain(HttpServletRequest request) {
		return "client/index";
	}
	
	@GetMapping("/afterLog")
	public String getMainAfterLog(HttpServletRequest request) {
		return "client/indexAfferLogin";
	}
	
	
	
	@GetMapping("/contact")
	public String getContactPage(HttpServletRequest request) {
		return "client/contact";
	}
	
	@GetMapping("/login")
	public String getLoginPage(HttpServletRequest request) {
		return "client/loginpage";
	}
	
	@GetMapping("/addpage")
	public String getdefaultpage(HttpServletRequest request) {
		return "client/default";
	}
	
	
	@GetMapping("/sum")
	public String getsum(HttpServletRequest request) {
		return "client/sumpage";
	}
	
	@ExceptionHandler(MemberException.class)
	public String Userhandle (MemberException e){
		
		return "client/loginrequest";
	}
}
 