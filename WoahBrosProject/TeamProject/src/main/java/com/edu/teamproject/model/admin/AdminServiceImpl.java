package com.edu.teamproject.model.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.teamproject.domain.Admin;
import com.edu.teamproject.exception.AdminException;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public Admin select(Admin admin, HttpSession session) {
		Admin name = adminDAO.select(admin);
		
		 if (name != null) { // 세션 변수 저장
			  session.setAttribute("id", admin.getId());
			}
		 
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}
}
