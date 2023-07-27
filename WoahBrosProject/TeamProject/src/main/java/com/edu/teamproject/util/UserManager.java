package com.edu.teamproject.util;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.edu.teamproject.domain.Member;
import com.edu.teamproject.model.adopt.MemberService;

public class UserManager {
	
	@Autowired
	private MemberService userService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public boolean loginCheck(Member user) {
		
		List<Member> userList=userService.selectAll();
		
		boolean result=true;
		
		for(int a=0;a<userList.size();a++) {
			Member userByDB =userList.get(a);
			
			logger.info("추출한 user"+ userByDB);
			
			if(userByDB.getId().equals(user.getId())) {
				result=false;
				break;
			}
		}
		return result;
	}
}
