package com.edu.teamproject.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Admin;
import com.edu.teamproject.exception.AdminException;
import com.edu.teamproject.model.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AdminService adminService;
	
/*	
	//로그인 요청 처리 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, Admin admin) {
		//3단계: 
		adminService.select(admin);
		
		ModelAndView mav = new ModelAndView("redirect:/admin/main");
		
		return mav;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView getMain(HttpServletRequest request) {
		logger.info("관리자 메인 호출됨");
		
		//로그인 인증 여부를 따져봐야 한다...
		HttpSession session = request.getSession();
		Admin admin=(Admin)session.getAttribute("admin");
		
		ModelAndView mav = new ModelAndView();
		
		if(admin==null) {
			throw new AdminException("로그인이 필요한 서비스입니다");
		}else {
			mav.setViewName("/admin/main"); // 로그인이 되었다면
		}
		
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	 public String login() {
	  return "admin/login";
	}
*/	
	@RequestMapping("/login")
	public ModelAndView login_check(@ModelAttribute Admin admin, HttpSession session) {
	 Admin name = adminService.select(admin, session);  
	 ModelAndView mav = new ModelAndView();
	 
	  if (name != null) { // 로그인 성공 시
	   mav.setViewName("/admin"); // 뷰의 이름
	   } else { // 로그인 실패 시
	     mav.setViewName("admin/login"); 		
	     mav.addObject("message", "error");
	     }
	     return mav;
	   }
	   
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
	adminService.logout(session); 
	 mav.setViewName("admin/login"); 
	 mav.addObject("message", "logout"); 
	  return mav;
	  }
}
