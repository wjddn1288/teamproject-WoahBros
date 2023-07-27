package com.edu.teamproject.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.edu.teamproject.exception.MemberException;
import com.edu.teamproject.util.Message;

@RestControllerAdvice(annotations = RestController.class)  // ControllerAdcice + @ResponseBody
public class RestMemberGlobalException {
	
	@ExceptionHandler(MemberException.class)
	public ResponseEntity<Message> handle(MemberException e){
		
		Message message = new Message();
		message.setMsg("member 글로벌 예외 : "+e.getMessage());
		
		ResponseEntity entity=new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	};
}
