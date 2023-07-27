package com.edu.teamproject.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.model.adopt.AdoptService;

@Controller
public class ExcellController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AdoptService adoptService;
	
	@PostMapping("/adopt/excell")
	public ModelAndView getExcellPrev(HttpServletRequest request) {
		
		String category=request.getParameter("category1");
		String keyword=request.getParameter("keyword1");
		
		List<Adopt> adoptList = null;

		System.out.println("엑셀처리위해 넘어온 categrogy is"+ category );
		System.out.println("엑셀처리위해 넘어온 keyword is"+ keyword );
		System.out.println("category.length is .." + category.length());
		System.out.println("keyword.length is .." + keyword.length());
		System.out.println("category is .." + category);
		System.out.println("keyword is .." + keyword);
		
		
		if(category.length()<1 || keyword.length()<1) { //아무것도 넘어온 파라미터가 없다면...
			adoptList = adoptService.selectAll();
			System.out.println(1);
		}else {
			
			System.out.println(2);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("category", category); // 사용자가 선택한 select 박스의 값
			
			if(category.equals("status") && keyword.equals("입양중")) {
				map.put("keyword", "0");								
			}else if (category.equals("status") && keyword.equals("입양완료")) {
				map.put("keyword", "1");				
			}else {
				map.put("keyword", keyword); // 사용자가 입력한 키워드 텍스트의 값
			}
			adoptList = adoptService.selectBySearch(map);
		}
		System.out.println(3);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adoptList",adoptList);
		mav.setViewName("admin/excellPage");
		
		return mav;
		//return "admin/adopt/excellPrev";
	}
}
