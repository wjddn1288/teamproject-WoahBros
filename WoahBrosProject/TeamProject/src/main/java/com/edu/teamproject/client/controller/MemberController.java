package com.edu.teamproject.client.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.edu.teamproject.domain.Member;
import com.edu.teamproject.model.adopt.MemberService;
import com.edu.teamproject.sns.GoogleLogin;
import com.edu.teamproject.sns.GoogleOauthToken;
import com.edu.teamproject.util.UserManager;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GoogleLogin googleLogin;

	@Autowired
	private MemberService userService;

	@Autowired
	private UserManager userManager;

	@GetMapping("/sns/google/callback")
	public ModelAndView callback(HttpServletRequest request, HttpSession session) {
		String code = request.getParameter("code");
		logger.info("발급된 code : " + code);

		/*--------------------------------------
		1) 토큰 취득을 위한 POST 헤더 & 바디구성
		--------------------------------------*/
		String url = googleLogin.getToken_request_url();

		// body 파라미터 구성하기
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("code", code);
		params.add("client_id", googleLogin.getClient_id());
		params.add("client_secret", googleLogin.getClient_secret());
		params.add("redirect_uri", googleLogin.getRedirect_uri());
		params.add("grant_type", googleLogin.getGrant_type());

		// header 구성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded");

		// Header + body
		HttpEntity httpEntity = new HttpEntity(params, headers);

		// 요청시도를 위한 객체 생성 -> 비동기 방식의 요청을 위한 객체
		RestTemplate restTemplate = new RestTemplate();
		// 어느 url로 요청을 시도? , 어떤 방법으로? , 요청할 객체 , 반환받을 타입
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);

		/*----------------------------------------------
		2) 토큰 요청 후 responseEntity로부터 토큰 꺼내기
		----------------------------------------------*/
		String body = responseEntity.getBody();
		logger.info("구글에서 넘겨받은 응답정보 : " + body);

		// json으로 되어있는 문자열을 파싱하여, 자바의 객체로 옮겨담자
		ObjectMapper objectMapper = new ObjectMapper();
		GoogleOauthToken oAuthToken = null;

		try {
			oAuthToken = objectMapper.readValue(body, GoogleOauthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		/*-------------------------------
		3) 토큰을 이용하여 회원정보에 접근
		-------------------------------*/
		String userinfo_url = googleLogin.getUserinfo_url();

		// get방식 요청 구성 - 정해져있음

		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oAuthToken.getAccess_token());
		HttpEntity entity = new HttpEntity(headers2);

		// 비동기객체를 이용한 get 요청
		RestTemplate restTemplate2 = new RestTemplate();
		ResponseEntity<String> userEntity = restTemplate2.exchange(userinfo_url, HttpMethod.GET, entity, String.class);

		String userBody = userEntity.getBody();

		logger.info(userBody);

		HashMap<String, Object> userMap = new HashMap<String, Object>();
		// 사용자 정보 추출
		ObjectMapper objectMapper2 = new ObjectMapper();
		try {
			userMap = objectMapper2.readValue(userBody, HashMap.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		String id = (String) userMap.get("id");
		String email = (String) userMap.get("email");
		String name = (String) userMap.get("name");

		Member member = new Member();

		member.setId(id);
		member.setEmail(email);
		member.setName(name);
		member.setSns("google");

		boolean result = userManager.loginCheck(member);

		logger.info("로그인검사결과는 : " + result);

		// db에 id 값이 있을경우와 그렇지 않은경우
		if (result) {
			// 회원가입 처리 (서비스 regist) 세션에 담자.
			userService.insert(member);
			session.setAttribute("member", member);
		} else {
			// 로그인 처리만 하자 (세션에 담자)
			Member userBySelect=userService.selectById(id);
			session.setAttribute("member", userBySelect);
		}
		ModelAndView mav = new ModelAndView("redirect:/afterLog");

		return mav;
	}

	@GetMapping("/logout")
	public ModelAndView getLogout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.invalidate();

		return new ModelAndView("redirect:/");
	}
	
	@GetMapping("/loginrequest")
	public String getLoginRequest(HttpServletRequest request) {
		return "client/loginrequest";
	}

}