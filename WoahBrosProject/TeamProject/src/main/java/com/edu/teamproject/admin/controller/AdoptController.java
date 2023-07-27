package com.edu.teamproject.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Adopt;
import com.edu.teamproject.domain.AdoptImg;
import com.edu.teamproject.model.adopt.AdoptImgService;
import com.edu.teamproject.model.adopt.AdoptService;

@Controller
public class AdoptController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdoptService adoptService;

	@Autowired
	private AdoptImgService adoptImgService;

	// 입양리스트 페이지 요청
	@GetMapping("/adopt/list")
	public ModelAndView getAdoptList(HttpServletRequest request) {
		
		List<Adopt> adoptList=adoptService.selectAll();

		ModelAndView mav = new ModelAndView();
		mav.addObject("adoptList", adoptList);
		mav.setViewName("admin/adopt/adoptListPage");

		return mav;
	}

	// 입양등록폼 요청
	@GetMapping("/adopt/registform")
	public String getAdoptRegist() {
		return "admin/adopt/adoptRegistPage";
	}

	@GetMapping("/adopt/detail")
	public ModelAndView getDetail(int adopt_idx, HttpServletRequest request) {
		logger.info("넘어온 idx" + adopt_idx);

		Adopt adopt = adoptService.select(adopt_idx);

		List<AdoptImg> adoptImgList = adoptImgService.selectByAdopt(adopt.getAdopt_idx());

		adopt.setAdoptImgList(adoptImgList);

		ServletContext application = request.getSession().getServletContext();
		String path = application.getRealPath("/resources/data/");

		ModelAndView mav = new ModelAndView();
		mav.addObject("adopt", adopt);
		mav.addObject("path", path);

		mav.setViewName("admin/adopt/adoptDetailPage");

		return mav;
	}

	@PostMapping("/adopt/del")
	public ModelAndView del(Adopt adopt) {

		adoptService.delete(adopt.getAdopt_idx());

		return new ModelAndView("redirect:list");
	}

	// 검색 기능을 통한 입양 리스트
	@PostMapping("/adopt/search")
	public ModelAndView getListBySearch(HttpServletRequest request) {

		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");

		logger.info("category is " + category);
		logger.info("keyword is " + keyword.length());

		List<Adopt> adoptList = null;

		if (category.length() < 1 || keyword.length() < 1) { // 아무것도 넘어온 파라미터가 없다면...
			adoptList = adoptService.selectAll();

		} else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("category", category); // 사용자가 선택한 select 박스의 값
			map.put("keyword", keyword); // 사용자가 입력한 키워드 텍스트의 값

			if (category.equals("status") && keyword.equals("입양중")) {
				map.put("keyword", "0");
			} else if (category.equals("status") && keyword.equals("입양완료")) {
				map.put("keyword", "1");
			} else {
				map.put("keyword", keyword); // 사용자가 입력한 키워드 텍스트의 값
			}

			adoptList = adoptService.selectBySearch(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("adoptList",adoptList);
		mav.addObject("category", category);
		mav.addObject("keyword", keyword);

		mav.setViewName("admin/adopt/adoptListPage");

		return mav;
	}

}