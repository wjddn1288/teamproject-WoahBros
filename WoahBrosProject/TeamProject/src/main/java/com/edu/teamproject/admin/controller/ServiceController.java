package com.edu.teamproject.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.domain.Service;
import com.edu.teamproject.model.service.ServiceService;

@Controller
public class ServiceController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ServiceService serviceService;
	
	//봉사자모집 리스트 페이지 요청
	@GetMapping("/service/list")
	public ModelAndView getServiceList() {
		
		List<Service> serviceList= serviceService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("serviceList",serviceList);
		mav.setViewName("admin/service/serviceListPage");
		
		return mav;
	}
	
	@GetMapping("/service/registform")
	public String getServiceRegistForm() {
		return "admin/service/serviceRegistPage";
	}
	
	@GetMapping("service/detail")
	public ModelAndView getDetail(int service_idx) {
		
		logger.info("넘어온 service_idx 값 " + service_idx);
		
		Service service = serviceService.select(service_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("service",service);
		mav.setViewName("admin/service/serviceDetailPage");
		
		return mav;
	}
	
	@PostMapping("/service/del")
	public ModelAndView del(Service service) {
		
		serviceService.delete(service.getService_idx());
		
		return new ModelAndView("redirect:list");
	}
	
	@PostMapping("/service/search")
	public ModelAndView getListBySearch(HttpServletRequest request) {
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		ModelAndView mav = new ModelAndView();
		List<Service> serviceList = null;
		if(category.length()<1 || keyword.length()<1) {
			serviceList = serviceService.selectAll();			
		}else {
			HashMap<String, String> map = new HashMap<>();
			map.put("category", category);
			map.put("keyword", keyword);
			serviceList = serviceService.selectBySearch(map);
		}
		mav.addObject("serviceList", serviceList);
		mav.setViewName("admin/service/serviceListPage");
		
		return mav;
	}
}
