package com.edu.teamproject.sns;

import lombok.Data;

//구글 서버에서 전송받은 json 문자열을 자바의 객체로 담아놓기 위한 목적
@Data
public class GoogleOauthToken {
	private String access_token;
	private int expires_in;
	private String scope;
	private String token_type;
	private String id_token;
}