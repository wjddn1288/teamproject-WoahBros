package com.edu.teamproject.model.admin;

import javax.servlet.http.HttpSession;

import com.edu.teamproject.domain.Admin;

public interface AdminService {
	public Admin select(Admin admin, HttpSession session);
	public void logout(HttpSession session);
}
