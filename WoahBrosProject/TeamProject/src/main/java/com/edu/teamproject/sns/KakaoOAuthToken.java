package com.edu.teamproject.sns;

import lombok.Data;

//구글 서버에서 전송받은 json 문자열을 자바의 객체로 담아놓기 위한 목적으로 존재하는 객체
@Data
public class KakaoOAuthToken {
	private String access_token;
	private String token_type;
	private String refresh_token;	
	private String expires_in; //유효기간
	private String scope;
	private String refresh_token_expires_in;
}
