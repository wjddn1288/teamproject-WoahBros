package com.edu.teamproject.aop;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.exception.MemberException;

@ControllerAdvice(annotations = Controller.class)
public class MemberGlobalException {
	
	@ExceptionHandler(MemberException.class)
	public ModelAndView handle() {
		ModelAndView mav = new ModelAndView("client/loginrequest");
		return mav;
	}
}
