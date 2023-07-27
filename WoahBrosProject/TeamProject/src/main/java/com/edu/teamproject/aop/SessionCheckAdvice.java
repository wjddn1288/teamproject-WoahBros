package com.edu.teamproject.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import com.edu.teamproject.exception.MemberException;

import lombok.extern.slf4j.Slf4j;

//@Slf4j
//로그인이 필요한 서비스에 관여하여, 로그인이 되어 잇지 않으면 로그인 에러 처리 
public class SessionCheckAdvice {
	
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws MemberException, Throwable{
		
		//반환값을 받을 변수
		Object result=null;
		
		//호출하려는 클래스와 그 클래스의 매개변수
		Class targetClass=joinPoint.getTarget().getClass();
		Object[] args = joinPoint.getArgs();

		//호출하려는 클래스의 request 를 추출하여 session에 값이 채워져 있는지 확인한다.
		HttpServletRequest request=null;
		HttpSession session = null;
		
		for(int a=0;a<args.length;a++) {
			if(args[a] instanceof HttpServletRequest ) {
				request=(HttpServletRequest)args[a];
			}
		}
		//로그인을 체크하는 경우와 하지않는 경우를 나눈다.
		String uri = request.getRequestURI();
		
		if(
				uri.equals("/") ||
				uri.equals("/admin") || //관리자페이지 
				uri.equals("/adopt") ||
				uri.equals("/report") ||
				uri.equals("/service") ||
				uri.equals("/best") ||
				uri.equals("/loc") ||
				uri.equals("/login") ||
				uri.equals("/loginrequest") ||
				uri.equals("/shop") ||
				uri.equals("/contact") ||
				
				uri.equals("/logout") ||
				
				uri.equals("/rest/loc") ||
				
				uri.equals("/rest/adopt") ||
				uri.equals("/adopt/detail") ||
				
				uri.equals("/rest/member/authform/google") ||
				uri.equals("/rest/member/authform/kakao") ||
				uri.equals("/rest/member/authform/naver") ||
				
				uri.equals("/sns/google/callback") ||
				uri.equals("/sns/kakao/callback") ||
				uri.equals("/sns/naver/callback")
			) {
				result=joinPoint.proceed();
		}else {
			session = request.getSession();
			if(session.getAttribute("member")==null) {
				throw new MemberException("로그인이 필요한 서비스 입니다.");
			}
			result=joinPoint.proceed();
		}
		return result;
	} 
}
