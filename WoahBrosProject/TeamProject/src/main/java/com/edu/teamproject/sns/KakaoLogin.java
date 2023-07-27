package com.edu.teamproject.sns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;

//인증화면과 관련된 URL과 파라미터, 토큰을 얻기 위한 url과 파라미터를 보관할 클래서
//필수는 아니지만, url과 파라미터가 상당히 복잡하고 길기때문에, 이 클래스를 정의해두면, 
//링크를 쉽게 관리할 수 있다.
@Data
public class KakaoLogin {
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	//1)인증을 위한 변수
	private String endpoint;
	private String client_id;
	private String redirect_uri;
	private String response_type;
	
	//2)토큰을 위한 변수
	private String token_request_url;
	private String grant_type;
	
	//3)사용자 정보 조회를 위한 변수
	private String userinfo_url;
	
	
	//스프링 설정파일에서 넘겨받은 정보들을 이용하여 인증화면 링크 만들기
	public String getGrantUrl() {
		StringBuilder sb=new StringBuilder();
		sb.append(endpoint+"?client_id="+client_id);
		sb.append("&redirect_uri="+redirect_uri);
		sb.append("&response_type="+response_type);
		
		return sb.toString();
	}

}
